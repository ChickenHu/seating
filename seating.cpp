#include <bits/stdc++.h>
using namespace std;
mt19937 Random(time(0));
array<string, 40> Name =
    {"何子耘",
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
     "",
     "",
     "",
     "",
     "",
     "谢美琳",
     "张承蓓",
     "张涵峤",
     "张颢严",
     "艾子瑜",
     "程子颜",
     "丁一朗",
     "何乙峰",
     "李郑夫",
     "刘泽栋",
     "卢奕",
     "陆辰昊",
     "冉钰熙",
     "谭博祯",
     "鲜雨彤",
     "余宛蕾",
     "张艺文",
     "周月"};
int main()
{
    ofstream out("seating.md");
    shuffle(Name.begin(), Name.end(), Random);
    array<string, 30> Seat;
    for (int i = 0; i < 20; i++)
    {
        Seat[i] = Name[i];
    }
    shuffle(Seat.begin(), Seat.end(), Random);
    out << "## 1104\n";
    out << "|     |     |     |     |     |\n";
    out << "| --- | --- | --- | --- | --- |\n";
    for (int i = 0; i < 6; i++)
    {
        for (int j = 0; j < 5; j++)
        {
            out << "| " + Seat[i * 5 + j] << " ";
        }
        out << "|\n";
    }
    out << "\n";
    fill(Seat.begin(), Seat.end(), "");
    for (int i = 0; i < 20; i++)
    {
        Seat[i] = Name[i + 20];
    }
    shuffle(Seat.begin(), Seat.end(), Random);
    out << "## 1105\n";
    out << "|     |     |     |     |     |\n";
    out << "| --- | --- | --- | --- | --- |\n";
    for (int i = 0; i < 6; i++)
    {
        for (int j = 0; j < 5; j++)
        {
            out << "| " + Seat[i * 5 + j] << " ";
        }
        out << "|\n";
    }
    out << "\n";
    out.close();
    return 0;
}
