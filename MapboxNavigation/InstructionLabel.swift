import UIKit
import MapboxCoreNavigation
import MapboxDirections

/// :nodoc:
@objc(MBInstructionLabel)
open class InstructionLabel: StylableLabel, InstructionPresenterDataSource {
    typealias AvailableBoundsHandler = () -> (CGRect)
    var availableBounds: AvailableBoundsHandler!
    var shieldHeight: CGFloat = 30

    var instruction: VisualInstruction? {
        didSet {
            guard let instruction = instruction else {
                text = nil
                instructionPresenter = nil
                return
            }
            let presenter = InstructionPresenter(instruction, dataSource: self)
            attributedText = presenter.attributedText()
            presenter.onShieldDownload = { [weak self] (attributedText: NSAttributedString) in
                DispatchQueue.main.async {
                    self?.attributedText = attributedText
                }
            }
            instructionPresenter = presenter
        }
    }

    private var instructionPresenter: InstructionPresenter?
}