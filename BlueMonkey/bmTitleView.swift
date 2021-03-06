//
// bmTitleView.swift
// Generated by Core Animator version 1.0.5 on 5/4/15.
//
// DO NOT MODIFY THIS FILE. IT IS AUTO-GENERATED AND WILL BE OVERWRITTEN
//

import UIKit

@IBDesignable
class bmTitleView : UIView {

	var viewsByName: [String : UIView]!

	// - MARK: Life Cycle

	convenience override init() {
		self.init(frame: CGRect(x: 0, y: 0, width: 768, height: 1024))
	}

	override init(frame: CGRect) {
		super.init(frame: frame)
        println("init titleView")
		self.setupHierarchy()
	}

	required init(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		self.setupHierarchy()
	}

	// - MARK: Scaling

	override func layoutSubviews() {
		super.layoutSubviews()

		if let scalingView = self.viewsByName["__scaling__"] {
			var xScale = self.bounds.size.width / scalingView.bounds.size.width
			var yScale = self.bounds.size.height / scalingView.bounds.size.height
			switch contentMode {
			case .ScaleToFill:
				break
			case .ScaleAspectFill:
				let scale = max(xScale, yScale)
				xScale = scale
				yScale = scale
			default:
				let scale = min(xScale, yScale)
				xScale = scale
				yScale = scale
			}
			scalingView.transform = CGAffineTransformMakeScale(xScale, yScale)
			scalingView.center = CGPoint(x:CGRectGetMidX(self.bounds), y:CGRectGetMidY(self.bounds))
		}
	}

	// - MARK: Setup

	func setupHierarchy() {
		var viewsByName: [String : UIView] = [:]
		let bundle = NSBundle(forClass:self.dynamicType)
		let __scaling__ = UIView()
		__scaling__.bounds = CGRect(x:0, y:0, width:768, height:1024)
		__scaling__.center = CGPoint(x:384.0, y:512.0)
		__scaling__.layer.masksToBounds = true
		self.addSubview(__scaling__)
		viewsByName["__scaling__"] = __scaling__

		let sky = UIImageView()
		sky.bounds = CGRect(x:0, y:0, width:2147.0, height:764.0)
		var imgSky: UIImage!
		if let imagePath = bundle.pathForResource("sky.jpg", ofType:nil) {
			imgSky = UIImage(contentsOfFile:imagePath)
		}
		sky.image = imgSky
		sky.contentMode = .Center;
		sky.layer.position = CGPoint(x:-305.500, y:642.000)
		__scaling__.addSubview(sky)
		viewsByName["sky"] = sky

		let clouds = UIImageView()
		clouds.bounds = CGRect(x:0, y:0, width:2147.0, height:504.0)
		var imgClouds: UIImage!
		if let imagePath = bundle.pathForResource("clouds.png", ofType:nil) {
			imgClouds = UIImage(contentsOfFile:imagePath)
		}
		clouds.image = imgClouds
		clouds.contentMode = .Center;
		clouds.layer.position = CGPoint(x:-305.500, y:512.000)
		__scaling__.addSubview(clouds)
		viewsByName["clouds"] = clouds

		let mountains = UIImageView()
		mountains.bounds = CGRect(x:0, y:0, width:2154.0, height:325.0)
		var imgMountains: UIImage!
		if let imagePath = bundle.pathForResource("mountains", ofType:"png") {
			imgMountains = UIImage(contentsOfFile:imagePath)
		}
		mountains.image = imgMountains
		mountains.contentMode = .Center;
		mountains.layer.position = CGPoint(x:-309.000, y:861.500)
		__scaling__.addSubview(mountains)
		viewsByName["mountains"] = mountains

		let bird00 = UIImageView()
		bird00.bounds = CGRect(x:0, y:0, width:50.0, height:50.0)
		var imgBird00: UIImage!
		if let imagePath = bundle.pathForResource("bird_00.png", ofType:nil) {
			imgBird00 = UIImage(contentsOfFile:imagePath)
		}
		bird00.image = imgBird00
		bird00.contentMode = .Center;
		bird00.layer.position = CGPoint(x:-36.000, y:702.000)
		__scaling__.addSubview(bird00)
		viewsByName["bird_00"] = bird00

		let backgroundTrees = UIImageView()
		backgroundTrees.bounds = CGRect(x:0, y:0, width:2591.0, height:963.0)
		var imgBackgroundTrees: UIImage!
		if let imagePath = bundle.pathForResource("background_trees.png", ofType:nil) {
			imgBackgroundTrees = UIImage(contentsOfFile:imagePath)
		}
		backgroundTrees.image = imgBackgroundTrees
		backgroundTrees.contentMode = .Center;
		backgroundTrees.layer.position = CGPoint(x:-527.500, y:602.500)
		__scaling__.addSubview(backgroundTrees)
		viewsByName["background_trees"] = backgroundTrees

		let trees = UIImageView()
		trees.bounds = CGRect(x:0, y:0, width:2545.0, height:1400.0)
		var imgTrees: UIImage!
		if let imagePath = bundle.pathForResource("trees.png", ofType:nil) {
			imgTrees = UIImage(contentsOfFile:imagePath)
		}
		trees.image = imgTrees
		trees.contentMode = .Center;
		trees.layer.position = CGPoint(x:-504.500, y:512.000)
		__scaling__.addSubview(trees)
		viewsByName["trees"] = trees

		let bmSwing00 = UIImageView()
		bmSwing00.bounds = CGRect(x:0, y:0, width:768.0, height:1024.0)
		var imgBmSwing00: UIImage!
		if let imagePath = bundle.pathForResource("bm_swing00.png", ofType:nil) {
			imgBmSwing00 = UIImage(contentsOfFile:imagePath)
		}
		bmSwing00.image = imgBmSwing00
		bmSwing00.contentMode = .Center;
		bmSwing00.layer.position = CGPoint(x:384.000, y:568.000)
		__scaling__.addSubview(bmSwing00)
		viewsByName["bm_swing00"] = bmSwing00

		self.viewsByName = viewsByName
	}

