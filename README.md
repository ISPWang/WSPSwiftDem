# SwiftDemo
这是写的swift 相关的demo
### 主要包括
` tableView的section  类似个人设置样式`<br /><br />
` 定时器的暂停，开始，清楚播放样式`<br /><br />
` 嵌套按钮多点击效果`
##### Demo样式截图

<img src="https://github.com/ISPWang/WSPSwiftDemo/raw/master/ScreenShots/tableViewSection.png" alt="Drawing" width="375px" />
<img src="https://github.com/ISPWang/WSPSwiftDemo/raw/master/ScreenShots/playLocalVideo.png" alt="Drawing" width="375px" />
<img src="https://github.com/ISPWang/WSPSwiftDemo/raw/master/ScreenShots/buttonShareStyle.png" alt="Drawing" width="375px" />
---
>带动画的登录注册文本框和按钮样式 <br /><br />
##### 主要code

```obj-c
// 约束改变加载动画
UIView.animateWithDuration(0.5, delay: 0.0, options: .CurveEaseOut, animations: { () -> Void in

self.userCenterConstaint.constant += self.view.bounds.width
self.view.layoutIfNeeded()

}, completion: nil)

UIView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: UIViewAnimationOptions.CurveLinear, animations: {

self.loginBtn.bounds = CGRect(x: bounds.origin.x - 20, y: bounds.origin.y, width: bounds.size.width + 60, height: bounds.size.height)
self.loginBtn.enabled = false

}, completion: nil)
```

![图片样式](https://github.com/ISPWang/WSPSwiftDemo/raw/master/ScreenShots/animationLogin.gif)


`项目持续更新 欢迎star`