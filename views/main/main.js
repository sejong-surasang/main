const target = document.querySelector("#dynamicText");

let texts = [
  "수라상",
  "혼밥 싫어",
  "소금구이 덮밥",
  "육회 비빔밥",
  "세종대왕 돈까스",
  "새우튀김알밥",
  "우삼겹 된장찌개",
  "불닭 치즈 도리아",
  "학관 냉모밀 맛있다",
];

function blink() {
  target.classList.toggle("active");
}

function writeText(_letters) {
  if (_letters.length > 0) {
    target.textContent += _letters.shift();
    setTimeout(() => writeText(_letters), 100);
  } else {
    setTimeout(newText, 1000);
  }
}

let index = -1;
function newText() {
  target.textContent = "";
  let temp = Math.floor(Math.random() * texts.length);
  if (index != temp) {
    index = temp;
  } else {
    index = (temp + 1) % texts.length;
  }
  let text = texts[index];
  let letters = text.split("");
  writeText(letters);
}

setInterval(blink, 500);
newText();
