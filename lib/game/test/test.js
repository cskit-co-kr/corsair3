var Textures = {};
var panel, playfield, money, shipDiv, fpsDiv;
var started = false;
var rotAnim = 0;
var direction = true;
var prevTs = false;
var playW = 0;
var prevBullet = 0;
var bulletFrac;
var bulletSpeed;
var shipSpeed = 100;
var fireMode = 0;
var coins = {};
var coinF = (coinL = false);
var bulletsArr = [];
var bulletsPull = [];
var bangParts = [];
var score = 0;
var level = 0;
var titres = true;
var dieing = false;
var switchOn = false;
var pause = false;
var curData;
var audio = {};
var fps = (fts = 0);
var coinsCount = 30,
  coinSize;
var stage, ship, shipLayer, renderer, imgs, cham, island, tower;
var bang, btnbg, btn, btnCont, fade, lvlText, scoreText, game, scoreCoin;
var angle = (allW = stageW = allH = cX = cY = radius = 0);
var scale = 1;
var orientation = 0;
var table = false;
var userScore = 0;
var wave1, wave2, moneyCont, circle, bg;

function post(url, data, cb, failCb) {
  var xhr = new XMLHttpRequest();
  var body = [];
  for (var i in data) {
    body.push(encodeURIComponent(i) + "=" + encodeURIComponent(data[i]));
  }
  xhr.onreadystatechange = function () {
    if (xhr.readyState == 4 && xhr.status == 200) {
      var resp = xhr.responseText;
      cb(JSON.parse(resp));
    } else if (failCb) {
      failCb();
    }
  };
  xhr.open("POST", url, true);
  xhr.send(body.join("&"));
}

function start() {
  if (titres) {
    document.body.className = "";
    titres = false;
    if (switchOn) {
      cham.fadeOut(btnrestart, 10);
      cham.fadeIn(btnplay, 10);
    }
    newGame();
  } else {
    started = true;
    cham.fadeIn(btnswitch, 10);
    cham.fadeOut(btnplay, 10);
    prevTs = false;
  }
}

function newGame() {
  bulletFrac = 400;
  bulletSpeed = 130;
  score = 0;
  level = 1;
  pause = false;
  lvlText.text = "Level " + level;
  scoreText.text = score + "";
  resetLevel();
  ge("score_share").className = "score_share";
}

function resetLevel() {
  (angle = 0), (rotAnim = 0);
  prevBullet = 0;
  fireMode = 0;
  var b;
  while ((b = bulletsArr.shift())) {
    b.done = true;
    b.alpha = 0;
    bulletsPull.push(b);
  }
  if (!direction) {
    ship.scale.x = -ship.scale.x;
    direction = true;
  }
  prevTs = false;
  coinF = 360;
  coinL = 0;
  ship.alpha = 1;
  var delay = 0;
  for (var deg in coins) {
    var c = coins[deg];
    coinF = Math.min(coinF, deg);
    coinL = Math.max(coinL, deg);
    if (!c.done) {
      continue;
    }
    c.done = false;
    setTimeout(
      (function (c) {
        return function () {
          for (var i in c.chams) {
            c.chams[i].pause();
          }
          c.chams = [];

          cham.fadeIn(c, 15);
          cham.scale(c, c.stScale, c.stScale, 15);
        };
      })(c),
      delay
    );
    delay += 20;
  }
  var tSc = tower.scale.x;
  var iSc = island.scale.x;
  cham.scale(tower, tSc * 1.15, tSc * 1.15, 15).onComplete = function () {
    cham.scale(tower, tSc, tSc, 18);
  };
  cham.scale(island, iSc * 1.08, iSc * 1.08, 10).onComplete = function () {
    cham.scale(island, iSc, iSc, 12);
  };
}

function stop() {
  if (!titres) {
    titres = true;
    dieing = false;
    ge("results").className = "results score";
    document.body.className = "results_show";
    ge("score_val").innerHTML = score;

    cham.fadeOut(btnswitch, 10);
    cham.fadeIn(btnrestart, 10);
    switchOn = true;
  }
}

function swap() {
  if (dieing || pause) {
    return false;
  }
  cham.scale(btnCont, 0.9, 0.9, 5).onComplete = function () {
    cham.scale(btnCont, 1, 1, 5);
  };
  if (!started) {
    start();
    return false;
  }
  direction = !direction;
  ship.scale.x = -ship.scale.x;
  fireMode = 3;
  //ion.sound.play("swap");
  return false;
}

