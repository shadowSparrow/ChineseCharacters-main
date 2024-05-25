//
//  Helpers.swift
//  ChineseCharacters
//
//  Created by mac on 16.10.2023.
//

import Foundation
import UIKit

enum Characters: String, CaseIterable {
    case 你, 好 ,爱, 八, 杯, 子, 北, 京, 本,
         不, 客, 气, 菜, 茶, 吃, 出, 租, 车,
         打, 话, 大, 的, 点, 电, 脑, 视, 影,
         东, 西, 都, 读, 对, 起, 多, 少, 儿,
         饭, 馆, 飞, 机, 二, 分, 钟, 高, 兴,
         工, 作, 汉, 语, 个, 狗, 喝, 和, 很,
         后, 面, 回, 会, 火, 站, 几, 家, 叫,
         今, 天, 九, 开, 看, 块, 来, 老, 师,
         了, 冷, 里, 零, 六, 妈, 吗, 买, 猫,
         没, 关, 系, 米, 名, 字, 明,哪, 那,
         呢, 能, 无, 年, 女, 朋, 友, 漂, 亮,
         苹, 果, 七, 钱, 前, 请, 去, 热, 人,
         认, 识, 日, 三, 商, 店, 上, 衣, 谁,
         什, 么, 十, 是, 书, 水, 睡, 觉, 说,
         四, 岁, 他, 她, 太, 听, 同, 学, 我,
         们, 喂, 五, 喜, 欢, 下, 午, 雨, 先,
         生, 现, 在, 想, 办, 法, 小,  姐, 些,
         写, 谢, 星, 期, 习, 校, 服, 医, 院,
         椅, 一, 次, 有, 月, 再, 见, 怎, 样,
         这, 中, 国, 住, 桌, 昨,  坐, 做
}




enum Topics: String {
    case Family, Travel, Education, Objects, Food, Persons, Count, Numbers,Time, Locations, Adjectives, Phrazes, Actions, Particles
}


class DataManager {
    
    static let shared = DataManager()
    var imageNames = ["Education","brain", "gamecontroller"]
    var labelNames = ["Cards","Exercises","Games"]
    
    
    var topicNames: [Topics] = [.Family,.Travel,.Education,.Objects, .Food, .Persons,.Count,.Numbers,.Time,.Locations,.Adjectives,.Phrazes,.Actions,.Particles]
    
    var familyCharacters: [Word] = [
        Word(name: "爸爸", pingYing: "bàba", translation: "father" ),
        Word(name: "家",  pingYing: "jiā", translation: "family"),
        Word(name: "儿子",  pingYing: "érzi", translation: "son"),
        Word(name: "朋友", pingYing: "péngyou", translation: "friend"),
        Word(name: "人",  pingYing: "rén", translation: "human" ),
        Word(name: "岁数",  pingYing: "suì(shu)", translation: "age"),
        Word(name: "先生",  pingYing: "xiānsheng", translation: "Mr"),
        Word(name: "小姐",  pingYing: "xiǎojiě", translation: "Miss")
    ]
    
