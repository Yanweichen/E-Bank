var canvas = document.getElementById("cas");
var ctx = canvas.getContext("2d");

resize();
window.onresize = resize;

function resize() {
	canvas.width = window.innerWidth || document.documentElement.clientWidth
			|| document.body.clientWidth;
	canvas.height = window.innerHeight || document.documentElement.clientHeight
			|| document.body.clientHeight;
}

var RAF = (function() {
	return window.requestAnimationFrame || window.webkitRequestAnimationFrame
			|| window.mozRequestAnimationFrame || window.oRequestAnimationFrame
			|| window.msRequestAnimationFrame || function(callback) {
				window.setTimeout(callback, 1000 / 60);
			};
})();

// 鼠标活动时，获取鼠标坐标
var warea = {
	x : null,
	y : null,
	max : 20000
};
window.onmousemove = function(e) {
	e = e || window.event;

	warea.x = e.clientX;
	warea.y = e.clientY;
};
window.onmouseout = function(e) {
	warea.x = null;
	warea.y = null;
};

// 添加粒子
// x，y为粒子坐标，xa, ya为粒子xy轴加速度，max为连线的最大距离
var dots = [];
var colors = [ 'rgba(0,255,255,0.5)', 'rgba(106,90,205,0.5)',
		'rgba(0,255,127,0.5)', 'rgba(0,191,255,0.5)', 'rgba(255,255,0,0.5)',
		'rgba(255,106,106,0.5)' ]
for (var i = 0; i < 300; i++) {
	var x = Math.random() * canvas.width;
	var y = Math.random() * canvas.height;
	var xa = Math.random() * 2 - 1;
	var ya = Math.random() * 2 - 1;
		var r = getRandom(3);
	var color = colors[getRandom(5)]
	dots.push({
		x : x,
		y : y,
		xa : xa,
		ya : ya,
		r : r,
		color : color,
		max : 6000
	})
}

// 延迟100秒开始执行动画，如果立即执行有时位置计算会出错
setTimeout(function() {
	animate();
}, 100);

//获得随机数
function getRandom(n) {
	return Math.floor(Math.random() * n + 1)
}

// 每一帧循环的逻辑
function animate() {
	ctx.clearRect(0, 0, canvas.width, canvas.height);

	// 将鼠标坐标添加进去，产生一个用于比对距离的点数组
	var ndots = [warea].concat(dots);

	dots.forEach(function(dot) {

		// 粒子位移
		dot.x += dot.xa;
		dot.y += dot.ya;
		
		// 遇到边界将加速度反向
		dot.xa *= (dot.x > canvas.width || dot.x < 0) ? -1 : 1;
		dot.ya *= (dot.y > canvas.height || dot.y < 0) ? -1 : 1;

		// 绘制点
		// ctx.fillRect(dot.x - 0.5, dot.y - 0.5, 1, 1);
		ctx.beginPath();
		ctx.arc(dot.x - 0.5, dot.y - 0.5, dot.r, 0, 360, false);
		ctx.fillStyle = dot.color//'rgba('+r+','+g+','+b+',0.5)';//填充颜色,默认是黑色
		ctx.strokeStyle = dot.color
		ctx.fill();//画实心圆
		ctx.closePath();
		ctx.stroke();
		// 循环比对粒子间的距离
		for (var i = 0; i < ndots.length; i++) {
			var d2 = ndots[i];

			if (dot === d2 || d2.x === null || d2.y === null)
				continue;

			var xc = dot.x - d2.x;
			var yc = dot.y - d2.y;

			// 两个粒子之间的距离
			var dis = xc * xc + yc * yc;

			// 如果两个粒子之间的距离小于粒子对象的max值，则在两个粒子间画线
			var mousex = warea.x;
			var mousey = warea.y;
			var finalx = mousex - dot.x;
			var finaly = mousey - dot.y
			if (dis < d2.max
					&& (Math.abs(finalx) < 300 && Math.abs(finaly) < 200)) {
				// 画线
				ctx.beginPath();
				ctx.lineWidth = 0.5;
				ctx.strokeStyle = dot.color//'rgba('+r+','+g+','+b+',' + (ratio + 0.02) + ')';
				ctx.moveTo(dot.x, dot.y);
				ctx.lineTo(d2.x, d2.y);
				ctx.closePath();
				ctx.stroke();
			}

		}

		// 将已经计算过的粒子从数组中删除
		ndots.splice(ndots.indexOf(dot), 1);
	});

	RAF(animate);

}