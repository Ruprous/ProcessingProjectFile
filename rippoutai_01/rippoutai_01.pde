int numCubes = 12;  // 立方体の数
float angle = 0;    // 回転角度
float radius = 400; // 円の半径

void setup() {
  size(1900, 1000, P3D); // P3Dで3D描画、ウィンドウサイズを1900x1000に
}

void draw() {
  background(0); // 背景を黒
  translate(width / 2, height / 2, -800); // 中心に移動

  // 全体の斜め回転
  rotateX(PI / 6); // X軸方向に30度回転
  rotateZ(PI / 8); // Z軸方向に22.5度回転
  
  rotateY(angle); // Y軸方向に回転（全体の回転）
  for (int i = 0; i < numCubes; i++) {
    float theta = TWO_PI / numCubes * i; // 各立方体の角度
    float x = cos(theta) * radius; // 円形配置のX座標
    float z = sin(theta) * radius; // 円形配置のZ座標

    pushMatrix();
    translate(x, 0, z); // 円形配置に立方体を移動
    rotateY(-angle);    // 個別の立方体を逆回転（視点を固定）
    drawCube();
    popMatrix();
  }

  angle += radians(1); // 回転速度
}

void drawCube() {
  noFill(); // 塗りつぶしなし
  stroke(255); // 線の色を白
  strokeWeight(4); // 線の太さを4ピクセルに設定
  box(100); // 立方体のサイズ（拡大）
}