    private init(){}
}
    
 /*
    var travelCharacters = [
        CharacterData(character: "北京", imageName: "family", pingYing: "Běijīng", translation: "Пекин" ),
        CharacterData(character: "出租车", imageName: "hospital", pingYing: "такси", translation: "такси"),
        CharacterData(character: "飞机", imageName: "shop", pingYing: "fēijī", translation: "самолет"),
        CharacterData(character: "块", imageName: "love", pingYing: "kuài", translation: "юань"),
        CharacterData(character: "天气", imageName: "family", pingYing: "tiānqì", translation: "погода" ),
        CharacterData(character: "下雨", imageName: "hospital", pingYing: "xià yǔ", translation: "идет дождь"),
        CharacterData(character: "上午", imageName: "shop", pingYing: "shàngwǔ", translation: "первая половина дня"),
        CharacterData(character: "下午", imageName: "love", pingYing: "xià wǔ", translation: "вторая половина дня"),
        CharacterData(character: "中午", imageName: "shop", pingYing: "zhōngwǔ", translation: "полдень"),
        CharacterData(character: "中国", imageName: "love", pingYing: "Zhōngguó", translation: "Китай")
    ]
    var educationCharacters = [
        CharacterData(character: "学习", imageName: "family", pingYing: "xuéxí", translation: "учиться" ),
        CharacterData(character: "读", imageName: "hospital", pingYing: "dú", translation: "читать"),
        CharacterData(character: "说", imageName: "shop", pingYing: "shuō", translation: "говорить"),
        CharacterData(character: "写", imageName: "love", pingYing: "xiě", translation: "писать"),
        CharacterData(character: "同学", imageName: "family", pingYing: "tóngxué", translation: "однокурсник" ),
        CharacterData(character: "学生", imageName: "hospital", pingYing: "xuésheng", translation: "студент"),
        CharacterData(character: "老师", imageName: "shop", pingYing: "lǎoshī", translation: "учитель"),
        CharacterData(character: "字", imageName: "love", pingYing: "zì", translation: "иероглиф"),
        CharacterData(character: "汉语", imageName: "shop", pingYing: "Hànyǔ", translation: "китайский язык"),
        CharacterData(character: "学校", imageName: "love", pingYing: "xuéxiào", translation: "школа")
    ]
    var objectCharacters = [
        CharacterData(character: "电脑", imageName: "family", pingYing: "diànnǎo", translation: "компьютер" ),
        CharacterData(character: "电视", imageName: "hospital", pingYing: "diànshì", translation: "телевизор"),
        CharacterData(character: "电影", imageName: "shop", pingYing: "diànyǐng", translation: "кинофильм"),
        CharacterData(character: "东西", imageName: "love", pingYing: "dōngxi", translation: "вещи, предметы"),
        CharacterData(character: "名字", imageName: "family", pingYing: "míngzi", translation: "наименование, имя" ),
        CharacterData(character: "商店", imageName: "hospital", pingYing: "shāngdiàn", translation: "магазин"),
        CharacterData(character: "书", imageName: "shop", pingYing: "shū", translation: "книга"),
        CharacterData(character: "衣服", imageName: "love", pingYing: "yīfu", translation: "одежда"),
        CharacterData(character: "椅子", imageName: "shop", pingYing: "yǐzi", translation: "стул"),
        CharacterData(character: "桌子", imageName: "love", pingYing: "zhuōzi", translation: "стол"),
    ]
    var foodCharacters = [
        CharacterData(character: "吃", imageName: "family", pingYing: "chī", translation: "кушать" ),
        CharacterData(character: "喝", imageName: "hospital", pingYing: "hē", translation: "пить"),
        CharacterData(character: "米饭", imageName: "shop", pingYing: "mǐfàn", translation: "рис"),
        CharacterData(character: " 水", imageName: "love", pingYing: "shuǐ", translation: "вода"),
        CharacterData(character: "菜", imageName: "family", pingYing: "cài", translation: "овощи (готовое блюдо)" ),
        CharacterData(character: "水果", imageName: "hospital", pingYing: "shuǐguǒ", translation: "фрукты"),
        CharacterData(character: "茶", imageName: "shop", pingYing: "chá", translation: "чай"),
        CharacterData(character: "苹果", imageName: "love", pingYing: "píngguǒ", translation: "яблоко"),
        CharacterData(character: "饭店", imageName: "shop", pingYing: "fàndiàn", translation: "ресторан (гостиница)"),
        CharacterData(character: "杯子", imageName: "love", pingYing: "bēizi", translation: "стакан (чашка)")
    ]
    var nounsCharacters = [
        CharacterData(character: "我", imageName: "family", pingYing: "wǒ", translation: "я" ),
        CharacterData(character: "我们", imageName: "hospital", pingYing: "wǒmen", translation: "мы"),
        CharacterData(character: "他", imageName: "shop", pingYing: "tā", translation: "он"),
        CharacterData(character: "她", imageName: "love", pingYing: "tā", translation: "она"),
        CharacterData(character: "你", imageName: "family", pingYing: "nǐ", translation: "ты (вы)" ),
        CharacterData(character: "和", imageName: "hospital", pingYing: "hé", translation: "и, вместе с"),
        CharacterData(character: "谁", imageName: "shop", pingYing: "shéi", translation: "кто"),
        CharacterData(character: "什么", imageName: "love", pingYing: "shénme", translation: "что"),
        CharacterData(character: "那", imageName: "shop", pingYing: "nà", translation: "то (тот, та, те)"),
        CharacterData(character: "这", imageName: "love", pingYing: "zhè", translation: "это (этот, эта, эти)"),
    ]
    var countCharacters = [
        CharacterData(character: "一", imageName: "family", pingYing: "yī", translation: "один" ),
        CharacterData(character: "号", imageName: "hospital", pingYing: "hào", translation: "число (месяца)"),
        CharacterData(character: "个", imageName: "shop", pingYing: "gè", translation: "счетное слово общего назначения"),
        CharacterData(character: "少", imageName: "love", pingYing: "shǎo", translation: "мало"),
        CharacterData(character: "一点儿", imageName: "family", pingYing: "yìdiǎnr", translation: "чуть-чуть" ),
        CharacterData(character: "些", imageName: "hospital", pingYing: "xiē", translation: "несколько, неопределенное количество"),
        CharacterData(character: "几", imageName: "shop", pingYing: "jǐ", translation: "сколько, немного (если меньше 10)"),
        CharacterData(character: "多少", imageName: "love", pingYing: "duōshao", translation: "сколько, немало (если больше 10)"),
        CharacterData(character: "多", imageName: "shop", pingYing: "duō", translation: "много (тж. употребляется в вопросах о количестве или степени)"),
        CharacterData(character: "都", imageName: "love", pingYing: "dōu", translation: "все"),
    ]
    var numberCharacters = [
        CharacterData(character: "十", imageName: "family", pingYing: "shí", translation: "десять" ),
        CharacterData(character: "零", imageName: "hospital", pingYing: "líng", translation: "ноль"),
        CharacterData(character: "二", imageName: "shop", pingYing: "èr", translation: "два"),
        CharacterData(character: "三", imageName: "love", pingYing: "sān", translation: "три"),
        CharacterData(character: "四", imageName: "family", pingYing: "sì", translation: "четыре" ),
        CharacterData(character: "五", imageName: "hospital", pingYing: "wǔ", translation: "пять"),
        CharacterData(character: "六", imageName: "shop", pingYing: "liù", translation: "шесть"),
        CharacterData(character: "七 ", imageName: "love", pingYing: "qī", translation: "семь"),
        CharacterData(character: "八", imageName: "shop", pingYing: "bā", translation: "восемь"),
        CharacterData(character: "九", imageName: "love", pingYing: "jiǔ", translation: "девять"),
    ]
    var timeCharacters = [
        CharacterData(character: "时候", imageName: "family", pingYing: "shíhou", translation: "период (время)" ),
        CharacterData(character: "昨天", imageName: "hospital", pingYing: "zuótiān", translation: "вчера"),
        CharacterData(character: "今天", imageName: "shop", pingYing: "jīntiān", translation: "сегодня"),
        CharacterData(character: "明天", imageName: "love", pingYing: "míngtiān", translation: "завтра"),
        CharacterData(character: "现在", imageName: "family", pingYing: "xiànzài", translation: "сейчас (в настоящее время)" ),
        CharacterData(character: "年", imageName: "hospital", pingYing: "nián", translation: "год"),
        CharacterData(character: "月", imageName: "shop", pingYing: "yuè" , translation: "месяц"),
        CharacterData(character: "星期", imageName:"", pingYing: "xīngqī" , translation: "неделя"),
        CharacterData(character: "点", imageName:"", pingYing: "diǎn" , translation: "(который)час"),
        CharacterData(character: "分钟", imageName:"", pingYing: "fēnzhōng" , translation: "минута"),
    ]
    var placeCharacters = [
        CharacterData(character: "哪儿", imageName: "family", pingYing: "nǎr", translation: "где"),
        CharacterData(character: "那儿", imageName: "hospital", pingYing: "nàr", translation: "там"),
        CharacterData(character: "这儿", imageName: "shop", pingYing: "zhèr", translation: "тут"),
        CharacterData(character: "里", imageName: "love", pingYing: "lǐ", translation: "внутри"),
        CharacterData(character: "前面", imageName: "family", pingYing: "qiánmiàn", translation: "впереди (перед)"),
        CharacterData(character: "上", imageName: "hospital", pingYing: "shàng", translation: "выше (над, на верху)"),
        CharacterData(character: "下", imageName: "shop", pingYing: "xià" , translation: "иже, под, следующий; идет (дождь, снег)"),
        CharacterData(character: "后面", imageName:"", pingYing: "hòumiàn" , translation: "позади (сзади, за чем-либо)"),
        CharacterData(character: "有", imageName:"", pingYing: "yǒu" , translation: "иметь (существовать)"),
        CharacterData(character: "没有", imageName:"", pingYing: "méiyǒu" , translation: "не иметь (нет, не имеется)")
    ]
    var adjectivesCharacters = [
        CharacterData(character: "大", imageName: "family", pingYing: "dà", translation: "большой"),
        CharacterData(character: "小", imageName: "hospital", pingYing: "xiǎo", translation: "маленький"),
        CharacterData(character: "好", imageName: "shop", pingYing: "hǎo", translation: "хороший"),
        CharacterData(character: "漂亮", imageName: "love", pingYing: "piàoliɑng", translation: "красивый"),
        CharacterData(character: "高兴", imageName: "family", pingYing: "gāoxìng", translation: "веселый, (радостный, счастливый)" ),
        CharacterData(character: "热", imageName: "hospital", pingYing: "rè", translation: "горячий"),
        CharacterData(character: "冷", imageName: "shop", pingYing: "lěng", translation: "холодный"),
        CharacterData(character: "太", imageName:"", pingYing: "tài" , translation: "чрезвычайно"),
        CharacterData(character: "很", imageName: "shop", pingYing: "hěn" , translation: "очень"),
        CharacterData(character: "哪", imageName:"", pingYing: "nǎ" , translation: "какой (который)")
    ]
    var phrazesCharacters = [
        CharacterData(character: "喂", imageName: "family", pingYing: "wèi", translation: "алло, привет"),
        CharacterData(character: "是", imageName: "hospital", pingYing: "shì", translation: "да (тж. - глагол быть)"),
        CharacterData(character: "不", imageName: "shop", pingYing: "bù", translation: "нет (не)"),
        CharacterData(character: "怎么", imageName: "love", pingYing: "zěnme", translation: "каким образом (как, в каком состоянии, почему)"),
        CharacterData(character: "谢谢", imageName: "family", pingYing: "xièxie", translation: "спасибо (благодарить)" ),
        CharacterData(character: "不客气", imageName: "hospital", pingYing: "bú kèqi", translation: "не стоит"),
        CharacterData(character: "对不起", imageName: "shop", pingYing: "duìbuqǐ", translation: "извините"),
        CharacterData(character: "没关系", imageName:"", pingYing: "méi guānxi" , translation: "ничего не случилось (не бойтесь)"),
        CharacterData(character: "再见", imageName: "shop", pingYing: "zàijiàn" , translation: "до свидания")
    ]
    var verbsCharacters = [
        CharacterData(character: "说话", imageName: "family", pingYing: "shuōhuà", translation: "разговаривать (говорить)"),
        CharacterData(character: "打电话", imageName: "hospital", pingYing: "dǎdiànhuà", translation: "звонить (говорить) по телефону"),
        CharacterData(character: "叫", imageName: "shop", pingYing: "jiào", translation: "звать (именем)"),
        CharacterData(character: "认识", imageName: "love", pingYing: "rènshi", translation: "быть знакомыми (знакомиться)"),
        CharacterData(character: "请", imageName: "family", pingYing: "qǐng", translation: "просить" ),
        CharacterData(character: "想", imageName: "hospital", pingYing: "xiǎng", translation: "собираться что-то сделать (думать)"),
        CharacterData(character: "听", imageName: "shop", pingYing: "tīng", translation: "слышать, слушать"),
        CharacterData(character: "看", imageName:"", pingYing: "kàn" , translation: "смотреть, читать (глядеть)"),
        CharacterData(character: "看见", imageName: "shop", pingYing: "kànjiàn" , translation: "увидеть"),
        CharacterData(character: "喜欢", imageName:"", pingYing: "xǐhuan" , translation: "нравится"),
        CharacterData(character: "能", imageName: "family", pingYing: "néng", translation: "можно"),
        CharacterData(character: "去", imageName: "hospital", pingYing: "qù", translation: "уйти, , уехать (поехать, пойти куда-либо)"),
        CharacterData(character: "叫", imageName: "shop", pingYing: "jiào", translation: "звать (именем)"),
        CharacterData(character: "来", imageName: "love", pingYing: "lái", translation: "прийти, приехать"),
        CharacterData(character: "会", imageName: "family", pingYing: "huì", translation: "уметь" ),
        CharacterData(character: "爱", imageName: "hospital", pingYing: "ài", translation: "любить (любить делать что-либо)"),
        CharacterData(character: "回", imageName: "shop", pingYing: "huí", translation: "вернуться"),
        CharacterData(character: "开", imageName:"", pingYing: "kāi" , translation: "водить машину"),
        CharacterData(character: "买", imageName: "shop", pingYing: "mǎi" , translation: "покупать"),
        CharacterData(character: "在", imageName:"", pingYing: "zài" , translation: "находиться (тж. обозначает, что действие находится в процессе)"),
        CharacterData(character: "住", imageName:"", pingYing: "zhù" , translation: "жить где-либо")
    ]
        var particlesCharacters = [
            CharacterData(character: "做", imageName: "family", pingYing: "zuò", translation: "заниматься, делать (изготавливать)"),
            CharacterData(character: "坐", imageName: "hospital", pingYing: "zuò", translation: "сидеть, ехать (на транспортном средстве)"),
            CharacterData(character: "睡觉", imageName: "shop", pingYing: "shuìjiào", translation: "спать, ложиться спать"),
            CharacterData(character: "工作", imageName: "love", pingYing: "gōngzuò", translation: "работать (работа)"),
            CharacterData(character: "钱", imageName: "family", pingYing: "qián", translation: "деньги" ),
            CharacterData(character: "本", imageName: "hospital", pingYing: "běn", translation: "том(счетное слово для книг)"),
            CharacterData(character: "医生", imageName: "shop", pingYing: "yīshēng", translation: "врач"),
            CharacterData(character: "医院", imageName:"", pingYing: "yīyuàn" , translation: "больница"),
            CharacterData(character: "吗", imageName: "shop", pingYing: "ma" , translation: "вопросительная частица в конце предложения"),
            CharacterData(character: "的", imageName: "shop", pingYing: "de", translation: "притяжательная частица (присоединяет определение;также употребляется для усиления)"),
            CharacterData(character: "了", imageName:"", pingYing: "le" , translation: "употребляется в конце предложения для обозначения происшедших изменений"),
            CharacterData(character: "呢", imageName: "shop", pingYing: "ne" , translation: "вопросительная частица, ставится в конце предложения")
        ]
    
}

*/

//Add Color Helpers///
