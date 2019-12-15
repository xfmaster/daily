//首页
//http://app3.qdaily.com/app3/homes/index_v2/0.json
//上拉接口
//http://app3.qdaily.com/app3/homes/index_v2/1570842862_1567126148.json
//参数下面有说明 "last_key": "1570842862_1567126148”,
//
//首页横向栏目数据
//http://app3.qdaily.com/app3/columns/index/57/0.json
//横向栏目数据加载更多
//http://app3.qdaily.com/app3/columns/index/57/1551762073.json
//改变.json前面数据，这个参数在上一个json数据的"last_key": 1556583179
//Labs
//http://app3.qdaily.com/app3/papers/index/0.json
//
//http://app3.qdaily.com/app3/mount_details/index/app/5.json
//新闻详情
//http://app3.qdaily.com/app3/articles/detail/64510.json
//内容标题
//http://app3.qdaily.com/app3/articles/info/64656.json
//
//弹幕详情接口
//http://app3.qdaily.com/app3/papers/detail/3030.json
//弹幕接口
//http://app3.qdaily.com/app3/options/index/3030/0.json
//弹幕点赞
//http://app3.qdaily.com/app3/options/mob_create_praise
//参数：
//genre =1
//option_id=348401
//
//登录验证码
//http://app3.qdaily.com/users/phone_create_verify；
//参数
//phone  15111342143
//secretkey 9f9af57e40e5b9d94eb79034b2299996
//time  1571278329298
//
//登录
//http://app3.qdaily.com/users/phone_sign_in
//参数：
//phone 15111342143
//password dddd
//
//修改密码：
//http://app3.qdaily.com/passwords/phone_update
//参数：user[phone]=15111342143&user[phone_verify]=705829&user[password]=xufeng123&
//
//个人中心 统计图表
//http://app3.qdaily.com/app3/users/radar
//
//新闻分类
//http://app3.qdaily.com/app3/homes/left_sidebar.json
//分类新闻列表：
//http://app3.qdaily.com/app3/categories/index/1/0.json
//参数改变index后面的1为分类id
//上拉加载
//http://app3.qdaily.com/app3/categories/index/63/1558314246.json
//改变.json前面的数字参数，这个参数在上一个json数据的"last_key": 1556583179
//
//获取所有栏目
//http://app3.qdaily.com/app3/columns/all_columns_index/0
//上拉接口跟上面一样
//http://app3.qdaily.com/app3/columns/all_columns_index/1558824932
//订阅栏目
//http://app3.qdaily.com/app3/subscribes/create_subscribe
//栏目页
//http://app3.qdaily.com/app3/columns/info/54.json
//栏目列表
//http://app3.qdaily.com/app3/columns/index/54/0.json
//上拉跟上面一样
//http://app3.qdaily.com/app3/columns/index/54/1512774321.json
//
//参数：special_column_id=38&
//我的订阅
//http://app3.qdaily.com/app3/users/my_subscription
//
//
//详情页点击用户头像出来的列表
//http://app3.qdaily.com/app3/users/profiles/posts/62136/0.json
//上拉一样
//http://app3.qdaily.com/app3/users/profiles/posts/62136/1545520585.json
//详情页点击上面那个专题出来的列表
//http://app3.qdaily.com/app3/categories/index/18/0.json
//上拉一样
//http://app3.qdaily.com/app3/categories/index/5/1570581603.json
const String API_INDEX_REFRESH = '/app3/homes/index_v2/';
const String API_COLUMN = '/app3/columns/index/';
const String API_CATEGORIES = '/app3/homes/left_sidebar.json';
const String API_LABS = '/app3/papers/index/0.json';
const String API_LABS_LOAD = '/app3/papers/index/';
const String API_QUESTION = '/app3/papers/detail/';
const String API_COLUMN_PAGE = '/app3/columns/info/';
const String API_COLUMN_LIST = '/app3/columns/index/';
const String API_COLUMN_CATEGORY = '/app3/categories/index/';
const String API_ALL_COLUMN = '/app3/columns/all_columns_index/';
const String API_PHONE_LOGIN = '/users/phone_sign_in';
const String API_EMAIL_LOGIN = '/users/email_sign_in';
const String API_MY_SUBSCRIPTION = '/app3/users/my_subscription';
const String API_USER_HOME = '/app3/users/profiles/posts/';
const String API_ARTICLE_INFO = '/app3/articles/info/';
const String API_ARTICLE_DETAIL = '/app3/articles/detail/';
const String API_ARTICLE_TAG = '/app3/tags/index/';
