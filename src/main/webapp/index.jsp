<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<link rel="icon" href="images/portrait2.jpg" type="image/x-icon"> 
	<link rel="shortcut icon" href="images/portrait2.jpg" type="image/x-icon">
	<title>魔术师大鹏的个人网站</title>
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
	<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script> 
	<style type="text/css">
		#sub{
			color: #fff;
    		padding: 0.6em 1.4em;
    		font-size: 1.4rem;
    		border-radius: 4px;
    		cursor: pointer;
    		border: 1px solid #5BA4E8;
    		background: #5BA4E8;
		}
		#hd{
			display: none;
		}
		.red{
			color: red;
		}
		.black{
			color: black;
		}
		.pic:hover,.inner:hover{
			cursor: pointer;
		}
		.pic{
			border-radius: 50%;
		}
		.code{
			display: none;
		}
		.inner{
			height: 200px;
			width: 200px;
			vertical-align: top;
		}
		.zhezhao {
		    display: none;           /* 修改这里可以让遮罩层消失*/
		    position: absolute;
		    top: 0;
		    left: 0;
		    width: 100%;
		    height: 100%;
		    background: #000;
		    opacity: 0.7;
		    filter: alpha(opacity=70);
		    overflow: hidden;
		}
		.result{
		   	display: none;        /* 修改这里可以让框消失*/
		    width: 400px; 
		    height: 190px;
		    margin: 20% auto;
		    position: absolute;
		    top: 0;
		    left: 0;
		    bottom: 0;
		    right: 0;
		    background: #fff;
		    border-radius: 4px;
		}
		.resultChid{
		    margin-left: -6px;
		}
		.resultChid h2{
			text-align:center;
		    padding-left: 8px;
		    font-size: 14px;
		    line-height: 30px;
		    margin: 4px 8px;
		    border-bottom: 1px solid #99cc33;
		}
		.resultMain{
		    margin-top: 38px;
		    text-align: center;
		    margin-bottom: 30px;
		    border-radius: 4px;
		}
		.resultMain button{
		    padding: 0 20px;
		    display: inline-block;
		    height: 30px;
		    line-height: 30px;
		    border-radius: 4px;
		    border: 1px solid #5e8809;
		    margin-top: 30px;
		    background: #99cc33;
		    color: #fff;
		}
		.resultMain button:hover,.resultMain button:active{
		    background: #679016;
		}
		#QQ:hover{
			cursor: pointer;
		}
		#zuopin{
			color: blue;
		}
		#zuopin:hover{
			text-decoration: underline; 
		}
		#down{
			width: 100%;
	    	margin: 20px auto;
		}
		#wechatqq{
			display: block;
			margin: 0 auto;
		}
		#weixin:hover,#qqcode:hover{
			text-decoration: none;
		}
		#weixin,#qqcode{
			text-decoration: none;
		}
		#myinfo,#dibu,#biaodan{
			margin-top: -15px;
		}
		.daohang:hover{
			text-decoration: none;
		}
	</style>
	<script type="text/javascript" src="js/html5media.js"></script><!-- http://api.html5media.info/1.1.8/html5media.min.js -->
	<script type="text/javascript"> 
		function checkUsername(){
			var username=$("#username");
			var p=username.next();
			var v=username.val();
			if(v=="" || v==null){
				p.html("姓名不能为空").css("color","red");
				return false;
			}
			var myreg=/^[\u4e00-\u9fa5 ]{2,20}$/;
			var myreg1=/^[a-zA-Z\/ ]{2,20}$/;
			if(!myreg.test(v)&&!myreg1.test(v)){
				p.html("姓名格式错误").css("color","red");
				return false;
			}
			return true;
		}
		
		function checkUsertheme(){
			var usertheme=$("#usertheme");
			var p=usertheme.next();
			var v=usertheme.val();
			if(v=="" || v==null){
				p.html("主题不能为空").css("color","red");
				return false;
			}
			return true;
		}
		
		function checkUsercon(){
			var usercon=$("#usercon");
			var p=usercon.next();
			var v=usercon.val();
			if(v=="" || v==null){
				p.html("内容不能为空").css("color","red");
				return false;
			}
			return true;
		}
		function checkUsermail(){
			var usermail=$("#usermail");
			var p=usermail.next();
			var v=usermail.val();
			if(v=="" || v==null){
				p.html("手机号不能为空").css("color","red");
				return false;
			}
			var myreg = /^[1][3,4,5,7,8][0-9]{9}$/;
			if(!myreg.test(v)){
				p.html("手机号格式错误").css("color","red");
				return false;
			}
			return true;
		} 
		$(function(){
			$("#send").submit(function(event){
				event.preventDefault();
				var username=$("#username").val();
				var usermail=$("#usermail").val();
				var usertheme=$("#usertheme").val();
				var usercon=$("#usercon").val();
				var myreg=/^[\u4e00-\u9fa5 ]{2,20}$/;
				var myreg1=/^[a-zA-Z\/ ]{2,20}$/;
				if(!myreg.test(username)&&!myreg1.test(username)){
					p.html("姓名格式错误").css("color","red");
					return;
				}
				var myreg2 = /^[1][3,4,5,7,8][0-9]{9}$/;
				if(!myreg2.test(usermail)){
					p.html("手机号格式错误").css("color","red");
					return;
				}
				$.ajax({
					url:"reader/send",
					type:"post",
					data:{
					"username":username,
					"usermail":usermail,
					"usertheme":usertheme,
					"usercon":usercon
				},
				dataType:"json",
				success:function(res){
					var str=JSON.stringify(res);
					$("#h").html(username+",您好：");
					$("#con").html("您的信息已经"+str.substring(1, str.length-1));
					$('.zhezhao').css('display', 'block');
					$('#result').fadeIn();
				}
				});
			});
			$("#sure").click(function(){
				$('.zhezhao').css('display', 'none');
				$('#result').fadeOut();
				window.location.reload();
			});
			
			$("#username").blur(function(){
				checkUsername();
			});
			$("#username").focus(function(){
				var p=$(this).next();
				p.empty();
			});
			
			$("#usermail").blur(function(){
				checkUsermail();
			});
			$("#usermail").focus(function(){
				var p=$(this).next();
				p.empty();
			});
			
			$("#usertheme").blur(function(){
				checkUsertheme();
			});
			$("#usertheme").focus(function(){
				var p=$(this).next();
				p.empty();
			});
			
			$("#usercon").blur(function(){
				checkUsercon();
			});
			$("#usercon").focus(function(){
				var p=$(this).next();
				p.empty();
			});
			$(".inner").mouseover(function(){
				$(this).find("img").show();
			});
			$(".inner").mouseout(function(){
				$(this).find("img").hide();
			});
			$(".pic").click(function(){
				location="http://www.magicpeng.com/myPicture";
			});
			$("#QQ").click(function(){
				location="tencent://message/?uin=328407307&Menu=yes&Site=魔术师大鹏的个人网站";
			});
			$("#weixin").click(function(){
				$("#wechatqq").attr("src","images/wechat.jpg");
				$("#myModalLabel").text("扫一扫添加作者微信：");
			});
			$("#qqcode").click(function(){
				$("#wechatqq").attr("src","images/QQCode.jpg");
				$("#myModalLabel").text("扫一扫添加作者QQ：");
			});
		});
	</script>
