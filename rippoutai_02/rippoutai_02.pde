int numCubes = 12;  // 立方体の数
float angle = 0;    // 回転角度
float radius = 300; // 円の半径（少し大きく）

void setup() {
  size(1600, 900, P3D); // ウィンドウサイズを1600x900に変更
}

void draw() {
  background(0); // 背景を黒
  translate(width / 2, height / 2, -700); // 中心に移動

  // 視点を斜め上から見る設定
  rotateX(PI / 6); // X軸方向に30度回転
  
  rotateY(angle); // Y軸回転で水平に回す
  for (int i = 0; i < numCubes; i++) {
    float theta = TWO_PI / numCubes * i; // 各立方体の角度
    float x = cos(theta) * radius; // 円形配置のX座標
    float z = sin(theta) * radius; // 円形配置のZ座標

    pushMatrix();
    translate(x, 0, z); // 円形配置に立方体を移動
    rotateY(-angle);    // 個別の立方体を逆回転
    drawCube();
    popMatrix();
  }

  angle += radians(1); // 回転速度
}

void drawCube() {
  noFill(); // 塗りつぶしなし
  stroke(255); // 線の色を白
  strokeWeight(3); // 線の太さを3ピクセルに設定
  box(100); // 立方体のサイズ（少し大きく）
}
