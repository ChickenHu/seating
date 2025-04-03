document.addEventListener("DOMContentLoaded", () => {
    // Select the table element from the index.html file
    const table = document.getElementById('table');
    const NAMES = [
        "何子耘",
        "胡文馨",
        "李明蔚",
        "任朗豪",
        "余雨翰",
        "赵若杰",
        "陈星宏",
        "单琦雅",
        "胡苏寒",
        "李思齐",
        "刘睿宇",
        "刘哲佚",
        "吕林镔",
        "谭正屹",
        "唐浩然",
        "王宸奥",
        "王思钦",
        "谢美琳",
        "张承蓓",
        "张涵峤",
        "张颢严",
        "禇若茜",
        "陈靓颖",
        "王冠琦",
        "唐建业",
        "邵琳轩"
    ];
    const randomButton = document.getElementById("rand");
    const randomRutton10 = document.getElementById("rand10");
    const cells = table.getElementsByTagName('td');
    function goRandom() {
        var Names = NAMES;
        for (let i = 1; i < Names.length; i++) {
            const random = Math.floor(Math.random() * (i + 1));
            [Names[i], Names[random]] = [Names[random], Names[i]];
        }
        for (let i = 0; i < cells.length; i++) {
            if (i < Names.length) {
                cells[i].innerText = Names[i];
            } else {
                cells[i].innerText = '';
            }
        }
        // location.reload();
    }
    randomButton.addEventListener("click", goRandom);
    randomRutton10.addEventListener("click", (event) => {
        for (let i = 0; i < 10; i++) {
            setTimeout(() => goRandom(), i * 100);
        }
    });
    // Add event listener for the "Rand" button
    var date = new Date();
    if (date.getDay() == 4) {
        var kfc = document.getElementById("kfc");
        kfc.innerText = "今天肯德基疯狂星期㊃，V我㉌，祝你考运加倍！";
    }
});