function nextLevel() {
  if (!started) {
    return false;
  }
  //started = false;
  pause = true;
  level += 1;
  score += 10;
  bulletFrac = bulletFrac * 0.9;
  bulletSpeed = bulletSpeed * 1.1;
  if (level % 10 == 0) {
    shipSpeed = shipSpeed * 1.1;
  }
  lvlText.text = "Level " + level;
  scoreText.text = score + "";
  cham.scale(lvlText, 1.3, 1.3, 20).onComplete = function () {
    cham.scale(lvlText, 1, 1, 20);
  };

  cham.fadeIn(fade, 10).onComplete = function () {
    started = false;

    pause = false;

    cham.fadeOut(btnswitch, 10);
    cham.fadeIn(btnplay, 10);

    resetLevel();
    cham.fadeOut(fade, 40);
  };
}

function fireBullet() {
  var bullet = bulletsPull.shift();
  if (bullet) {
    bullet.alpha = 1;
    bullet.done = false;
  } else {
    var bullet = new PIXI.Sprite(imgs.bullet);
    stage.addChildAt(bullet, stage.getChildIndex(tower));
  }
  bullet.anchor.set(0.5, 0.5);

  var a;
  var calcAngle = (shipSpeed * 92) / bulletSpeed;
  if (fireMode == 4) {
    fireMode = 0;
    a = angle + (Math.random() * 90 - 45);
  } else if (fireMode == 3) {
    a = angle;
  } else if (fireMode == 2) {
    fireMode = 0;
    a = angle + (direction ? calcAngle : -calcAngle);
  } else {
    a = angle + (direction ? calcAngle : -calcAngle);
    a += Math.random() * 60 - 30;
  }
  fireMode += 1;

  if (a > 360) {
    a -= 360;
  }
  bullet.deg = a;
  bullet.rotation = bullet.a = radians(a);
  bullet.dist = 0;
  bullet.width = p(4);
  bullet.height = bullet.width * 3;
  bullet.x = rX(a, bullet.dist);
  bullet.y = rY(a, bullet.dist);
  bulletsArr.push(bullet);
}

function drawBullets(time) {
  for (var i in bulletsArr) {
    var bullet = bulletsArr[i];
    var a = bullet.a;
    bullet.dist += (time * bulletSpeed) / 1000;
    bullet.x = rX(a, bullet.dist);
    bullet.y = rY(a, bullet.dist);

    if (bullet.dist > 200) {
      bullet.alpha = 0;
      bulletsPull.push(bulletsArr.splice(i, 1)[0]);
      break;
    } else if (bullet.dist > 85 && bullet.dist < 95 && started && !pause) {
      var aDif = Math.abs(bullet.deg - angle);
      while (aDif > 360) {
        aDif -= 360;
      }
      if (aDif < 5 || aDif > 355) {
        cham.fadeOut(bullet, 10);
        bulletsPull.push(bulletsArr.splice(i, 1)[0]);
        //die(rX(a, bullet.dist+5), rY(a, bullet.dist+5))
        die();
        break;
      }
    }
  }
}

