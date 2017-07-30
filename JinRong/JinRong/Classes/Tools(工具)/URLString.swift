//
//  URLString.swift
//  JinRong
//
//  Created by 乔伟成 on 2017/7/24.
//  Copyright © 2017年 乔伟成. All rights reserved.
//

import Foundation

let BASE_URL = "http://118.89.220.47:2113"//"http://192.168.1.61"

/// token
let URL_Token = BASE_URL+"/oauth/token"
/// 刷新token
let URL_RefreshToken = BASE_URL+"/oauth/refresh/token"
/// 注册
let URL_Register = BASE_URL+"/user/reg"
/// 登录
let URL_Login = BASE_URL+"/user/login"
/// 修改密码
let URL_PwdUpdate = BASE_URL+"/user/savepass"
/// 获取个人信息
let URL_UserInfo = BASE_URL+"/user/detail"
/// 忘记密码
let URL_PwdForget = BASE_URL+"/user/forgetpass"
/// 借款列表
let URL_BORROW = BASE_URL+"/project/list"
/// 借款详情
let URL_BorrowDetail = BASE_URL+"/money/loan/"
/// 借款操作
let URL_BorrowAction = BASE_URL+"/money/loan"
/// 进度查询
let URL_Progress = BASE_URL+"/project/progress"
/// 联系人列表
let URL_ContactsList = BASE_URL+"/auth/contact/list"
/// 添加联系人
let URL_ContactsAdd = BASE_URL+"/auth/contact/add"
/// 修改联系人
let URL_ContactsUpdate = BASE_URL+"/auth/contact/"
/// 取消订阅
let URL_Deapply = BASE_URL+"/user/unapply"
/// 账单信息
let URL_Bill = BASE_URL+"/project/bill"


////// 通知名
/// 登录成功通知
let LoginSuccessNotification = "LoginSuccessNotification"
/// 退出登录通知
let LogoutSuccessNotification = "LogoutSuccessNotification"



///// 键
let MemberIdKey = "MemberIdKey"
let TokenKey = "TokenKey"


