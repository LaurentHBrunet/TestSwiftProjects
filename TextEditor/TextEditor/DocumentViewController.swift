//
//  DocumentViewController.swift
//  TextEditor
//
//  Created by Laurent on 2019-05-14.
//  Copyright © 2019 Laurent Henault-Brunet. All rights reserved.
//

import UIKit
import Sourceful

class DocumentViewController: UIViewController, SyntaxTextViewDelegate {
    
    @IBOutlet var textView: SyntaxTextView!
    var document: Document?
    
    let lexer = SwiftLexer()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        textView.theme = DefaultSourceCodeTheme()
        textView.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissDocumentViewController))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTaped))
        
        
        // Access the document
        document?.open() { success in
            if success {
                // Display the content of the document, e.g.:
                self.textView.text = self.document?.text ?? ""
                self.title = self.document?.fileURL.deletingPathExtension().lastPathComponent
            } else {
                // Make sure to handle the failed import appropriately, e.g., by presenting an error message to the user.
            }
        }
    }
    
    @IBAction func dismissDocumentViewController() {
        document?.text = textView.text
        document?.updateChangeCount(.done)
        
        dismiss(animated: true) {
            self.document?.close(completionHandler: nil)
        }
    }
    
    @objc func shareTaped(sender: UIBarButtonItem) {
        guard let url = document?.fileURL else { return }
        
        let ac = UIActivityViewController(activityItems: [url], applicationActivities: nil)
        ac.popoverPresentationController?.barButtonItem = sender
        present(ac, animated: true)
    }
    
    func lexerForSource(_ source: String) -> Lexer {
        return lexer
    }
}