function die() {
  if (!started) {
    return false;
  }
  started = false;
  dieing = shipSpeed;
  if (!bang) {
    bang = new PIXI.Container();
    bang.x = 0;
    bang.y = 0;
    var colors = [0xcc1a1a, 0xffe594, 0xffc749, 0xffffff, 0xa52323, 0xfb5923];

    for (var i = 0; i < 25; i++) {
      var circ = new PIXI.Graphics();
      circ.beginFill(colors[Math.floor(Math.random() * colors.length)], 1);
      circ.drawCircle(0, 0, p(5));
      circ.endFill();
      bang.addChild(circ);
      circ.alpha = 0;
      bangParts.push(circ);
    }
    stage.addChild(bang);
  }
  var size = 1.5;
  var delay = 0;
  for (var i in bangParts) {
    var part = bangParts[i];
    var bRand = p(4);
    part.scaleTo = 0.8;

    setTimeout(
      (function (part) {
        return function () {
          part.alpha = 0;
          part.scale.set(0.01, 0.01);
          var anim = cham.scale(part, part.scaleTo, part.scaleTo, 20);
          var aX = rX(radians(angle), 100);
          var aY = rY(radians(angle), 100);
          part.x = aX + rand(bRand, true);
          part.y = aY + rand(bRand, true);
          cham.fadeIn(part, 20);
          cham.slide(part, aX + rand(bRand, true), aY + rand(bRand, true), 20);
          anim.onComplete = function () {
            var aX = rX(radians(angle), 100);
            var aY = rY(radians(angle), 100);
            cham.scale(part, 0, 0, 70);
            cham.fadeOut(part, 40);
            cham.slide(
              part,
              aX + rand(bRand, true),
              aY + rand(bRand, true),
              40
            );
          };
        };
      })(part),
      delay
    );
    delay += 30;
  }
  var oldScaleX = ship.scale.x;
  var oldScaleY = ship.scale.y;
  cham.scale(ship, -ship.scale.x * 1.5, ship.scale.y * 1.5, 15).onComplete =
    function () {
      cham.scale(ship, oldScaleX, oldScaleY, 15);
    };
  setTimeout(function () {
    cham.fadeOut(ship, 30);
  }, 800);
  setTimeout(stop, 2000);
  for (var i = 0; i < table.length; i++) {
    var row = table[i];
    if (row.current && row.score < score) {
      ge("updating").style.display = "block";
      row.score = score;
      while (i > 0) {
        i--;
        var prevRow = table[i];
        if (prevRow.score < score) {
          var oldPos = row.pos;
          row.pos = prevRow.pos;
          prevRow.pos = oldPos;
          table[i] = row;
          table[i + 1] = prevRow;
        } else {
          break;
        }
      }
      updateTable();
      break;
    }
  }
  if (score > userScore) {
    sendScore();
  } else {
    getHighScores();
  }
  ion.sound.play("explosion");
}

function updateUserScore() {
  if (!table || !table.length) return;
  for (var i = 0; i < table.length; i++) {
    if (table[i].current) {
      userScore = table[i].score;
      return;
    }
  }
}

function sendScore() {
  if (!curData) {
    ge("updating").style.display = "none";
    return;
  }
  post(
    "/api/setScore",
    {
      data: curData,
      score: score || 0,
    },
    function (result) {
      table = result.scores;
      updateUserScore();
      updateTable();
      ge("updating").style.display = "none";
      if (result.new) {
        ge("score_share").className = "score_share shown";
      }
    },
    function () {
      ge("updating").style.display = "none";
    }
  );
}

function getHighScores() {
  if (!curData) return;
  post(
    "/api/getHighScores",
    {
      data: curData,
    },
    function (result) {
      table = result.scores;
      updateUserScore();
      updateTable();
    }
  );
}

function updateTable() {
  if (table === false) return;
  var table_html = "";
  for (var i = 0; i < table.length; i++) {
    var row = table[i];
    table_html +=
      '<div class="row' +
      (row.current ? " you" : "") +
      '">' +
      '<span class="row_place">' +
      row.pos +
      ".&nbsp;&nbsp;</span>" +
      '<span class="row_name">' +
      row.name +
      "</span>" +
      '<span class="row_score">' +
      row.score +
      "</span>" +
      "</div>";
  }
  ge("scores_table").innerHTML = table_html;
}

function tryFallbackImage(img) {
  if (img.src.substr(0, 5) == "data:") {
    return (img.src = "images/" + img.filename + ".svg");
  }
  if (img.src.substr(-3, 3) == "svg") {
    return (img.src = "images/" + img.filename + ".png");
  }
  return false;
}

function loadImages(files, cb) {
  var images = {};
  var cnt = 0,
    done = 0;
  for (var i in files) {
    cnt += 1;
  }
  for (var i in files) {
    var img = new Image();
    img.src = files[i];
    img.filename = i;
    img.onload = function () {
      if (!this.width || !this.height) {
        return tryFallbackImage(this);
      }
      done += 1;
      if (done == cnt) {
        cb(images);
      }
    };
    img.onerror = function (e) {
      tryFallbackImage(this);
    };
    images[i] = img;
  }
}

function p(w) {
  return (stageW * w) / 100;
}
function radians(degrees) {
  return (degrees * Math.PI) / 180;
}

// Converts from radians to degrees.
function degrees(radians) {
  return (radians * 180) / Math.PI;
}
var a90 = radians(90);

function aX(a, pos) {
  return (pos / 100) * radius * Math.cos(a - a90);
}
function aY(a, pos) {
  return (pos / 100) * radius * Math.sin(a - a90);
}

