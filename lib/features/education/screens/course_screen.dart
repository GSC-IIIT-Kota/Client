import 'package:flutter/material.dart';
import 'package:solution_challenge/common/widgets/appbar/appbar.dart';
import 'package:solution_challenge/common/widgets/education/course/course_lesson_card.dart';
import 'package:solution_challenge/common/widgets/education/course/course_lesson_profile.dart';
import 'package:solution_challenge/utils/constants/colors.dart';
import 'package:solution_challenge/utils/constants/image_strings.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';
import 'package:solution_challenge/utils/helpers/helper_functions.dart';
import 'package:solution_challenge/utils/translator/translated_strings.dart';
import 'package:get/get.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = PHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///Course Appbar
            PAppBar(
              showBackArrow: true,
              backArrowColor: dark ? Colors.white : Colors.black,
              title: Text(
                translatedStrings?[43] ?? 'Course Details',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .apply(color: dark ? Colors.white : Colors.black),
              ),
            ),

            /// Main Content
            Column(
              children: [
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
                  child: Image( /// Thumbnail
                    image: AssetImage(TImages.courseThumbnail),
                  ),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                Padding( /// Page Heading
                  padding: const EdgeInsets.symmetric(
                      horizontal: TSizes.defaultSpace),
                  child: Text(
                    translatedStrings?[40] ??
                        'Beginners guide to menstrual health',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .apply(color: dark ? TColors.brightpink : TColors.rani),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                PSectionExpansionPanel( /// ExpansionPanelList
                  title: translatedStrings?[93] ??
                      'Introduction to Menstrual Health',
                  textColor: dark ? Colors.white : Colors.black,
                  lessons: [
                    PLessonCard(
                      itemNumber: 1,
                      title: translatedStrings?[94] ??
                          'Introduction: What are periods?',
                      onPressed: () => Get.to(() => PLessonProfile(
                          isVideo: true,
                          videoUrl:
                              'https://youtu.be/FBfAD5z-g0Q?si=0E-wJMGlM3WiLFDA',
                          lessonTitle: translatedStrings?[94] ??
                              'Introduction: What are periods?',
                          lessonCategory: translatedStrings?[95] ??
                              'Impact of Menstrual Health on Daily Life',
                          lessonAuthor: 'Menstrupedia',
                          lessonDescription: translatedStrings?[96] ??
                              "Hey girls! So, let's talk about periods, or as we call it, menstruation! It's a monthly thing that happens to us ladies. Basically, it's when some blood and tissue come out of our uterus through the vagina. It usually kicks in around when you're 12, but hey, it's different for everyone - some may start earlier, some later. But no worries, it's all part of growing up and getting ready for possible baby-making adventures later on! 😊 During this time, you might feel all sorts of emotions and maybe some discomfort, but don't sweat it! There are ways to handle it, and it usually lasts just a few days. It's super important to know about periods so you can take care of yourself and feel comfy chatting about it with trusted adults. 🌸 \n\n Now, let's get into the nitty-gritty! So, periods happen because our bodies are super smart and filled with hormones, which are like little messengers sending signals. The ovaries release two special hormones called estrogen and progesterone. These hormones do this cool thing where they make the lining of our uterus all cozy and thick, like a nice bed for a potential baby. But if there's no baby on the way, that lining breaks down and says bye-bye, causing the bleeding. Then the whole cycle starts over again! It's like a monthly dance party for our bodies! 💃🩸")),
                      isVideo: true,
                    ),
                    PLessonCard(
                      itemNumber: 2,
                      title: translatedStrings?[97] ??
                          'When will i get my first period?',
                      onPressed: () => Get.to(() => PLessonProfile(
                          isVideo: true,
                          videoUrl:
                              'https://youtu.be/AV5UClOFANQ?si=M9xOOuAZ8n7BjTxD',
                          lessonTitle: translatedStrings?[97] ??
                              "When will i get my first period?",
                          lessonCategory:
                              translatedStrings?[98] ?? "FAQs and Common Myths",
                          lessonAuthor: "Menstrupedia",
                          lessonDescription: translatedStrings?[99] ??
                              "So, most girls usually start getting their first period when they're around 12 years old, but you know what? It's totally cool if it happens any time between 10 and 15. 🎉 Your body's just got its own schedule, doing its thing! There's no set age for it to happen, but there are some hints that it might be on the way: Like, often, about 2 years after your boobs start to grow, you might notice your period showing up. Also, there's this thing called vaginal discharge, which is kind of like mucus, that you might see or feel in your undies. Don't worry, it's all just your body getting ready for this new adventure! 🌟 So, whenever it happens, just roll with it! Your body knows what it's doing. 💪")),
                      isVideo: true,
                    ),
                    PLessonCard(
                      itemNumber: 3,
                      title: translatedStrings?[100] ??
                          'What does the first period feel like?',
                      onPressed: () => Get.to(() => PLessonProfile(
                          isVideo: true,
                          videoUrl:
                              "https://youtu.be/cfROFgkV43E?si=s31MoGxEjLclmfxw",
                          lessonTitle: translatedStrings?[100] ??
                              "What does the first period feel like?",
                          lessonCategory: translatedStrings?[101] ??
                              "Menstrual Health and Mental Well-being",
                          lessonAuthor: "Menstrupedia",
                          lessonDescription: translatedStrings?[102] ??
                              "Hey girl! So, when you get your period, it's like your body throwing a little party every month! 🎉 But hey, it's totally normal if you feel a bit funky during this time. Some girls get cramps or feel a bit tired, but don't worry, it's all part of the package. Think of it as your body doing its thing, getting ready for whatever adventures come your way! 💪 And hey, it's not all bad! You might get to rock some cute period undies or try out some fun period products! 🩲 So, embrace the flow, girl! And remember, it's all part of growing up and being awesome! 🌸💖    ")),
                      isVideo: true,
                    ),
                  ],
                ),
                PSectionExpansionPanel(
                  title: translatedStrings?[103] ??
                      'Menstrual Hygiene and Management',
                  textColor: dark ? Colors.white : Colors.black,
                  lessons: [
                    PLessonCard(
                      itemNumber: 4,
                      title: translatedStrings?[104] ??
                          "Period Hygiene 101: A Clean Queen's Manual?",
                      onPressed: () => Get.to(() => PLessonProfile(
                          isVideo: true,
                          videoUrl:
                              "https://youtu.be/qFLElwY-SYE?si=UGfis3pVvK4rjmTB",
                          lessonTitle: translatedStrings?[104] ??
                              "Period Hygiene 101: A Clean Queen's Manual",
                          lessonCategory:
                              translatedStrings?[6] ?? "Menstrual Hygiene",
                          lessonAuthor: "Menstrupedia",
                          lessonDescription: translatedStrings?[105] ??
                              "Hygiene reigns supreme during your period! Start with frequent changes of pads, tampons, or cups – the unsung heroes. 🩸 Wash your hands before and after, making you the hygiene superstar. 🧼 Opt for gentle, fragrance-free wipes or cleansers. 🌸 Keep the sacred 'underwear arsenal' stocked and change as needed. 💪 Embrace the power of showers – they're your period pal. 🚿 Finally, avoid the temptation to flush pads – let the trash be their final destination. 🚫 You're not just maintaining hygiene; you're a clean queen ruling your period domain!")),
                      isVideo: true,
                    ),
                    PLessonCard(
                      itemNumber: 5,
                      title: translatedStrings?[106] ??
                          "Pad Power: Your Period Buddy",
                      onPressed: () => Get.to(() => PLessonProfile(
                          isVideo: true,
                          videoUrl:
                              "https://youtu.be/J6bZsI1pi_o?si=6FjTfon7LYrNui9M",
                          lessonTitle: translatedStrings?[106] ??
                              "Pad Power: Your Period Buddy",
                          lessonCategory:
                              translatedStrings?[6] ?? "Menstrual Hygiene",
                          lessonAuthor: "Menstrupedia",
                          lessonDescription: translatedStrings?[107] ??
                              "Pads are like magic shields for your period. 🛡️ Peel one from its wrapper, put it in your undies (sticky side down), and you're set. Swap it every 4-6 hours or sooner if it's full. ⏰ When it's time to part ways, wrap it in toilet paper, toss it in the trash (not the toilet), and ta-da – you're a period pro! 🗑️ And remember, pads come in different sizes, so pick the one that feels just right for you. Easy, comfy, and you're in charge! 💪🩸")),
                      isVideo: true,
                    ),
                    PLessonCard(
                      itemNumber: 6,
                      title: translatedStrings?[108] ??
                          "Stain S.O.S.: Dress Edition",
                      onPressed: () => Get.to(() => PLessonProfile(
                          isVideo: true,
                          videoUrl:
                              "https://youtu.be/i8gYx3ox7K8?si=ZILVWyStlbanopKq",
                          lessonTitle: translatedStrings?[108] ??
                              "Stain S.O.S.: Dress Edition",
                          lessonCategory:
                              translatedStrings?[6] ?? "Menstrual Hygiene",
                          lessonAuthor: "Menstrupedia",
                          lessonDescription: translatedStrings?[109] ??
                              "Oops, a period stain? No biggie! Act fast: grab some cold water and gently blot the stain. 💦 If you're a detective with a backpack, a sweater around your waist works wonders. 🧥 Head to the bathroom, use soap and cold water to tackle the stain ninja-style. 🚽 In a pinch? Embrace strategic layering or borrow a friend's emergency hoodie. 👚 Remember, stains happen – you're a stain superhero in the making! 💪🩸")),
                      isVideo: true,
                    ),
                    PLessonCard(
                      itemNumber: 7,
                      title: translatedStrings?[110] ??
                          "Period Products 101: Your Handy Guide",
                      onPressed: () => Get.to(() => PLessonProfile(
                          isArticle: true,
                          lessonThumbnail:
                              "https://d1ymz67w5raq8g.cloudfront.net/Pictures/480xany/3/8/9/511389_gettyimages808994144_462043.jpg",
                          lessonTitle: translatedStrings?[110] ??
                              "Period Products 101: Your Handy Guide",
                          lessonCategory:
                              translatedStrings?[6] ?? "Menstrual Hygiene",
                          lessonAuthor: "Period Team",
                          lessonDescription: translatedStrings?[111] ??
                              "Periods come with a variety of products to suit your comfort. \n\n1. Pads: First up, we've got pads. These babies are made of comfy cotton and come in all shapes and sizes. They've got sticky strips to keep them in place on your undies. Super easy and reliable! 👍 Stick them in your undies for a comfy layer. Change as needed.\n\n2. Tampons: These little wonders go inside, soaking up the flow. Choose the size that fits your flow level. 🌊 These can be a game-changer, especially for active girls into sports or swimming. Tampons are like little cotton plugs that you insert into your vagina. They come with handy applicators to help you out. Remember, though, never leave a tampon in for more than 8 hours to avoid a rare but serious infection called toxic shock syndrome. ⏰\n\n3. Menstrual Cups: Like a reusable superhero, they collect the flow. Fold, insert, and you're good for hours. ♻️ These are made of silicone and are reusable, which is pretty cool! You just pop it in, and it collects the blood until you're ready to empty it out. Plus, it's eco-friendly! 🌱\n\n4. Period Panties:Underwear with built-in magic. They handle light to moderate flows without any extra help. 👙\n\n5. Period Discs: A bit like a frisbee for your flow. Collect it internally, and you can forget about it for a while. 🥏\n\nRemember, it's all about what feels right for you. Pick your period partner, and you're ready for the monthly adventure! 🌈🩸✨\n\nSo, there you have it! Experiment a bit and find what feels right for you. Your period, your rules! 💁‍♀️🩸")),
                      isVideo: false,
                    ),
                  ],
                ),
                PSectionExpansionPanel(
                  title: translatedStrings?[112] ?? 'Understanding Physiology',
                  textColor: dark ? Colors.white : Colors.black,
                  lessons: [
                    PLessonCard(
                      itemNumber: 8,
                      title: translatedStrings?[113] ??
                          "Periods Unveiled: The Ultimate Guide for Girls",
                      onPressed: () => Get.to(() => PLessonProfile(
                          isVideo: true,
                          videoUrl:
                              "https://youtu.be/qUNTtn1WPEw?si=YizrRP7MBrNj3dJq",
                          lessonTitle: translatedStrings?[113] ??
                              "Periods Unveiled: The Ultimate Guide for Girls",
                          lessonCategory: translatedStrings?[95] ??
                              "Impact of Menstrual Health on Daily Life",
                          lessonAuthor: "Menstrupedia>",
                          lessonDescription: translatedStrings?[115] ??
                              "Welcome to the world of periods – a monthly adventure! 🎉 First up, meet your trusty companions: pads, tampons, or menstrual cups. 🩸 Track your cycle with apps or old-school calendars; knowledge is power. 📅 Embrace comfy clothes, a hot water bottle, and maybe some chocolate during the monthly fiesta. 🍫 Don't fear stains – tackle them with cold water and a superhero mindset. 💦 Chat with trusted pals or adults if you need backup. 🗣️ Remember, periods are your body's way of saying, 'Hey, I'm amazing!' 💁 You're in control, period pro! 💪🌟")),
                      isVideo: true,
                    ),
                    PLessonCard(
                      itemNumber: 9,
                      title: translatedStrings?[116] ??
                          "Decoding PMS: The Monthly Guest",
                      onPressed: () => Get.to(() => PLessonProfile(
                          isArticle: true,
                          lessonThumbnail:
                              "https://www.alpropharmacy.com/wp-content/uploads/2021/05/Femine-01-11-scaled.jpg",
                          lessonTitle: translatedStrings?[116] ??
                              "Decoding PMS: The Monthly Guest",
                          lessonCategory: translatedStrings?[117] ??
                              "FAQs and Common Myths",
                          lessonAuthor: "Period Team",
                          lessonDescription: translatedStrings?[118] ??
                              "PMS stands for Premenstrual Syndrome – a tag-along companion that visits before your period. 🚶‍♀️ It brings a mix of physical and emotional sidekicks, like mood swings, cramps, and bloating. 😩 Think of it as your body's way of giving you a heads-up that the period party is on its way. 🎉 Chocolate cravings, tender feelings, and occasional superhero mood swings may join the parade. 🍫 Don't worry; it's all part of the monthly script. 📜 Treat yourself kindly, maybe with a chocolate bar, and ride the PMS wave like the period pro you are! 🌊🍫🌟")),
                      isVideo: false,
                    ),
                    PLessonCard(
                      itemNumber: 10,
                      title: translatedStrings?[119] ??
                          "Can a Girl Get Pregnant as Soon as Her Period Starts?",
                      onPressed: () => Get.to(() => PLessonProfile(
                          isArticle: true,
                          lessonThumbnail:
                              "https://images.agoramedia.com/wte3.0/gcms/nesting-during-pregnancy-722x406.jpg",
                          lessonTitle: translatedStrings?[119] ??
                              "Can a Girl Get Pregnant as Soon as Her Period Starts?",
                          lessonCategory: translatedStrings?[117] ??
                              "FAQs and Common Myths",
                          lessonAuthor: "Period Team",
                          lessonDescription: translatedStrings?[120] ??
                              "Yes, a girl can get pregnant as soon as her period starts. 🤰 A girl can even get pregnant right before her very first period. 🔄 This is because a girl's hormones might already be active. 💫 The hormones may have led to ovulation and the building of the uterine wall. 🏗️ If a girl has sex, she can get pregnant, even though she has never had a period. 🚼")),
                      isVideo: false,
                    ),
                  ],
                ),
                PSectionExpansionPanel(
                  title: translatedStrings?[121] ??
                      'Managing Period Pain and Support',
                  textColor: dark ? Colors.white : Colors.black,
                  lessons: [
                    PLessonCard(
                      itemNumber: 11,
                      title: translatedStrings?[122] ??
                          "Cramp 101: Taming Period Pain",
                      onPressed: () => Get.to(() => PLessonProfile(
                          isVideo: true,
                          videoUrl:
                              "https://youtu.be/5u6Y6ZP2_Wg?si=ZezvFWoZ-iGr4-_O",
                          lessonTitle: translatedStrings?[122] ??
                              "Cramp 101: Taming Period Pain",
                          lessonCategory: translatedStrings?[101] ??
                              "Menstrual Health and Mental Well-being",
                          lessonAuthor: "Menstrupedia",
                          lessonDescription: translatedStrings?[123] ??
                              "Period cramps are like tiny workouts for your tummy – not the best guests, right? 💔 Fight back with a warm pad on your belly or some pain relievers if needed. 🔥 Drink water to stay hydrated – it's like your secret weapon. 💧 Try easy exercises like stretching or yoga; they're like superhero moves against cramps. 🧘‍♀️ Find a comfy spot, watch your favorite shows, and relax. 📺 Remember, you're the boss of those cramps; they won't stick around forever. 💪🩸")),
                      isVideo: true,
                    ),
                    PLessonCard(
                      itemNumber: 12,
                      title: translatedStrings?[124] ??
                          "Period Sidekick 101: A Pocket Guide",
                      onPressed: () => Get.to(() => PLessonProfile(
                          isVideo: true,
                          videoUrl:
                              "https://youtu.be/gojy9QRRO68?si=0b8ndU1tiGkCzyfv",
                          lessonTitle: translatedStrings?[124] ??
                              "Period Sidekick 101: A Pocket Guide",
                          lessonCategory: translatedStrings?[101] ??
                              "Menstrual Health and Mental Well-being",
                          lessonAuthor: "Menstrupedia",
                          lessonDescription: translatedStrings?[125] ??
                              "Supporting friends during their periods is a breeze! 💨 Step one: stock up on chocolate, the ultimate comfort treat. 🍫 Offer cozy comforts like a heating pad and ace the art of blanket nests. 🛌 Be the distraction guru with jokes or cute videos. 🤣 You're not just a friend; you're the superhero in their period saga! 💪🩸")),
                      isVideo: true,
                    ),
                    PLessonCard(
                      itemNumber: 13,
                      title: translatedStrings?[126] ??
                          "Periods at School: A Quick Survival Guide",
                      onPressed: () => Get.to(() => PLessonProfile(
                          isVideo: true,
                          videoUrl:
                              "https://youtu.be/GUVL7jtxTDg?si=ciNR4cGtZ2yJwI0Q",
                          lessonTitle: translatedStrings?[126] ??
                              "Periods at School: A Quick Survival Guide",
                          lessonCategory: translatedStrings?[95] ??
                              "Impact of Menstrual Health on Daily Life",
                          lessonAuthor: "Menstrupedia",
                          lessonDescription: translatedStrings?[114] ??
                              "Fear not, period warrior! If Aunt Flow decides to visit during school hours, sneak a stash of pads or tampons in your bag. 🎒 Team up with a trusty friend – a period buddy, if you will – who might have your back with supplies. 🤝 If the unexpected happens, don't panic; most schools have discreetly stocked bathrooms or a helpful nurse. 🚽 Always have a secret weapon, like a cozy sweater tied around your waist, just in case. 🧥 And remember, you're not alone – we've all been there, and it's just another day in the life of a period pro! 💪🩸")),
                      isVideo: true,
                    ),
                    PLessonCard(
                      itemNumber: 14,
                      title: translatedStrings?[127] ??
                          "First Period Party: Your Quick Guide",
                      onPressed: () => Get.to(() => PLessonProfile(
                          isVideo: true,
                          videoUrl:
                              "https://youtu.be/ImzxzlPzbRk?si=UVN8PwgQ6QZTSbQJ",
                          lessonTitle: translatedStrings?[127] ??
                              "First Period Party: Your Quick Guide",
                          lessonCategory: translatedStrings?[95] ??
                              "Impact of Menstrual Health on Daily Life",
                          lessonAuthor: "Menstrupedia",
                          lessonDescription: translatedStrings?[128] ??
                              "Congrats on joining the period club! 🎉 Step one: Don't panic; it's a natural superhero skill. 💪 Check for supplies – pads or tampons – and if you're unsure, a trusted friend or an understanding adult can be your sidekick. 🦸 Embrace comfy vibes with loose clothes and maybe a hot water bottle. 🌡️ Celebrate this rite of passage – you're officially a period pro! 💫🩸")),
                      isVideo: true,
                    ),
                    PLessonCard(
                      itemNumber: 15,
                      title: translatedStrings?[129] ??
                          "Menopause Mystery Unveiled",
                      onPressed: () => Get.to(() => PLessonProfile(
                          isArticle: true,
                          lessonThumbnail:
                              "https://d1zxene68j3keg.cloudfront.net/sites/default/files/styles/max_325x325/public/Menopause.png?itok=qmiShK_1",
                          lessonTitle: translatedStrings?[129] ??
                              "Menopause Mystery Unveiled",
                          lessonCategory: translatedStrings?[117] ??
                              "FAQs and Common Myths",
                          lessonAuthor: "Menstrupedia",
                          lessonDescription: translatedStrings?[130] ??
                              "Menopause is like the grand finale in the womanhood journey. 🎉 It's when the ovaries decide to take a break from their egg-producing gig. 🥚 Typically hitting in the late 40s or early 50s, menopause brings a pause to the menstrual party. 🎉 Say farewell to periods, but hello to new adventures! 👋 Alongside this change, hormonal shifts might bring hot flashes, mood swings, and other cameo appearances. 🔥 Don't fret; it's a natural part of the life plot. 📖 Embrace it with grace, maybe a fan for hot flashes, and know that you're entering a new chapter – the wise and wonderful world of post-menopause. 🚪🚶‍♀️🌅")),
                      isVideo: false,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PSectionExpansionPanel extends StatefulWidget {
  final String title;
  final Color textColor;
  final List<Widget> lessons;

  const PSectionExpansionPanel({
    super.key,
    required this.title,
    required this.textColor,
    required this.lessons,
  });

  @override
  _PSectionExpansionPanelState createState() => _PSectionExpansionPanelState();
}

class _PSectionExpansionPanelState extends State<PSectionExpansionPanel> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {

    final dark = PHelperFunctions.isDarkMode(context);

    return ExpansionPanelList(
      expansionCallback: (panelIndex, isExpanded) {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      children: [
        ExpansionPanel(
          backgroundColor: dark ? TColors.myblack : TColors.satin,
          headerBuilder: (context, isExpanded) {
            return ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
              title: Text(
                widget.title,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .apply(color: widget.textColor),
              ),
              onTap: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
            );
          },
          body: Column(
            children: widget.lessons,
          ),
          isExpanded: _isExpanded,
        ),
      ],
    );
  }
}
