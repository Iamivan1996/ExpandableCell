//
//  ExpandableCell.swift
//  ExpandableCell
//
//  Created by Seungyoun Yi on 2017. 8. 10..
//  Copyright © 2017년 SeungyounYi. All rights reserved.
//

import UIKit

open class ExpandableCell: UITableViewCell {
    open var arrowImageView: UIImageView!
    open var rightMargin: CGFloat = 16
    open var highlightAnimation = HighlightAnimation.animated
    private var isOpen = false
    private var initialExpansionAllowed = true

    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        initView()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    open override func awakeFromNib() {
        super.awakeFromNib()

        initView()
    }

    func initView() {
        arrowImageView = UIImageView()
        arrowImageView.image = UIImage(named: "btn_arrowdown", in: Bundle(for: ExpandableCell.self), compatibleWith: nil)
        self.contentView.addSubview(arrowImageView)
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()

        let width = self.bounds.width
        let height = self.bounds.height

        arrowImageView.contentMode = .scaleAspectFit
        arrowImageView.frame = CGRect(x: width - 40, y: height / 2  , width: 15, height: 15)    }

    func open() {
        self.isOpen = true
        self.arrowImageView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi * 0.5 )  )
    }

    func close() {
        self.isOpen = false
        self.arrowImageView.transform = .identity

    }
    
    func isInitiallyExpandedInternal() -> Bool {
        return self.initialExpansionAllowed && self.isInitiallyExpanded()
    }

    open func isExpanded() -> Bool {
        return isOpen
    }
    
    open func isInitiallyExpanded() -> Bool {
        return false
    }
    
    open func isSelectable() -> Bool {
        return false
    }
}

public enum HighlightAnimation {
    case animated
    case none
}