function rX(a, pos) {
  return cX + (pos / 100) * radius * Math.cos(a - a90);
}
function rY(a, pos) {
  return cY + (pos / 100) * radius * Math.sin(a - a90);
}
function rand(num, sign) {
  if (sign) {
    return Math.floor(Math.random() * num * 2 - num);
  } else {
    return Math.floor(Math.random() * num);
  }
}

function doneCoin(coinN) {
  if (!started) return;
  var c = coins[coinN];
  if (!c || c.done) return;
  c.done = true;
  c.chams = [];

  //cham.slide(c, c.x-(c.width*3/3), c.y-(c.height*3/2), 20);
  c.chams.push(cham.fadeOut(c, 20));
  c.chams.push(cham.scale(c, c.stScale * 2, c.stScale * 2, 20));
  coinF = false;
  var has = false;
  for (var i in coins) {
    if (coins[i].done) continue;
    has = true;
    if (coinF === false) {
      coinF = i;
    }
    coinL = i;
  }
  if (!has) {
    nextLevel();
  } else {
    score += 1;
  }
  scoreText.text = score + "";

  ion.sound.play("coin2", { volume: 1 });
}

function drawMoney() {
  for (var i = 0; i < coinsCount; i += 1) {
    var deg = parseInt((i / coinsCount) * 360);
    if (deg > 360) {
      deg -= 360;
    }
    var a = radians(deg);
    if (deg && deg != 360) {
      var coin = new PIXI.Sprite(imgs.coin);
      coin.anchor.set(0.5, 0.5);
      moneyCont.addChild(coin);
      coin.height = coin.width = coinSize;
      coin.stScale = coin.scale.x;
      coin.scale.set(coin.stScale * 2, coin.stScale * 2);
      coin.alpha = 0;
      coin.done = 1;
      coins[deg] = coin;
    }
  }
}

function go(ts) {
  requestAnimationFrame(go);
  cham.update();
  if (!ts) {
    return;
  }
  if (prevTs === false) {
    prevTs = ts;
    return;
  }
  var time = ts - prevTs;
  prevTs = ts;
  drawBullets(time);

  if (started || dieing > 0) {
    var add = (time * shipSpeed) / 1000;
    if (dieing) {
      var add = (time * dieing) / 1000;
      dieing -= time / 1.5;
    }
    if (direction) {
      angle += add;
      if (angle > 360) {
        angle -= 360;
      }
      var am = angle - coinF;
      if (am > -5 && am < 5) {
        doneCoin(coinF);
      }
    } else {
      angle -= add;
      if (angle < 0) {
        angle += 360;
      }
      var am = coinL - angle;
      if (am > -5 && am < 5) {
        doneCoin(coinL);
      }
    }
    if (!prevBullet || ts - prevBullet > bulletFrac) {
      prevBullet = ts;
      fireBullet();
    }
  }

  var rAngle = radians(angle);

  ship.x = rX(rAngle, 100);
  ship.y = rY(rAngle, 100);
  ship.rotation = rAngle;

  //island.rotation -= 0.001
  //tower.rotation -= 0.001
  //tower.rotation = rAngle / 2

  renderer.render(stage);
}

function ge(id) {
  return document.getElementById(id);
}

function createWave() {
  var wave = new PIXI.Graphics();
  //wave.beginFill(0xFFFFFF)
  stage.addChild(wave);
  return wave;
}

function startWave(wave, duration) {
  wave.scale.set(1, 1);
  wave.alpha = 1;
  cham.scale(wave, 1.1, 1.1, duration).onComplete = function () {
    cham.scale(wave, 1.2, 1.2, duration - 1);
    cham.fadeOut(wave, duration).onComplete = function () {
      startWave(wave, duration);
    };
  };
}

function sizeStage() {
  allW = game.offsetWidth;
  allH = game.offsetHeight;
  allW = allW * scale;
  allH = allH * scale;
  if (!renderer) {
    renderer = PIXI.autoDetectRenderer(allW, allH);
  } else {
    renderer.resize(allW, allH);
  }
  var canvas = renderer.view;
  canvas.width = allW;
  canvas.height = allH;
  canvas.style.width = allW / scale + "px";
  canvas.style.height = allH / scale + "px";
  if (allW > allH) {
    orientation = 1;
    cX = (allW * 0.7) / 2;
    cY = allH / 2;
    if (allW * 0.7 < allH) {
      stageW = allW * 0.7;
    } else {
      stageW = allH;
    }
  } else {
    orientation = 0;
    cX = allW / 2;
    cY = (allH * 0.7) / 2;
    if (allW * 1.3 > allH) {
      stageW = allH * 0.7;
    } else {
      stageW = allW;
    }
  }
}