	// - MARK: background trees

	func addBackgroundTreesAnimation() {
		addBackgroundTreesAnimationWithBeginTime(0, fillMode: kCAFillModeBoth, removedOnCompletion: false)
	}

	func addBackgroundTreesAnimation(#removedOnCompletion: Bool) {
		addBackgroundTreesAnimationWithBeginTime(0, fillMode: removedOnCompletion ? kCAFillModeRemoved : kCAFillModeBoth, removedOnCompletion: removedOnCompletion)
	}

	func addBackgroundTreesAnimationWithBeginTime(beginTime: CFTimeInterval, fillMode: String, removedOnCompletion: Bool) {
		let linearTiming = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)

		let backgroundTreesTranslationXAnimation = CAKeyframeAnimation(keyPath: "transform.translation.x")
		backgroundTreesTranslationXAnimation.duration = 10.000
		backgroundTreesTranslationXAnimation.values = [0.000 as Float, 1820.000 as Float]
		backgroundTreesTranslationXAnimation.keyTimes = [0.000 as Float, 1.000 as Float]
		backgroundTreesTranslationXAnimation.timingFunctions = [linearTiming]
		backgroundTreesTranslationXAnimation.repeatCount = HUGE
		backgroundTreesTranslationXAnimation.beginTime = beginTime
		backgroundTreesTranslationXAnimation.fillMode = fillMode
		backgroundTreesTranslationXAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["background_trees"]?.layer.addAnimation(backgroundTreesTranslationXAnimation, forKey:"background trees_TranslationX")
	}

	func removeBackgroundTreesAnimation() {
		self.viewsByName["background_trees"]?.layer.removeAnimationForKey("background trees_TranslationX")
	}

	// - MARK: bird02

	func addBird02Animation() {
		addBird02AnimationWithBeginTime(0, fillMode: kCAFillModeBoth, removedOnCompletion: false)
	}

	func addBird02Animation(#removedOnCompletion: Bool) {
		addBird02AnimationWithBeginTime(0, fillMode: removedOnCompletion ? kCAFillModeRemoved : kCAFillModeBoth, removedOnCompletion: removedOnCompletion)
	}

	func addBird02AnimationWithBeginTime(beginTime: CFTimeInterval, fillMode: String, removedOnCompletion: Bool) {
		let linearTiming = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
		let instantTiming = CAMediaTimingFunction(name: kCAMediaTimingFunctionDefault)

		let bird00OpacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
		bird00OpacityAnimation.duration = 5.000
		bird00OpacityAnimation.values = [0.800 as Float, 0.800 as Float]
		bird00OpacityAnimation.keyTimes = [0.000 as Float, 1.000 as Float]
		bird00OpacityAnimation.timingFunctions = [linearTiming]
		bird00OpacityAnimation.beginTime = beginTime
		bird00OpacityAnimation.fillMode = fillMode
		bird00OpacityAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["bird_00"]?.layer.addAnimation(bird00OpacityAnimation, forKey:"bird02_Opacity")

		let bird00ImageContentsAnimation = CAKeyframeAnimation(keyPath: "contents")
		bird00ImageContentsAnimation.duration = 0.870
		bird00ImageContentsAnimation.values = [UIImage(named: "bird_00")!.CGImage, UIImage(named: "bird_00")!.CGImage, UIImage(named: "bird_00")!.CGImage, UIImage(named: "bird_01")!.CGImage, UIImage(named: "bird_01")!.CGImage, UIImage(named: "bird_02")!.CGImage, UIImage(named: "bird_02")!.CGImage, UIImage(named: "bird_03")!.CGImage, UIImage(named: "bird_03")!.CGImage, UIImage(named: "bird_04")!.CGImage, UIImage(named: "bird_04")!.CGImage, UIImage(named: "bird_05")!.CGImage, UIImage(named: "bird_05")!.CGImage, UIImage(named: "bird_06")!.CGImage, UIImage(named: "bird_06")!.CGImage, UIImage(named: "bird_07")!.CGImage, UIImage(named: "bird_07")!.CGImage, UIImage(named: "bird_08")!.CGImage, UIImage(named: "bird_08")!.CGImage, UIImage(named: "bird_09")!.CGImage, UIImage(named: "bird_09")!.CGImage, UIImage(named: "bird_10")!.CGImage, UIImage(named: "bird_10")!.CGImage, UIImage(named: "bird_11")!.CGImage, UIImage(named: "bird_11")!.CGImage, UIImage(named: "bird_12")!.CGImage, UIImage(named: "bird_12")!.CGImage, UIImage(named: "bird_13")!.CGImage, UIImage(named: "bird_13")!.CGImage, UIImage(named: "bird_14")!.CGImage]
		bird00ImageContentsAnimation.keyTimes = [0.000 as Float, 0.356 as Float, 0.402 as Float, 0.402 as Float, 0.448 as Float, 0.448 as Float, 0.494 as Float, 0.494 as Float, 0.540 as Float, 0.540 as Float, 0.586 as Float, 0.586 as Float, 0.632 as Float, 0.632 as Float, 0.678 as Float, 0.678 as Float, 0.724 as Float, 0.724 as Float, 0.770 as Float, 0.770 as Float, 0.816 as Float, 0.816 as Float, 0.861 as Float, 0.862 as Float, 0.907 as Float, 0.908 as Float, 0.953 as Float, 0.954 as Float, 0.999 as Float, 1.000 as Float]
		bird00ImageContentsAnimation.timingFunctions = [linearTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming]
		bird00ImageContentsAnimation.repeatCount = HUGE
		bird00ImageContentsAnimation.beginTime = beginTime
		bird00ImageContentsAnimation.fillMode = fillMode
		bird00ImageContentsAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["bird_00"]?.layer.addAnimation(bird00ImageContentsAnimation, forKey:"bird02_ImageContents")

		let bird00ScaleXAnimation = CAKeyframeAnimation(keyPath: "transform.scale.x")
		bird00ScaleXAnimation.duration = 5.000
		bird00ScaleXAnimation.values = [0.800 as Float, 0.800 as Float]
		bird00ScaleXAnimation.keyTimes = [0.000 as Float, 1.000 as Float]
		bird00ScaleXAnimation.timingFunctions = [linearTiming]
		bird00ScaleXAnimation.beginTime = beginTime
		bird00ScaleXAnimation.fillMode = fillMode
		bird00ScaleXAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["bird_00"]?.layer.addAnimation(bird00ScaleXAnimation, forKey:"bird02_ScaleX")

		let bird00TranslationXAnimation = CAKeyframeAnimation(keyPath: "transform.translation.x")
		bird00TranslationXAnimation.duration = 5.000
		bird00TranslationXAnimation.values = [0.000 as Float, 0.000 as Float, 840.000 as Float, 840.000 as Float]
		bird00TranslationXAnimation.keyTimes = [0.000 as Float, 0.200 as Float, 0.860 as Float, 1.000 as Float]
		bird00TranslationXAnimation.timingFunctions = [linearTiming, linearTiming, linearTiming]
		bird00TranslationXAnimation.repeatCount = HUGE
		bird00TranslationXAnimation.beginTime = beginTime
		bird00TranslationXAnimation.fillMode = fillMode
		bird00TranslationXAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["bird_00"]?.layer.addAnimation(bird00TranslationXAnimation, forKey:"bird02_TranslationX")

		let bird00TranslationYAnimation = CAKeyframeAnimation(keyPath: "transform.translation.y")
		bird00TranslationYAnimation.duration = 5.000
		bird00TranslationYAnimation.values = [-120.000 as Float, -120.000 as Float]
		bird00TranslationYAnimation.keyTimes = [0.000 as Float, 1.000 as Float]
		bird00TranslationYAnimation.timingFunctions = [linearTiming]
		bird00TranslationYAnimation.beginTime = beginTime
		bird00TranslationYAnimation.fillMode = fillMode
		bird00TranslationYAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["bird_00"]?.layer.addAnimation(bird00TranslationYAnimation, forKey:"bird02_TranslationY")
	}

	func removeBird02Animation() {
		self.viewsByName["bird_00"]?.layer.removeAnimationForKey("bird02_Opacity")
		self.viewsByName["bird_00"]?.layer.removeAnimationForKey("bird02_ImageContents")
		self.viewsByName["bird_00"]?.layer.removeAnimationForKey("bird02_ScaleX")
		self.viewsByName["bird_00"]?.layer.removeAnimationForKey("bird02_TranslationX")
		self.viewsByName["bird_00"]?.layer.removeAnimationForKey("bird02_TranslationY")
	}

	// - MARK: blue monkey

	func addBlueMonkeyAnimation() {
		addBlueMonkeyAnimationWithBeginTime(0, fillMode: kCAFillModeBoth, removedOnCompletion: false)
	}

	func addBlueMonkeyAnimation(#removedOnCompletion: Bool) {
		addBlueMonkeyAnimationWithBeginTime(0, fillMode: removedOnCompletion ? kCAFillModeRemoved : kCAFillModeBoth, removedOnCompletion: removedOnCompletion)
	}

	func addBlueMonkeyAnimationWithBeginTime(beginTime: CFTimeInterval, fillMode: String, removedOnCompletion: Bool) {
		let linearTiming = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
		let instantTiming = CAMediaTimingFunction(name: kCAMediaTimingFunctionDefault)

		let bmSwing00ImageContentsAnimation = CAKeyframeAnimation(keyPath: "contents")
		bmSwing00ImageContentsAnimation.duration = 4.630
		bmSwing00ImageContentsAnimation.values = [UIImage(named: "bm_swing00")!.CGImage, UIImage(named: "bm_swing00")!.CGImage, UIImage(named: "bm_swing01")!.CGImage, UIImage(named: "bm_swing01")!.CGImage, UIImage(named: "bm_swing02")!.CGImage, UIImage(named: "bm_swing02")!.CGImage, UIImage(named: "bm_swing03")!.CGImage, UIImage(named: "bm_swing03")!.CGImage, UIImage(named: "bm_swing04")!.CGImage, UIImage(named: "bm_swing04")!.CGImage, UIImage(named: "bm_swing05")!.CGImage, UIImage(named: "bm_swing05")!.CGImage, UIImage(named: "bm_swing06")!.CGImage, UIImage(named: "bm_swing06")!.CGImage, UIImage(named: "bm_swing07")!.CGImage, UIImage(named: "bm_swing07")!.CGImage, UIImage(named: "bm_swing08")!.CGImage, UIImage(named: "bm_swing08")!.CGImage, UIImage(named: "bm_swing09")!.CGImage, UIImage(named: "bm_swing09")!.CGImage, UIImage(named: "bm_swing10")!.CGImage, UIImage(named: "bm_swing10")!.CGImage, UIImage(named: "bm_swing11")!.CGImage, UIImage(named: "bm_swing11")!.CGImage, UIImage(named: "bm_swing12")!.CGImage, UIImage(named: "bm_swing12")!.CGImage, UIImage(named: "bm_swing13")!.CGImage, UIImage(named: "bm_swing13")!.CGImage, UIImage(named: "bm_swing14")!.CGImage, UIImage(named: "bm_swing14")!.CGImage, UIImage(named: "bm_swing15")!.CGImage, UIImage(named: "bm_swing15")!.CGImage, UIImage(named: "bm_swing16")!.CGImage, UIImage(named: "bm_swing16")!.CGImage, UIImage(named: "bm_swing17")!.CGImage, UIImage(named: "bm_swing17")!.CGImage, UIImage(named: "bm_swing18")!.CGImage, UIImage(named: "bm_swing18")!.CGImage, UIImage(named: "bm_swing19")!.CGImage, UIImage(named: "bm_swing19")!.CGImage, UIImage(named: "bm_swing20")!.CGImage, UIImage(named: "bm_swing20")!.CGImage, UIImage(named: "bm_swing21")!.CGImage, UIImage(named: "bm_swing21")!.CGImage, UIImage(named: "bm_swing22")!.CGImage, UIImage(named: "bm_swing22")!.CGImage, UIImage(named: "bm_swing23")!.CGImage, UIImage(named: "bm_swing23")!.CGImage, UIImage(named: "bm_swing24")!.CGImage, UIImage(named: "bm_swing24")!.CGImage, UIImage(named: "bm_swing25")!.CGImage, UIImage(named: "bm_swing25")!.CGImage, UIImage(named: "bm_swing26")!.CGImage, UIImage(named: "bm_swing26")!.CGImage, UIImage(named: "bm_swing27")!.CGImage, UIImage(named: "bm_swing27")!.CGImage, UIImage(named: "bm_swing28")!.CGImage, UIImage(named: "bm_swing28")!.CGImage, UIImage(named: "bm_swing29")!.CGImage, UIImage(named: "bm_swing29")!.CGImage, UIImage(named: "bm_swing30")!.CGImage, UIImage(named: "bm_swing30")!.CGImage, UIImage(named: "bm_swing31")!.CGImage, UIImage(named: "bm_swing31")!.CGImage, UIImage(named: "bm_swing32")!.CGImage, UIImage(named: "bm_swing32")!.CGImage, UIImage(named: "bm_swing33")!.CGImage, UIImage(named: "bm_swing33")!.CGImage, UIImage(named: "bm_swing34")!.CGImage, UIImage(named: "bm_swing34")!.CGImage, UIImage(named: "bm_swing35")!.CGImage, UIImage(named: "bm_swing35")!.CGImage, UIImage(named: "bm_swing36")!.CGImage, UIImage(named: "bm_swing36")!.CGImage, UIImage(named: "bm_swing37")!.CGImage, UIImage(named: "bm_swing37")!.CGImage, UIImage(named: "bm_swing38")!.CGImage, UIImage(named: "bm_swing38")!.CGImage, UIImage(named: "bm_swing39")!.CGImage, UIImage(named: "bm_swing39")!.CGImage, UIImage(named: "bm_swing40")!.CGImage, UIImage(named: "bm_swing40")!.CGImage, UIImage(named: "bm_swing41")!.CGImage, UIImage(named: "bm_swing41")!.CGImage, UIImage(named: "bm_swing42")!.CGImage, UIImage(named: "bm_swing42")!.CGImage, UIImage(named: "bm_swing43")!.CGImage, UIImage(named: "bm_swing43")!.CGImage, UIImage(named: "bm_swing44")!.CGImage, UIImage(named: "bm_swing44")!.CGImage, UIImage(named: "bm_swing45")!.CGImage, UIImage(named: "bm_swing45")!.CGImage, UIImage(named: "bm_swing46")!.CGImage, UIImage(named: "bm_swing46")!.CGImage, UIImage(named: "bm_swing47")!.CGImage, UIImage(named: "bm_swing47")!.CGImage, UIImage(named: "bm_swing48")!.CGImage, UIImage(named: "bm_swing48")!.CGImage, UIImage(named: "bm_swing49")!.CGImage, UIImage(named: "bm_swing49")!.CGImage, UIImage(named: "bm_swing50")!.CGImage, UIImage(named: "bm_swing50")!.CGImage, UIImage(named: "bm_swing51")!.CGImage, UIImage(named: "bm_swing51")!.CGImage, UIImage(named: "bm_swing52")!.CGImage, UIImage(named: "bm_swing52")!.CGImage, UIImage(named: "bm_swing53")!.CGImage, UIImage(named: "bm_swing53")!.CGImage, UIImage(named: "bm_swing54")!.CGImage, UIImage(named: "bm_swing54")!.CGImage, UIImage(named: "bm_swing55")!.CGImage, UIImage(named: "bm_swing55")!.CGImage, UIImage(named: "bm_swing56")!.CGImage, UIImage(named: "bm_swing56")!.CGImage, UIImage(named: "bm_swing57")!.CGImage, UIImage(named: "bm_swing57")!.CGImage, UIImage(named: "bm_swing58")!.CGImage, UIImage(named: "bm_swing58")!.CGImage, UIImage(named: "bm_swing59")!.CGImage, UIImage(named: "bm_swing59")!.CGImage, UIImage(named: "bm_swing60")!.CGImage, UIImage(named: "bm_swing60")!.CGImage, UIImage(named: "bm_swing61")!.CGImage, UIImage(named: "bm_swing61")!.CGImage, UIImage(named: "bm_swing62")!.CGImage, UIImage(named: "bm_swing62")!.CGImage, UIImage(named: "bm_swing63")!.CGImage, UIImage(named: "bm_swing63")!.CGImage, UIImage(named: "bm_swing64")!.CGImage, UIImage(named: "bm_swing64")!.CGImage, UIImage(named: "bm_swing65")!.CGImage, UIImage(named: "bm_swing65")!.CGImage, UIImage(named: "bm_swing66")!.CGImage, UIImage(named: "bm_swing66")!.CGImage, UIImage(named: "bm_swing67")!.CGImage, UIImage(named: "bm_swing67")!.CGImage, UIImage(named: "bm_swing68")!.CGImage, UIImage(named: "bm_swing68")!.CGImage, UIImage(named: "bm_swing69")!.CGImage, UIImage(named: "bm_swing69")!.CGImage, UIImage(named: "bm_swing70")!.CGImage, UIImage(named: "bm_swing70")!.CGImage, UIImage(named: "bm_swing71")!.CGImage, UIImage(named: "bm_swing71")!.CGImage, UIImage(named: "bm_swing72")!.CGImage, UIImage(named: "bm_swing72")!.CGImage, UIImage(named: "bm_swing73")!.CGImage, UIImage(named: "bm_swing73")!.CGImage, UIImage(named: "bm_swing74")!.CGImage, UIImage(named: "bm_swing74")!.CGImage, UIImage(named: "bm_swing75")!.CGImage, UIImage(named: "bm_swing75")!.CGImage, UIImage(named: "bm_swing76")!.CGImage, UIImage(named: "bm_swing76")!.CGImage, UIImage(named: "bm_swing77")!.CGImage, UIImage(named: "bm_swing77")!.CGImage, UIImage(named: "bm_swing78")!.CGImage, UIImage(named: "bm_swing78")!.CGImage, UIImage(named: "bm_swing79")!.CGImage, UIImage(named: "bm_swing79")!.CGImage, UIImage(named: "bm_swing80")!.CGImage, UIImage(named: "bm_swing80")!.CGImage, UIImage(named: "bm_swing81")!.CGImage, UIImage(named: "bm_swing81")!.CGImage, UIImage(named: "bm_swing82")!.CGImage, UIImage(named: "bm_swing82")!.CGImage, UIImage(named: "bm_swing83")!.CGImage, UIImage(named: "bm_swing83")!.CGImage, UIImage(named: "bm_swing84")!.CGImage, UIImage(named: "bm_swing84")!.CGImage, UIImage(named: "bm_swing85")!.CGImage, UIImage(named: "bm_swing85")!.CGImage, UIImage(named: "bm_swing86")!.CGImage, UIImage(named: "bm_swing86")!.CGImage, UIImage(named: "bm_swing87")!.CGImage, UIImage(named: "bm_swing87")!.CGImage, UIImage(named: "bm_swing88")!.CGImage, UIImage(named: "bm_swing88")!.CGImage, UIImage(named: "bm_swing89")!.CGImage, UIImage(named: "bm_swing89")!.CGImage, UIImage(named: "bm_swing90")!.CGImage, UIImage(named: "bm_swing90")!.CGImage, UIImage(named: "bm_swing91")!.CGImage, UIImage(named: "bm_swing91")!.CGImage, UIImage(named: "bm_swing92")!.CGImage, UIImage(named: "bm_swing92")!.CGImage, UIImage(named: "bm_swing93")!.CGImage, UIImage(named: "bm_swing93")!.CGImage, UIImage(named: "bm_swing94")!.CGImage, UIImage(named: "bm_swing94")!.CGImage, UIImage(named: "bm_swing95")!.CGImage, UIImage(named: "bm_swing95")!.CGImage, UIImage(named: "bm_swing96")!.CGImage, UIImage(named: "bm_swing96")!.CGImage, UIImage(named: "bm_swing97")!.CGImage, UIImage(named: "bm_swing97")!.CGImage, UIImage(named: "bm_swing98")!.CGImage, UIImage(named: "bm_swing98")!.CGImage, UIImage(named: "bm_swing99")!.CGImage, UIImage(named: "bm_swing99")!.CGImage, UIImage(named: "bm_swing100")!.CGImage, UIImage(named: "bm_swing100")!.CGImage, UIImage(named: "bm_swing101")!.CGImage, UIImage(named: "bm_swing101")!.CGImage, UIImage(named: "bm_swing102")!.CGImage, UIImage(named: "bm_swing102")!.CGImage, UIImage(named: "bm_swing103")!.CGImage, UIImage(named: "bm_swing103")!.CGImage, UIImage(named: "bm_swing104")!.CGImage, UIImage(named: "bm_swing104")!.CGImage, UIImage(named: "bm_swing105")!.CGImage, UIImage(named: "bm_swing105")!.CGImage, UIImage(named: "bm_swing106")!.CGImage, UIImage(named: "bm_swing106")!.CGImage, UIImage(named: "bm_swing107")!.CGImage, UIImage(named: "bm_swing107")!.CGImage, UIImage(named: "bm_swing108")!.CGImage, UIImage(named: "bm_swing108")!.CGImage, UIImage(named: "bm_swing109")!.CGImage, UIImage(named: "bm_swing109")!.CGImage, UIImage(named: "bm_swing110")!.CGImage, UIImage(named: "bm_swing110")!.CGImage, UIImage(named: "bm_swing111")!.CGImage, UIImage(named: "bm_swing111")!.CGImage, UIImage(named: "bm_swing112")!.CGImage, UIImage(named: "bm_swing112")!.CGImage, UIImage(named: "bm_swing113")!.CGImage, UIImage(named: "bm_swing113")!.CGImage, UIImage(named: "bm_swing114")!.CGImage, UIImage(named: "bm_swing114")!.CGImage, UIImage(named: "bm_swing115")!.CGImage, UIImage(named: "bm_swing00")!.CGImage]
		bmSwing00ImageContentsAnimation.keyTimes = [0.000 as Float, 0.009 as Float, 0.009 as Float, 0.017 as Float, 0.017 as Float, 0.026 as Float, 0.026 as Float, 0.034 as Float, 0.035 as Float, 0.043 as Float, 0.043 as Float, 0.052 as Float, 0.052 as Float, 0.060 as Float, 0.060 as Float, 0.069 as Float, 0.069 as Float, 0.078 as Float, 0.078 as Float, 0.086 as Float, 0.086 as Float, 0.095 as Float, 0.095 as Float, 0.104 as Float, 0.104 as Float, 0.112 as Float, 0.112 as Float, 0.121 as Float, 0.121 as Float, 0.129 as Float, 0.130 as Float, 0.138 as Float, 0.138 as Float, 0.147 as Float, 0.147 as Float, 0.155 as Float, 0.156 as Float, 0.164 as Float, 0.164 as Float, 0.173 as Float, 0.173 as Float, 0.181 as Float, 0.181 as Float, 0.190 as Float, 0.190 as Float, 0.199 as Float, 0.199 as Float, 0.207 as Float, 0.207 as Float, 0.216 as Float, 0.216 as Float, 0.225 as Float, 0.225 as Float, 0.233 as Float, 0.233 as Float, 0.242 as Float, 0.242 as Float, 0.250 as Float, 0.251 as Float, 0.259 as Float, 0.259 as Float, 0.268 as Float, 0.268 as Float, 0.276 as Float, 0.276 as Float, 0.285 as Float, 0.285 as Float, 0.294 as Float, 0.294 as Float, 0.302 as Float, 0.302 as Float, 0.311 as Float, 0.311 as Float, 0.320 as Float, 0.320 as Float, 0.328 as Float, 0.328 as Float, 0.337 as Float, 0.337 as Float, 0.345 as Float, 0.346 as Float, 0.354 as Float, 0.354 as Float, 0.363 as Float, 0.363 as Float, 0.371 as Float, 0.371 as Float, 0.380 as Float, 0.380 as Float, 0.389 as Float, 0.389 as Float, 0.397 as Float, 0.397 as Float, 0.406 as Float, 0.406 as Float, 0.415 as Float, 0.415 as Float, 0.423 as Float, 0.423 as Float, 0.432 as Float, 0.432 as Float, 0.440 as Float, 0.441 as Float, 0.449 as Float, 0.449 as Float, 0.458 as Float, 0.458 as Float, 0.466 as Float, 0.467 as Float, 0.475 as Float, 0.475 as Float, 0.484 as Float, 0.484 as Float, 0.492 as Float, 0.492 as Float, 0.501 as Float, 0.501 as Float, 0.510 as Float, 0.510 as Float, 0.518 as Float, 0.518 as Float, 0.527 as Float, 0.527 as Float, 0.536 as Float, 0.536 as Float, 0.544 as Float, 0.544 as Float, 0.553 as Float, 0.553 as Float, 0.561 as Float, 0.562 as Float, 0.570 as Float, 0.570 as Float, 0.579 as Float, 0.579 as Float, 0.587 as Float, 0.587 as Float, 0.596 as Float, 0.596 as Float, 0.605 as Float, 0.605 as Float, 0.613 as Float, 0.613 as Float, 0.622 as Float, 0.622 as Float, 0.631 as Float, 0.631 as Float, 0.639 as Float, 0.639 as Float, 0.648 as Float, 0.648 as Float, 0.656 as Float, 0.657 as Float, 0.665 as Float, 0.665 as Float, 0.674 as Float, 0.674 as Float, 0.682 as Float, 0.683 as Float, 0.691 as Float, 0.691 as Float, 0.700 as Float, 0.700 as Float, 0.708 as Float, 0.708 as Float, 0.717 as Float, 0.717 as Float, 0.726 as Float, 0.726 as Float, 0.734 as Float, 0.734 as Float, 0.743 as Float, 0.743 as Float, 0.752 as Float, 0.752 as Float, 0.760 as Float, 0.760 as Float, 0.769 as Float, 0.769 as Float, 0.777 as Float, 0.778 as Float, 0.786 as Float, 0.786 as Float, 0.795 as Float, 0.795 as Float, 0.803 as Float, 0.803 as Float, 0.812 as Float, 0.812 as Float, 0.821 as Float, 0.821 as Float, 0.829 as Float, 0.829 as Float, 0.838 as Float, 0.838 as Float, 0.847 as Float, 0.847 as Float, 0.855 as Float, 0.855 as Float, 0.864 as Float, 0.864 as Float, 0.872 as Float, 0.873 as Float, 0.881 as Float, 0.881 as Float, 0.890 as Float, 0.890 as Float, 0.898 as Float, 0.898 as Float, 0.907 as Float, 0.907 as Float, 0.916 as Float, 0.916 as Float, 0.924 as Float, 0.924 as Float, 0.933 as Float, 0.933 as Float, 0.942 as Float, 0.942 as Float, 0.950 as Float, 0.950 as Float, 0.959 as Float, 0.959 as Float, 0.967 as Float, 0.968 as Float, 0.976 as Float, 0.976 as Float, 0.985 as Float, 0.985 as Float, 0.993 as Float, 0.994 as Float, 1.000 as Float]
		bmSwing00ImageContentsAnimation.timingFunctions = [instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, linearTiming]
		bmSwing00ImageContentsAnimation.repeatCount = HUGE
		bmSwing00ImageContentsAnimation.beginTime = beginTime
		bmSwing00ImageContentsAnimation.fillMode = fillMode
		bmSwing00ImageContentsAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["bm_swing00"]?.layer.addAnimation(bmSwing00ImageContentsAnimation, forKey:"blue monkey_ImageContents")

		let treesTranslationXAnimation = CAKeyframeAnimation(keyPath: "transform.translation.x")
		treesTranslationXAnimation.duration = 4.630
		treesTranslationXAnimation.values = [0.000 as Float, 1770.000 as Float]
		treesTranslationXAnimation.keyTimes = [0.000 as Float, 1.000 as Float]
		treesTranslationXAnimation.timingFunctions = [linearTiming]
		treesTranslationXAnimation.repeatCount = HUGE
		treesTranslationXAnimation.beginTime = beginTime
		treesTranslationXAnimation.fillMode = fillMode
		treesTranslationXAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["trees"]?.layer.addAnimation(treesTranslationXAnimation, forKey:"blue monkey_TranslationX")
	}

	func removeBlueMonkeyAnimation() {
		self.viewsByName["bm_swing00"]?.layer.removeAnimationForKey("blue monkey_ImageContents")
		self.viewsByName["trees"]?.layer.removeAnimationForKey("blue monkey_TranslationX")
	}

	// - MARK: clouds

	func addCloudsAnimation() {
		addCloudsAnimationWithBeginTime(0, fillMode: kCAFillModeBoth, removedOnCompletion: false)
	}

	func addCloudsAnimation(#removedOnCompletion: Bool) {
		addCloudsAnimationWithBeginTime(0, fillMode: removedOnCompletion ? kCAFillModeRemoved : kCAFillModeBoth, removedOnCompletion: removedOnCompletion)
	}

	func addCloudsAnimationWithBeginTime(beginTime: CFTimeInterval, fillMode: String, removedOnCompletion: Bool) {
		let linearTiming = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)

		let cloudsTranslationXAnimation = CAKeyframeAnimation(keyPath: "transform.translation.x")
		cloudsTranslationXAnimation.duration = 15.000
		cloudsTranslationXAnimation.values = [0.000 as Float, 1380.000 as Float]
		cloudsTranslationXAnimation.keyTimes = [0.000 as Float, 1.000 as Float]
		cloudsTranslationXAnimation.timingFunctions = [linearTiming]
		cloudsTranslationXAnimation.repeatCount = HUGE
		cloudsTranslationXAnimation.beginTime = beginTime
		cloudsTranslationXAnimation.fillMode = fillMode
		cloudsTranslationXAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["clouds"]?.layer.addAnimation(cloudsTranslationXAnimation, forKey:"clouds_TranslationX")
	}

	func removeCloudsAnimation() {
		self.viewsByName["clouds"]?.layer.removeAnimationForKey("clouds_TranslationX")
	}

	// - MARK: mountains

	func addMountainsAnimation() {
		addMountainsAnimationWithBeginTime(0, fillMode: kCAFillModeBoth, removedOnCompletion: false)
	}

	func addMountainsAnimation(#removedOnCompletion: Bool) {
		addMountainsAnimationWithBeginTime(0, fillMode: removedOnCompletion ? kCAFillModeRemoved : kCAFillModeBoth, removedOnCompletion: removedOnCompletion)
	}

	func addMountainsAnimationWithBeginTime(beginTime: CFTimeInterval, fillMode: String, removedOnCompletion: Bool) {
		let linearTiming = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)

		let mountainsTranslationXAnimation = CAKeyframeAnimation(keyPath: "transform.translation.x")
		mountainsTranslationXAnimation.duration = 17.500
		mountainsTranslationXAnimation.values = [0.000 as Float, 1383.000 as Float]
		mountainsTranslationXAnimation.keyTimes = [0.000 as Float, 1.000 as Float]
		mountainsTranslationXAnimation.timingFunctions = [linearTiming]
		mountainsTranslationXAnimation.repeatCount = HUGE
		mountainsTranslationXAnimation.beginTime = beginTime
		mountainsTranslationXAnimation.fillMode = fillMode
		mountainsTranslationXAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["mountains"]?.layer.addAnimation(mountainsTranslationXAnimation, forKey:"mountains_TranslationX")
	}

	func removeMountainsAnimation() {
		self.viewsByName["mountains"]?.layer.removeAnimationForKey("mountains_TranslationX")
	}

	// - MARK: sky

	func addSkyAnimation() {
		addSkyAnimationWithBeginTime(0, fillMode: kCAFillModeBoth, removedOnCompletion: false)
	}

	func addSkyAnimation(#removedOnCompletion: Bool) {
		addSkyAnimationWithBeginTime(0, fillMode: removedOnCompletion ? kCAFillModeRemoved : kCAFillModeBoth, removedOnCompletion: removedOnCompletion)
	}

	func addSkyAnimationWithBeginTime(beginTime: CFTimeInterval, fillMode: String, removedOnCompletion: Bool) {
		let linearTiming = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)

		let skyTranslationXAnimation = CAKeyframeAnimation(keyPath: "transform.translation.x")
		skyTranslationXAnimation.duration = 20.000
		skyTranslationXAnimation.values = [0.000 as Float, 1380.000 as Float]
		skyTranslationXAnimation.keyTimes = [0.000 as Float, 1.000 as Float]
		skyTranslationXAnimation.timingFunctions = [linearTiming]
		skyTranslationXAnimation.repeatCount = HUGE
		skyTranslationXAnimation.beginTime = beginTime
		skyTranslationXAnimation.fillMode = fillMode
		skyTranslationXAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["sky"]?.layer.addAnimation(skyTranslationXAnimation, forKey:"sky_TranslationX")
	}

	func removeSkyAnimation() {
		self.viewsByName["sky"]?.layer.removeAnimationForKey("sky_TranslationX")
	}

	// - MARK: bird01

	func addBird01Animation() {
		addBird01AnimationWithBeginTime(0, fillMode: kCAFillModeBoth, removedOnCompletion: false)
	}

	func addBird01Animation(#removedOnCompletion: Bool) {
		addBird01AnimationWithBeginTime(0, fillMode: removedOnCompletion ? kCAFillModeRemoved : kCAFillModeBoth, removedOnCompletion: removedOnCompletion)
	}

	func addBird01AnimationWithBeginTime(beginTime: CFTimeInterval, fillMode: String, removedOnCompletion: Bool) {
		let linearTiming = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
		let instantTiming = CAMediaTimingFunction(name: kCAMediaTimingFunctionDefault)

		let bird00ImageContentsAnimation = CAKeyframeAnimation(keyPath: "contents")
		bird00ImageContentsAnimation.duration = 0.560
		bird00ImageContentsAnimation.values = [UIImage(named: "bird_00")!.CGImage, UIImage(named: "bird_00")!.CGImage, UIImage(named: "bird_01")!.CGImage, UIImage(named: "bird_01")!.CGImage, UIImage(named: "bird_02")!.CGImage, UIImage(named: "bird_02")!.CGImage, UIImage(named: "bird_03")!.CGImage, UIImage(named: "bird_03")!.CGImage, UIImage(named: "bird_04")!.CGImage, UIImage(named: "bird_04")!.CGImage, UIImage(named: "bird_05")!.CGImage, UIImage(named: "bird_05")!.CGImage, UIImage(named: "bird_06")!.CGImage, UIImage(named: "bird_06")!.CGImage, UIImage(named: "bird_07")!.CGImage, UIImage(named: "bird_07")!.CGImage, UIImage(named: "bird_08")!.CGImage, UIImage(named: "bird_08")!.CGImage, UIImage(named: "bird_09")!.CGImage, UIImage(named: "bird_09")!.CGImage, UIImage(named: "bird_10")!.CGImage, UIImage(named: "bird_10")!.CGImage, UIImage(named: "bird_11")!.CGImage, UIImage(named: "bird_11")!.CGImage, UIImage(named: "bird_12")!.CGImage, UIImage(named: "bird_12")!.CGImage, UIImage(named: "bird_13")!.CGImage, UIImage(named: "bird_13")!.CGImage, UIImage(named: "bird_14")!.CGImage]
		bird00ImageContentsAnimation.keyTimes = [0.000 as Float, 0.071 as Float, 0.071 as Float, 0.142 as Float, 0.143 as Float, 0.213 as Float, 0.214 as Float, 0.285 as Float, 0.286 as Float, 0.356 as Float, 0.357 as Float, 0.428 as Float, 0.429 as Float, 0.499 as Float, 0.500 as Float, 0.571 as Float, 0.571 as Float, 0.642 as Float, 0.643 as Float, 0.713 as Float, 0.714 as Float, 0.785 as Float, 0.786 as Float, 0.856 as Float, 0.857 as Float, 0.928 as Float, 0.929 as Float, 0.999 as Float, 1.000 as Float]
		bird00ImageContentsAnimation.timingFunctions = [instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming]
		bird00ImageContentsAnimation.repeatCount = HUGE
		bird00ImageContentsAnimation.beginTime = beginTime
		bird00ImageContentsAnimation.fillMode = fillMode
		bird00ImageContentsAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["bird_00"]?.layer.addAnimation(bird00ImageContentsAnimation, forKey:"bird01_ImageContents")

		let bird00TranslationXAnimation = CAKeyframeAnimation(keyPath: "transform.translation.x")
		bird00TranslationXAnimation.duration = 6.000
		bird00TranslationXAnimation.values = [0.000 as Float, 840.000 as Float, 840.000 as Float]
		bird00TranslationXAnimation.keyTimes = [0.000 as Float, 0.500 as Float, 1.000 as Float]
		bird00TranslationXAnimation.timingFunctions = [linearTiming, linearTiming]
		bird00TranslationXAnimation.repeatCount = HUGE
		bird00TranslationXAnimation.beginTime = beginTime
		bird00TranslationXAnimation.fillMode = fillMode
		bird00TranslationXAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["bird_00"]?.layer.addAnimation(bird00TranslationXAnimation, forKey:"bird01_TranslationX")

		let bird00TranslationYAnimation = CAKeyframeAnimation(keyPath: "transform.translation.y")
		bird00TranslationYAnimation.duration = 6.000
		bird00TranslationYAnimation.values = [0.000 as Float, 0.000 as Float]
		bird00TranslationYAnimation.keyTimes = [0.000 as Float, 1.000 as Float]
		bird00TranslationYAnimation.timingFunctions = [linearTiming]
		bird00TranslationYAnimation.beginTime = beginTime
		bird00TranslationYAnimation.fillMode = fillMode
		bird00TranslationYAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["bird_00"]?.layer.addAnimation(bird00TranslationYAnimation, forKey:"bird01_TranslationY")
	}

	func removeBird01Animation() {
		self.viewsByName["bird_00"]?.layer.removeAnimationForKey("bird01_ImageContents")
		self.viewsByName["bird_00"]?.layer.removeAnimationForKey("bird01_TranslationX")
		self.viewsByName["bird_00"]?.layer.removeAnimationForKey("bird01_TranslationY")
	}

	func removeAllAnimations() {
		for subview in viewsByName.values {
			subview.layer.removeAllAnimations()
		}
	}
}