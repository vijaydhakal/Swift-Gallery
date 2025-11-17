import UIKit
import AVFoundation

/*
 NOTE: To run this, you must:
 1. Add this file to an iOS project.
 2. Set an instance of `MainViewController` as the root view controller of a `UINavigationController`.
 3. Add the `NSMicrophoneUsageDescription` key to your app's `Info.plist` file with a string explaining why you need microphone access (e.g., "To record audio messages.").
*/

// MARK: - Main View Controller
class MainViewController: UIViewController, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate {

    // A lazy var for the popup view
    private lazy var audioPopupView: AudioRecorderPopupView = {
        // Create the popup with a 250pt height
        let frame = CGRect(
            x: 0,
            y: view.bounds.height, // Start off-screen (bottom)
            width: view.bounds.width,
            height: 250
        )
        
        let popup = AudioRecorderPopupView(frame: frame, cancelAction: { [weak self] in
            self?.togglePopup(show: false)
        })
        
        popup.translatesAutoresizingMaskIntoConstraints = false
        return popup
    }()

    // A semi-transparent overlay
    private lazy var overlayView: UIView = {
        let view = UIView(frame: self.view.bounds)
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        view.alpha = 0
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(micButtonTapped)))
        return view
    }()
    
    // Add a sample Table View
    private let tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .insetGrouped)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tv
    }()
    
    // Sample data
    private var sampleData = ["Sample Item 1", "Sample Item 2", "Sample Note 3", "Another Item", "More Data", "Tap a row", "List Item 7"]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGroupedBackground
        title = "Recorder App"
        
        setupNavBar()
        setupSampleUI() // Add the sample UI
        setupPopupViews() // Add the popup views on top
    }

    private func setupNavBar() {
        // 1. Setup Search Bar
        let searchController = UISearchController(searchResultsController: nil)
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search..."
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false

        // 2. Setup Microphone Button
        let micImage = UIImage(systemName: "mic.fill")
        let micButton = UIBarButtonItem(image: micImage, style: .plain, target: self, action: #selector(micButtonTapped))
        navigationItem.rightBarButtonItem = micButton
    }
    
    private func setupSampleUI() {
        // Add and constrain the table view
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupPopupViews() {
        // Add overlay and popup to the main view, but keep them hidden
        view.addSubview(overlayView)
        view.addSubview(audioPopupView)
        
        // Setup constraints for the popup
        NSLayoutConstraint.activate([
            audioPopupView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            audioPopupView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            audioPopupView.heightAnchor.constraint(equalToConstant: 250),
            // We control the vertical position with the `transform` property for animation
        ])
    }

    @objc private func micButtonTapped() {
        // Toggle the popup's visibility
        let isPopupVisible = audioPopupView.transform == .identity
        togglePopup(show: !isPopupVisible)
    }

    private func togglePopup(show: Bool) {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
            if show {
                // Show overlay
                self.overlayView.alpha = 1.0
                
                // Move popup up
                // We calculate the Y position to be at the bottom of the safe area
                let bottomPadding = self.view.safeAreaInsets.bottom
                self.audioPopupView.transform = CGAffineTransform(translationX: 0, y: -(250 + bottomPadding))
            } else {
                // Hide overlay
                self.overlayView.alpha = 0.0
                
                // Move popup back down (off-screen)
                self.audioPopupView.transform = .identity
                
                // Stop recording if user cancels
                self.audioPopupView.stopRecording()
            }
        })
    }
    
    // MARK: - UITableViewDataSource & Delegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sampleData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = sampleData[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let alert = UIAlertController(title: "Tapped Cell", message: "You tapped on \(sampleData[indexPath.row])", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Sample Content"
    }
}

// MARK: - Audio Recorder Popup View
class AudioRecorderPopupView: UIView, AVAudioRecorderDelegate {

    // Audio properties
    private var recordingSession: AVAudioSession!
    private var audioRecorder: AVAudioRecorder?
    private var isRecording = false

    // Action closures
    private var cancelAction: () -> Void