</head>
<body>
<aside>
	<a class="cur_a"><span>首页</span></a>
	<a><span>关于我</span></a>
	<a><span>计算机</span></a>
	<a><span>魔术</span></a>
	<a><span>联系我</span></a>
</aside>	
<section class="page_one" id="page1">
 <audio id="music" autoplay="autoplay" loop="loop" preload="auto">
    <source src="mp3/背景音乐.mp3" type='audio/mpeg; codecs="mp3"'/>
</audio>
	<nav>
		<div class="nav_wrap">
			<div class="resume_logo">
				<a href="https://www.magicpeng.com/myPicture" style="color: white;" class="daohang">我的相册</a>
			</div>
			<div class="nav_bar">
				<ul class="nav_bar_ul">
					<li><a href="https://www.magicpeng.com/magic" class="daohang">魔术作品</a></li>
					<li><a href="https://www.magicpeng.com/game" class="daohang">冰山小游戏</a></li>
					<li><a href="https://www.magicpeng.com/gangqin" class="daohang">冰山键盘钢琴</a></li>
					<!-- <li><a href="http://www.magicpeng.com/HappyBirthday">洋芋生日快乐</a></li>  -->
				</ul>
			</div>
		</div>
	</nav>
	
	<div class="cen_con">
		<div class="portrait">
            <img class="pic" onmousemove="this.src='images/22.jpg'"/ onmouseout="this.src='images/portrait1.jpg'"/ src="images/portrait1.jpg" style="width: 200px;height: 200px;"/>
        </div>
		<div class="cen_text">
			<h2 style="font-size: 1.5em;">接下来，就是见证奇迹的时刻！</h2>
			<hr>
			<h3 style="font-size: 1.17em;"><span class="red">♥</span><span class="black">♠</span>魔术师大鹏<span class="black">♣</span><span class="red">♦</span></h3>
			<h3 style="font-size: 1.17em;">java软件工程师</h3>
			<h3 style="font-size: 1.17em;">安徽 /合肥</h3>
			<h3 style="font-size: 1.17em;">13721040925</h3>
		</div>
		
	</div>
	<div class="down_arrow">
		<a class="scroll"><span></span></a> 
	</div>
	
