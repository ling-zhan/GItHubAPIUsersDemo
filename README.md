# GitHub Open API Users Demo

這是一個 GitHub Open API 獲取 Users 及 user 的演示 ✨
- 使用 Swift Storyboard 製作專案
- 使用 MVVM 架構
- 使用 TabView + Cell 製作畫面
- 使用 URLRequest 進行 API 的串接
- 使用 closure 將 Http 請求的資料回傳至 ViewModel
- 使用 delegate 與 View、ViewController、ViewModel 之間的事件傳遞
- 使用 Alert 與 客製的 Toast 來顯示錯誤提示訊息
- GitHub API 參考 (https://docs.github.com/en/rest/users/users?apiVersion=2022-11-28#list-users)

## 檔案結構
GitHubUser > Users
> Models：存放抓取 http users 的資料結構檔案
> 
> ViewModels：存放提供給 ViewController 的 ViewModel檔案
> 
> ViewControllers：存放畫面檔案
> 
> Views：存放給 TableView 的 Cell 元件檔案

GitHubUser > UserDetail
> Models：存放抓取 http user detail 的資料結構檔案
> 
> ViewModels：存放提供給 ViewController 的 ViewModel檔案
> 
> ViewControllers：存放畫面檔案
> 
> Views：存放給 TableView 的 Cell 元件檔案

GitHubUser > UserDetail > Views
> UserAvatarTableViewCell： 呈現 使用者頭像的元件
> 
> IconLabelTableViewCell：呈現有 icon + Label 的元件
> 
> HyperlinkTableViewCell：呈現超連結的元件
> 
> DividerTableViewCell：呈現底線的元件
> 
> LongTextTableViewCell：呈現長內容的元件
> 
> EditView：呈現編輯名稱的元件

Resource 
> Enum：存放 HttpError 枚舉
> 
> Menager：Http 的請求檔案

## 說明

Users 首頁的使用者列表說明
- 使用 TableView + Cell 設計畫面
- 呈現一次抓 20筆資料，至多 100筆資料
- 每當畫面顯示至最後第一筆資料時，重新抓取下一頁資料並刷新畫面
- Site Admin 以 🔰 為顯示圖示
- 點擊使用 navigationController push的方式 進入 UserDetail 頁面
- 使用客製的 Toast 提示錯誤訊息

UserDetail 
- 使用 TableView + 多個 Cell 設計畫面
- 使用 type 來區分及排序不同的 Cell 畫面，及給定各別 Cell 的 Model 資料
- 使用 delegate 的方式來處理 Cell 點擊事件
- 使用 delegate 的方式來處理 edit name 的回傳事件
- 使用 delegate 的方式讓 ViewController 實作 ViewModel 在 Http 處理後的事件
- 使用 Alert 提示錯誤訊息

## 授權

MIT

