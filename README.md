# flutter module工程
## 1、主要涉及选用三方库：

- 网络请求 :

  dio: https://pub.flutter-io.cn/packages/dio
  
  Dart社区提供的http请求库，不仅支持常见的网络请求，还支持RestFul API、FormData、拦截器、请求取消、Cookie管理、文件上传/下载、超时等操作;

- 网络监测: 模拟器上none->wifi/4G无法出发回调方法，但真机是Ok的

  connectivity：https://pub.flutter-io.cn/packages/connectivity

- 状态管理: 建议单个页面单个Provider，多个页面合用一个provider容易出现数据未清除问题；

  provider: https://pub.flutter-io.cn/packages/provider

  flutter官方推荐状态管理

- 路由管理: 界面跳转参数只能传递字符串，拓展后能传基本数据类型，但是无法传递对象，最大的痛点；

  fluro：https://pub.flutter-io.cn/packages/fluro

  好用的路由导航框架支持各种转场动画。功能：简单的线路导航；函数处理程序（映射到函数而不是路径）；通配符参数匹配；查询字符串参数解析；内置常用转换；简单的定制转换创建。

- json字符解析:

  json_annotation：https://pub.flutter-io.cn/packages/json_annotation

- 二维码/条形码扫描:

  barcode_scan：https://pub.flutter-io.cn/packages/barcode_scan

- 事件通知: 注意通知关闭的时机

  event_bus：https://pub.flutter-io.cn/packages/event_bus

  可以使用Dart流进行解耦应用程序的简单事件总线的库，和Android中的事件总线机制类似，内部使用了广播机制;

- 多语言：

  inil_utils: https://pub.flutter-io.cn/packages/intl_utils

- Toast提示框:

  easy_alert: https://pub.flutter-io.cn/packages/easy_alertt

  FToas闲鱼出品: https://github.com/Fliggy-Mobile/ftoast

- 二维码:

  qr_flutter: https://pub.flutter-io.cn/packages/intl_utils

- 本地存储 :

  shared_preferences：https://pub.flutter-io.cn/packages/shared_preferences

  轻量级的存储类来保存键值对信息，支持增删改查

- 轮播图 :

  flutter_swiper：https://pub.flutter-io.cn/packages/flutter_swiper

- webview插件:

  webview_flutter:   https://pub.dev/packages/webview_flutter#-installing-tab-
  
  flutter官方webview插件

- 加密 :

  crypto：https://pub.flutter-io.cn/packages/crypto

- 图表库:

  flutter_sparkline https://pub.flutter-io.cn/packages/flutter_sparkline

  一个炫彩的折线图

  charts_flutter https://pub.flutter-io.cn/packages/charts_flutter

   通用的图表库组件，提供基本的柱状图，折线图，饼图等；

- 图片处理:页面实际效果还是重新加载，底层实现还需关注

  cached_network_image: https://pub.flutter-io.cn/packages/cached_network_image

  用来加载和缓存网络图片，可设置未加载成功时图片占位符和网络加载错误图片;

- 图片预览: 在此工程内，有时有卡顿、不能滑动、以及点击事件不响应的问题，真机不存在此问题，不知是否受其他框架影响

  photo_view:https://pub.flutter-io.cn/packages/photo_view
  
  图片展示组件，配合photo_view_gallery使用，支持滑动可以显示图片下载进度;

- 上拉加载下拉刷新: 支持自定义刷新、加载动画，文案等

  pull_to_refresh: https://pub.flutter-io.cn/packages/pull_to_refresh
  

- 网络loading框: 支持自定义加载菊花圈，可以和shimmer组件联合使用；

  flutter_easyloading：https://pub.flutter-io.cn/packages/flutter_easyloading

- 组件闪烁动画
  shimmer：https://pub.flutter-io.cn/packages/shimmer

- 城市/通讯录组件:
  azlistview: https://pub.flutter-io.cn/packages/azlistview

  级联列表，索引&悬停

- 日期选择器:
  flutter_picker:  https://pub.flutter-io.cn/packages/flutter_picker

- 微信SDK，微信登录，分享以及支付：
  fluwx: https://pub.flutter-io.cn/packages/fluwx

- 本地路径查询，实现清除缓存功能
  path_provider: https://pub.flutter-io.cn/packages/path_provider

- 保存图片到本地
  image_gallery_saver: https://pub.flutter-io.cn/packages/image_gallery_saver

- 组件吸顶，支持多级吸顶, 无需计算吸顶组件的高度
  flutter_sticky_header: https://pub.flutter-io.cn/packages/flutter_sticky_header

- 权限申请处理
  permission_handler: https://pub.flutter-io.cn/packages/permission_handler

- 多图选择,仅支持图片选择
  multi_image_picker: https://pub.flutter-io.cn/packages/multi_image_picker

## 2、项目开发遇到的问题记录：

1、TabBar与TabBarView结合使用时，联动时若添加indexIsChanging判断会把TabBarView切换屏蔽，不添加择切换Tab会导致出发两次
  
    解决方案：
    
    1.1、暂时更换PageView替换TabBarView，通过判断onPageChanged中index和TabBar的下标是否相等来判断TabBar是否需要切换，az_b_bottom_view和az_tab_list_view文件中使用；

    1.2、将indexIsChanging更换为_tabController.index == _tabController.animation.value，my_order_page中使用。
    
2、商详顶部Tab点击跳转对应位置：由于页面渲染需要时间，所以在进入商详后3秒才会计算组件高度，所以3s内点击滚动位置不正确，暂时没有解决办法；

3、页面单独showDialog会导致fluro的路由重新初始化，若是页面Provider在路由初始化的时候配置，showDialog可能会导致该种方式初始化的Provider清空；