</section>

<section class="page_two" id="page2">
	<div class="con_wrap">
		<div class="tit_wrap">
			<h1>关于我</h1>
			<div class="scissors">
				<span></span>
			</div>
			<h2> 给我一个杠杆，我将撬动地球。</h2>
		</div>		
		<div class="myinfo" id="myinfo">
			<table>
				<tbody>
					<tr>
						<td rowspan="7">
							<img class="pic" onmousemove="this.src='images/22.jpg'"/ onmouseout="this.src='images/portrait1.jpg'"/ src="images/portrait1.jpg" style="width: 200px;height: 200px;"/>
						</td>
						<td>姓名 | 彭坤</td>
						<td>手机 | 13721040925</td>
					
					</tr>
					<tr>
						<td>性别 | 男</td>
						<td>邮箱 | magicpk2018@163.com</td>
					</tr>
					<tr>
						<td><a href="#" data-toggle="modal" data-target="#modal" id="weixin">微信 | Magic-LeiShen</a></td>
						<td><a href="#" data-toggle="modal" data-target="#modal" id="qqcode">QQ号 | 328407307</a></td>
					</tr>
					<tr>
						<td>出生 | 1995.04.25</td>
						<td>星座 | 金牛座</td>
					</tr>
					<tr>
						<td>居住 | 安徽省合肥市</td>
						<td>户籍 | 安徽省合肥市</td>
					</tr>
					<tr>
						<td>学历 | 专科</td>
						<td>学校 | 北大青鸟</td>
					</tr>
					<tr>
						<td>专业 | java软件工程</td>
						<td>爱好 | 魔术表演</td>
					</tr>
					<tr>
						<td colspan="8">
							<p>小作品 （查看网址：<a id="zuopin" href="https://www.magicpeng.com/game">https://www.magicpeng.com/game</a>）</p><br>
							<a class="daohang" href="https://www.magicpeng.com/xiaoxiaole">1.冰山消消乐</a>
							<a class="daohang" href="https://www.magicpeng.com/tetris">2.冰山俄罗斯方块</a>
							<a class="daohang" href="https://www.magicpeng.com/readHeart">3.冰山读心术</a>
							<a class="daohang" href="https://www.magicpeng.com/tanke">4.冰山坦克大战</a>
							<a class="daohang" href="https://www.magicpeng.com/zhiwu">5.冰山植物大战僵尸 </a>
							<a class="daohang" href="https://www.magicpeng.com/ChineseChess">6.冰山象棋 </a>
							<a class="daohang" href="https://www.magicpeng.com/doudizhu">7.冰山斗地主 </a>
							<a class="daohang" href="https://www.magicpeng.com/PlaneWar">8.冰山飞机大战 </a>
						</td>
					</tr>
					<tr>
						<td>
							微信小程序/公众号作品：
						</td>
					</tr>
					<tr>
						<td class="inner">
							<p>1.来自冰山的贪吃蛇</p>
							<img class="code" src="images/贪吃蛇.jpg" style="width: 150px;height: 150px;"/>
						</td>
						<td class="inner">
							<p>2.冰山导航</p>
							<img class="code" src="images/冰山导航.jpg" style="width: 150px;height: 150px;"/>
						</td>
						<td class="inner">
							<p>3.冰山计算器</p>
							<img class="code" src="images/计算器.jpg" style="width: 150px;height: 150px;"/>
						</td>
						<td class="inner">
							<p>4.微信公众号</p>
							<img class="code" src="images/公众号.jpg" style="width: 150px;height: 150px;"/>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="down_arrow">
		<a class="scroll"><span></span></a> 
	</div>
	<!-- 模态框（Modal） -->
	<div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                <h4 class="modal-title" id="myModalLabel"></h4>
	            </div>
	            <div class="modal-body"><img src="" id="wechatqq" /></div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	            </div>
	        </div><!-- /.modal-content -->
	    </div><!-- /.modal -->
	</div>