function posElements(first) {
  radius = p(41);

  var islandSize = p(32);
  island.x = cX;
  island.y = cY;
  island.width = islandSize;
  island.height = islandSize;

  var shipSize = p(8);
  ship.x = rX(radians(0), 100);
  ship.y = rY(radians(0), 100);
  ship.width = shipSize;
  ship.height = shipSize;

  var towerSize = p(14);
  tower.x = cX;
  tower.y = cY;
  tower.width = towerSize;
  tower.height = towerSize;

  bg.clear();
  bg.beginFill(0xffffff);
  if (orientation) {
    bg.drawRect(0, 0, allW * 0.3, allH);

    bg.y = 0;
    btnCont.y = cY;
    if (first) {
      bg.x = allW;
      btnCont.x = allW * 0.7 + allW * 0.3;
      cham.slide(bg, allW * 0.7, 0, 20, "decelerationCubed");
      cham.slide(
        btnCont,
        allW * 0.7 + (allW * 0.3) / 2,
        cY,
        30,
        "decelerationCubed"
      );
    } else {
      bg.x = allW * 0.7;
      btnCont.x = allW * 0.7 + (allW * 0.3) / 2;
    }
  } else {
    btnCont.x = cX;
    bg.x = 0;
    if (first) {
      bg.y = allH;
      btnCont.y = allH * 0.7 + allH * 0.3;
      cham.slide(bg, 0, allH * 0.7, 20, "decelerationCubed");
      cham.slide(
        btnCont,
        cX,
        allH * 0.7 + (allH * 0.3) / 2,
        30,
        "decelerationCubed"
      );
    } else {
      bg.y = allH * 0.7;
      btnCont.y = allH * 0.7 + (allH * 0.3) / 2;
    }
    bg.drawRect(0, 0, allW, allH * 0.3);
  }

  btnbg.height = btnbg.width = p(32);
  btnplay.height = p(12);
  btnplay.width = p(10);

  btnswitch.height = btnswitch.width = p(12);

  btnrestart.width = p(10);
  btnrestart.height = p(12);

  lvlText.x = p(5) + lvlText.width / 2;
  lvlText.y = p(3.5) + lvlText.height / 2;

  if (orientation) {
    scoreText.x = allW * 0.7 - p(8);
  } else {
    scoreText.x = allW - p(8);
  }
  scoreText.y = p(3.5);

  scoreCoin.x = scoreText.x + p(1);
  scoreCoin.y = scoreText.y + p(0.8);
  scoreCoin.height = scoreCoin.width = p(3.2);

  wave1.x = cX;
  wave1.y = cY;
  wave1.clear();
  wave1.beginFill(0xe0fdff);
  wave1.drawCircle(0, 0, p(25));

  /*wave2.x = cX
  wave2.y = cY
  wave2.clear()
  wave2.beginFill(0xE0FDFF)
  wave2.drawCircle(0, 0, p(25))*/

  circle.x = cX;
  circle.y = cY;

  moneyCont.x = cX;
  moneyCont.y = cY;

  circle.clear();
  circle.lineStyle(p(0.8), 0xe0fdff, 1);
  circle.drawCircle(0, 0, radius);

  coinSize = p(4);
  for (var deg in coins) {
    var coin = coins[deg];
    var a = radians(deg);
    coin.x = coin.startX = aX(a, 100);
    coin.y = coin.startY = aY(a, 100);
    coin.height = coin.width = coinSize;
  }

  fade.clear();
  fade.beginFill(0xffffff);
  if (orientation) {
    fade.drawRect(0, 0, allW * 0.7, allH);
  } else {
    fade.drawRect(0, 0, allW, allH * 0.7);
  }

  var resDiv = ge("results");
  if (orientation) {
    resDiv.style.width = "70%";
    resDiv.style.height = "100%";
  } else {
    resDiv.style.width = "100%";
    resDiv.style.height = "70%";
  }
}

function onResize() {
  sizeStage();
  posElements();
}