    // UI Elements
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.text = "Tap mic to record"
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var recordButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(systemName: "mic.circle.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 64))
        button.setImage(image, for: .normal)
        button.tintColor = .red
        button.addTarget(self, action: #selector(recordButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Cancel", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17)
        button.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Save", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        button.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isHidden = true // Hide until recording is finished
        return button
    }()

    // Initializer
    init(frame: CGRect, cancelAction: @escaping () -> Void) {
        self.cancelAction = cancelAction
        super.init(frame: frame)
        
        backgroundColor = .systemBackground
        layer.cornerRadius = 20
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner] // Rounded top corners
        
        setupAudioSession()
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UI Setup
    private func setupUI() {
        addSubview(statusLabel)
        addSubview(recordButton)
        addSubview(cancelButton)
        addSubview(saveButton)

        NSLayoutConstraint.activate([
            // Status Label
            statusLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            statusLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            statusLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            // Record Button
            recordButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            recordButton.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 20),
            recordButton.widthAnchor.constraint(equalToConstant: 80),
            recordButton.heightAnchor.constraint(equalToConstant: 80),
            
            // Cancel Button
            cancelButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            cancelButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
            
            // Save Button
            saveButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            saveButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }

    // MARK: - Audio Logic
    private func setupAudioSession() {
        recordingSession = AVAudioSession.sharedInstance()

        do {
            try recordingSession.setCategory(.playAndRecord, mode: .default)
            try recordingSession.setActive(true)
            
            // **FIXED LINE:**
            // Use the static method on AVAudioApplication instead
            AVAudioApplication.requestRecordPermission() { [unowned self] allowed in
                DispatchQueue.main.async {
                    if !allowed {
                        self.statusLabel.text = "Microphone access denied."
                        self.recordButton.isEnabled = false
                    }
                }
            }
        } catch {
            statusLabel.text = "Failed to set up audio session."
            recordButton.isEnabled = false
        }
    }

    @objc private func recordButtonTapped() {
        if isRecording {
            stopRecording()
        } else {
            startRecording()
        }
    }

    private func startRecording() {
        let audioFilename = getDocumentsDirectory().appendingPathComponent("recording.m4a")

        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]

        do {
            audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings)
            audioRecorder?.delegate = self
            audioRecorder?.record()

            isRecording = true
            updateUIForRecording(true)
        } catch {
            stopRecording() // Call stop to clean up
            statusLabel.text = "Recording failed to start."
        }
    }

    func stopRecording() {
        guard audioRecorder != nil else { return }
        
        audioRecorder?.stop()
        audioRecorder = nil
        isRecording = false
        updateUIForRecording(false)
    }
    
    private func updateUIForRecording(_ isRecording: Bool) {
        if isRecording {
            statusLabel.text = "Recording..."
            recordButton.tintColor = .systemBlue
            let image = UIImage(systemName: "stop.circle.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 64))
            recordButton.setImage(image, for: .normal)
            saveButton.isHidden = true
        } else {
            statusLabel.text = "Recording finished"
            recordButton.tintColor = .red
            let image = UIImage(systemName: "mic.circle.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 64))
            recordButton.setImage(image, for: .normal)
            saveButton.isHidden = false
        }
    }

    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    // MARK: - Button Actions

    @objc private func cancelButtonTapped() {
        stopRecording() // Stop if it's in progress
        statusLabel.text = "Tap mic to record" // Reset label
        saveButton.isHidden = true
        cancelAction() // Call closure to dismiss
    }
    
    @objc private func saveButtonTapped() {
        // Here you would save/process the recorded file
        // The file is at `getDocumentsDirectory().appendingPathComponent("recording.m4a")`
        print("Recording saved (not really, but this is where you'd do it).")
        
        statusLabel.text = "Tap mic to record"
        saveButton.isHidden = true
        cancelAction() // Dismiss after saving
    }
    
    // MARK: - AVAudioRecorderDelegate
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if !flag {
            stopRecording()
            statusLabel.text = "Recording failed."
        }
    }
}