</section>
<section class="page_three" id="page3">
	<div class="con_wrap">
		<div class="tit_wrap">
			<h1>计算机软件</h1>
			<div class="scissors">
				<span></span>
			</div>
			<h2>代码，我们眼中的世界，别人眼中的天书。</h2>	
		</div>
		<div class="skill_con">
			<div class="canvas_wrap">
				<div class="canvas_con">
					<div class="text_con">
						<p class="percent">80%</p>
						<p class="chart_title">HTML5</p>
					</div>
					<canvas id="html5" width=160 height=160></canvas>
				</div>
				<div class="canvas_con">
					<div class="text_con">
						<p class="percent">70%</p>
						<p class="chart_title">CSS3</p>
					</div>
					<canvas id="css3" width=160 height=160></canvas>
				</div>
				<div class="canvas_con">
					<div class="text_con">
						<p class="percent">90%</p>
						<p class="chart_title">JS</p>
					</div>
					<canvas id="js" width=160 height=160></canvas>
				</div>
				<div class="canvas_con">
					<div class="text_con">
						<p class="percent">90%</p>
						<p class="chart_title">JQUERY</p>
					</div>
					<canvas id="jq" width=160 height=160></canvas>
				</div>
				<div class="canvas_con">
					<div class="text_con">
						<p class="percent">90%</p>
						<p class="chart_title">JAVA</p>
					</div>
					<canvas id="java" width=160 height=160></canvas>
				</div>
				<div class="canvas_con">
					<div class="text_con">
						<p class="percent">90%</p>
						<p class="chart_title">MySQL</p>
					</div>
					<canvas id="mysql" width=160 height=160></canvas>
				</div>
			</div>
			<div class="text_wrap">
				<p>1.  熟练使用HTML5、CSS、JavaScript、JSTL等前端开发技术。</p>
				<p>2.  熟练使用jQuery、Ajax、EasyUI、layDate、echarts等前端框架技术。</p>
				<p>3.  熟悉Java基础，有很好的面向对象、面向接口编程思维，熟悉如单例模式、工厂模式、职责连模式等主流的设计模式。</p>
				<p>4.  熟练使用MySql数据库，熟练掌握复杂查询语句的编写。</p>
				<p>5.  熟练使用JDBC，实现对数据库的持久化操作。</p>
				<p>6.  熟练掌握Tomcat等Web服务器的部署与配置。</p>
				<p>7.  熟练掌握Java相关开发工具Eclipse、MyEclipse的使用。</p>
				<p>8.  熟练掌握项目管理工具Maven的使用。</p>
				<p>9.  熟练掌握SSM（SpringMVC+Spring+MyBatis）和SSH（SpringMVC+Spring+Hibernate）框架。</p>
				<p>10.  会使用IO流技术。</p>
				<p>11.  了解Redis数据库。</p>
			</div>	
		</div>
		
	</div>
	<div class="down_arrow">
		<a class="scroll"><span></span></a> 
	</div>