function main() {
  curData = (location.hash || "").substr(1);
  curData = curData.replace(/[\?&].*/g, "");

  game = ge("game");

  scale = window.devicePixelRatio || 1;
  sizeStage();
  /*if (scale > 2) {
    scale = 2
  }
  scale = 1*/
  var scaleForHighResDisplay = scale > 1;
  sizeStage();
  renderer.backgroundColor = 0xd3f7ff;
  game.appendChild(renderer.view);

  stage = new PIXI.Container();
  cham = new Charm(PIXI);

  ion.sound({
    sounds: [
      {
        name: "coin2",
      },
      {
        name: "explosion",
      },
      {
        name: "swap",
      },
    ],
    path: "sounds/",
    multiplay: true,
    volume: 1,
    preload: true,
  });

  loadImages(Graphics, function (loadedImgs) {
    imgs = {};
    for (var i in loadedImgs) {
      imgs[i] = new PIXI.Texture(new PIXI.BaseTexture(loadedImgs[i]));
    }

    var waveDuration = 100;
    wave1 = createWave();
    //startWave(wave1, waveDuration)

    /*wave2 = createWave()
    cham.scale(wave2, 1, 1, waveDuration).onComplete = function() {
      startWave(wave2, waveDuration)
    }*/

    island = new PIXI.Sprite(imgs.island);
    island.anchor.set(0.5, 0.5);
    stage.addChild(island);

    radius = p(41);
    circle = new PIXI.Graphics();
    stage.addChild(circle);

    coinSize = p(4);
    moneyCont = new PIXI.Container();
    stage.addChild(moneyCont);
    drawMoney();

    ship = new PIXI.Sprite(imgs.ship);
    ship.rotation = 0.04;

    ship.anchor.set(0.5, 0.5);
    stage.addChild(ship);

    tower = new PIXI.Sprite(imgs.tower);
    tower.anchor.set(0.5, 0.5);
    stage.addChild(tower);

    btnCont = new PIXI.Container();
    bg = new PIXI.Graphics();
    bg.interactive = true;
    bg.on("mousedown", swap);
    bg.on("touchstart", function () {
      ion.sound.play("coin2", { volume: 0 });
      swap();
    });
    stage.addChild(bg);

    btnbg = new PIXI.Sprite(imgs.btn);
    btnplay = new PIXI.Sprite(imgs.btnplay);
    btnswitch = new PIXI.Sprite(imgs.btnswitch);
    btnrestart = new PIXI.Sprite(imgs.btnrestart);
    btnbg.anchor.set(0.5, 0.5);
    btnCont.addChild(btnbg);
    btnplay.anchor.set(0.4, 0.5);
    btnplay.alpha = 1;
    btnCont.addChild(btnplay);

    btnswitch.anchor.set(0.5, 0.5);
    btnswitch.alpha = 0;
    btnCont.addChild(btnswitch);

    btnrestart.anchor.set(0.5, 0.5);
    btnrestart.alpha = 0;
    btnCont.addChild(btnrestart);

    stage.addChild(btnCont);

    lvlText = new PIXI.Text("Level 1", {
      fontFamily: "Charter, Baskerville, Georgia",
      fontSize: p(4),
      fontWeight: "bold",
      fill: 0x4d4d4d,
    });
    lvlText.anchor.set(0.5, 0.5);
    stage.addChild(lvlText);

    scoreText = new PIXI.Text("0", {
      fontFamily: "Charter, Baskerville, Georgia",
      fontSize: p(4),
      fontWeight: "bold",
      fill: 0x4d4d4d,
    });
    scoreText.anchor.set(1, 0);
    stage.addChild(scoreText);

    scoreCoin = new PIXI.Sprite(imgs.coin);
    stage.addChild(scoreCoin);

    fade = new PIXI.Graphics();
    fade.alpha = 0;
    stage.addChild(fade);

    posElements(true);
    go();

    window.onresize = onResize;
  });
  renderer.render(stage);

  getHighScores();

  ge("score_share").onclick = function () {
    TelegramGameProxy && TelegramGameProxy.shareScore();
  };

  document.onkeydown = function (e) {
    var key = e.which || e.keyCode;
    if (key == 40 || key == 38 || key == 32) {
      swap();
    } else if (key == 37 || key == 39) {
      swap();
    }
  };
}

window.onLoad = main;
if (window.loaded) {
  main();
}