</section>
<section class="page_four" id="page4">
    <div class="con_wrap">
		<div class="tit_wrap">
			<h1>魔术</h1>
			<div class="scissors">
				<span></span>
			</div>
			<h2>你相信这个世界上有读心术吗？</h2>
		</div>
	  	<div class="work_con">
	  		<div class="programe">
		    	<div class="work_time">读心术<br>心灵骇客</div>
			    <div class="work_text">
			      	<div class="triangle-left"></div>
			      	<div class="exCon">
				        <h4>我是大鹏</h4>
				        <h5>心灵骇客</h5>
				        <p>我观人于细微，控人于无形</p>
				        <p>生活中，65%的语言都是无声语言</p>
				        <p>一个表情，一个动作</p>
				        <p>就能出卖你的内心！</p>			        
				        <p>抓住人心，植入想法 </p>
				        <p>他的大脑，你做主！ </p>
						<p>这，就是魔术师大鹏的心灵术！</p>	       
					</div>
			    </div> 
			</div>
			
			<div class="programe">
		    	<div class="work_time">接下来<br>做一个测试</div>
			    <div class="work_text">
			      	<div class="triangle-left"></div>
			      	<div class="exCon">
				        <h4>如果三天三夜你在沙漠里感觉非常非常渴，</h4>
				        <h5>现在有4种饮料。</h5>
				        <p>A、可乐</p>
				        <p>B、矿泉水</p>
				        <p>C、橙汁</p>
				        <p>D、苏打水</p>			        
				        <p>你会选择哪一种？ </p>
				        <p>请在下方留下你的答案 </p>
					</div>
			    </div> 
			</div>
		</div>
		<br/>
		<hr/>
		<br/>
		<p><a href="https://www.magicpeng.com/magic" style="color: black;">想看更多精彩魔术？请点击这里</a></p>
    </div>
	<div class="down_arrow">
		<a class="scroll"><span></span></a> 
	</div>
</section>
<section class="page_five" id="page5">
	<div class="con_wrap">
		<div class="tit_wrap">
			<h1 id="QQ"><img src="images/QQ.jpg" style="height: 30px;width: 35px;"/>联系我</h1>
			<div class="scissors">
				<span></span>
			</div>	
			<h2>耐得住寂寞，做得成大事。</h2>
		</div>
		<div class="contact_detail" id="dibu">
			<ul class="con_style">
				<li>
					<span></span>
					<p>安徽省合肥市蜀山区</p>
				</li>
				<li>
					<span></span>
					<p>magicpk2018@163.com</p>
				</li>
				<li>
					<span></span>
					<p>13721040925</p>
				</li>
			</ul>
			<div class="contact_info" id="biaodan">
				<form action="reader/send" method="post" id="send">
				<label>
					<input type="text" id="username" placeholder="你的名字" required="required" name="readerName"/>
					<p  id="check_username"></p>
				</label>
				<label>
					<input type="text" id="usermail" placeholder="你的手机号" required="required" name="readerEmail"/>
					<p id="check_usermail"></p>
				</label>	
				<label>
					<input type="text" id="usertheme" placeholder="主题" required="required" name="title" maxlength="25"/>
					<p id="check_usertheme"></p>
				</label>	
				<label>
					<textarea id="usercon" placeholder="内容" required="required" name="content"></textarea>
					<p id="check_usercon" ></p>
				</label>
					<input type="submit" id="sub" value="发送" /> 
				</form>
			</div>
			<table id="down">
				<tbody>
					<tr>
						<td colspan="2">
							<p style="font-size: 1.8rem;">冰山安卓APP下载：</p>
						</td>
					</tr>
					<tr>
						<td class="inner">
							<p style="font-size: 1.8rem;">1.冰山斗地主</p>
							<img class="code" src="images/冰山斗地主.png" style="width: 150px;height: 200px;"/>
						</td>
						<td class="inner">
							<p style="font-size: 1.8rem;">2.冰山天气</p>
							<img class="code" src="images/冰山天气.png" style="width: 150px;height: 200px;"/>
						</td>
						<td class="inner">
							<p style="font-size: 1.8rem;">3.冰山象棋</p>
							<img class="code" src="images/冰山象棋.png" style="width: 150px;height: 200px;"/>
						</td>
						<td class="inner">
							<p style="font-size: 1.8rem;">4.冰山消消乐</p>
							<img class="code" src="images/冰山消消乐.png" style="width: 150px;height: 200px;"/>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>	
</section>
<div class="zhezhao"></div>
<div class="result" id="result">
	<div class="resultChid">
		<h2 id="h"></h2>
		<div class="resultMain">
			<p id="con"></p>
			<button id="sure">确定</button>
		</div>
	</div>
</div>
<div style="text-align:center;">
</div>
</body>
<script type="text/javascript" src="js/main.js"></script>
</html>
