import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_nafsi/models/test_model.dart';
import 'package:gp_nafsi/screens/tests/cubit/tests_state.dart';

class TestsCubit extends Cubit<TestsState> {
  TestsCubit() : super(TestsInitialState());

  static TestsCubit get(context) => BlocProvider.of(context);

  List<TestModel> tests = [
    TestModel(
      imagePath: "assets/images/tests/gad.png",
      title: "Generalized Anxiety Disorder 7 (GAD-7)",
        description:"The GAD-7 assesses generalized anxiety disorder symptoms, focusing on feelings of nervousness, worry, and tension over the past two weeks.",
      questions: [
        "How often have you felt nervous, anxious, or on edge?",
        "How often have you been unable to stop or control worrying?",
        "How often have you worried too much about different things?",
        "How often have you had trouble relaxing?",
        "How often have you been so restless that it’s hard to sit still?",
        "How often have you become easily annoyed or irritable?",
        "How often have you felt afraid as if something awful might happen?",
      ],
      answers: [
        "Not at all",
        "Several days",
        "More than half the days",
        "Nearly every day",
      ],
      scores: [
        TestScoreModel(
          name: "0-4: Minimal anxiety",
          analysis:
              "Symptoms of anxiety are minimal and not likely to interfere with daily life.",
          suggestions: [
            "Maintain a healthy lifestyle with regular physical activity and balanced diet.",
            "Practice relaxation techniques such as deep breathing or mindfulness.",
            "Engage in activities that bring joy and satisfaction.",
            "Regularly check in with yourself to monitor any changes in symptoms.",
          ],
        ),
        TestScoreModel(
          name: "5-9: Mild anxiety",
          analysis:
              "Mild symptoms of anxiety that may cause occasional discomfort but do not significantly impair daily functioning.",
          suggestions: [
            "Incorporate stress management techniques such as yoga or meditation.",
            "Maintain social connections and talk about your feelings with friends or family.",
            "Consider using apps or resources for guided relaxation exercises.",
            "Monitor symptoms and seek professional advice if they worsen.",
          ],
        ),
        TestScoreModel(
          name: "10-14: Moderate anxiety",
          analysis:
              "Moderate anxiety symptoms that can interfere with daily activities and reduce quality of life.",
          suggestions: [
            "Seek support from a mental health professional for counseling or therapy.",
            "Learn and apply cognitive-behavioral strategies to manage anxiety.",
            "Practice regular physical exercise and maintain a consistent sleep schedule.",
            "Consider joining support groups or anxiety management workshops.",
          ],
        ),
        TestScoreModel(
          name: "15-21: Severe anxiety",
          analysis:
              "Severe anxiety symptoms that likely impact daily functioning and well-being.",
          suggestions: [
            "Immediate professional help is recommended, such as therapy or counseling.",
            "Medication may be considered under the guidance of a healthcare provider.",
            "Implement structured relaxation techniques and coping strategies.",
            "Ensure a strong support system of friends, family, or support groups.",
          ],
        ),
      ],
    ),
    TestModel(
      imagePath: "assets/images/tests/phq.jpeg",
      title: "Patient Health Questionnaire 9 (PHQ-9)",
      description:"The PHQ-9 measures depression severity based on nine criteria over the past two weeks, including mood, sleep, and energy levels.",

      questions: [
        "Over the last two weeks, how often have you been bothered by feeling down, depressed, or hopeless?",
        "Over the last two weeks, how often have you been bothered by little interest or pleasure in doing things?",
        "Over the last two weeks, how often have you been bothered by trouble falling asleep, staying asleep, or sleeping too much?",
        "Over the last two weeks, how often have you been bothered by feeling tired or having little energy?",
        "Over the last two weeks, how often have you been bothered by poor appetite or overeating?",
        "Over the last two weeks, how often have you been bothered by feeling bad about yourself or that you are a failure or have let yourself or your family down?",
        "Over the last two weeks, how often have you been bothered by trouble concentrating on things such as reading the newspaper or watching television?",
        "Over the last two weeks, how often have you been bothered by moving or speaking so slowly that other people could have noticed? Or the opposite - being so fidgety or restless that you have been moving around a lot more than usual?",
        "Over the last two weeks, how often have you been bothered by thoughts that you would be better off dead or of hurting yourself in some way?",
      ],
      answers: [
        "Not at all",
        "Several days",
        "More than half the days",
        "Nearly every day",
      ],
      scores: [
        TestScoreModel(
          name: "0-4: Minimal depression",
          analysis:
              "Minimal or no symptoms of depression, likely no significant impact on daily life.",
          suggestions: [
            "Maintain a healthy lifestyle with regular exercise and balanced nutrition.",
            "Engage in activities that bring joy and fulfillment.",
            "Monitor mood and seek professional advice if symptoms worsen.",
          ],
        ),
        TestScoreModel(
          name: "5-9: Mild depression",
          analysis:
              "Mild symptoms of depression that may cause some discomfort but generally manageable.",
          suggestions: [
            "Practice self-care and stress reduction techniques.",
            "Stay connected with supportive friends and family.",
            "Consider speaking to a counselor or therapist if symptoms persist or worsen.",
            "Engage in regular physical activity and maintain a healthy sleep routine.",
          ],
        ),
        TestScoreModel(
          name: "10-14: Moderate depression",
          analysis:
              "Moderate symptoms of depression that can interfere with daily activities and reduce quality of life.",
          suggestions: [
            "Seek support from a mental health professional for therapy or counseling.",
            "Learn and apply cognitive-behavioral strategies to manage depression.",
            "Maintain a consistent routine and stay physically active.",
            "Consider joining support groups or engaging in therapeutic activities.",
          ],
        ),
        TestScoreModel(
          name: "15-27: Severe depression",
          analysis:
              "Severe symptoms of depression with significant impact on daily functioning and overall health.",
          suggestions: [
            "Immediate intervention from mental health professionals is necessary.",
            "Intensive therapy and possibly medication may be required.",
            "Develop a comprehensive treatment plan with professional guidance.",
            "Ensure a robust support network and consider intensive therapeutic programs.",
          ],
        ),
      ],
    ),
    TestModel(
      imagePath: "assets/images/tests/pss.png",
      description:"The PSS-10 evaluates how individuals perceive stress in their lives over the past month, focusing on unpredictability, uncontrollability, and overload.",

      title: "Perceived Stress Scale (PSS-10)",
      questions: [
        "In the last month, how often have you been upset because of something that happened unexpectedly?",
        "In the last month, how often have you felt that you were unable to control the important things in your life?",
        "In the last month, how often have you felt nervous and 'stressed'?",
        "In the last month, how often have you felt confident about your ability to handle your personal problems?",
        "In the last month, how often have you felt that things were going your way?",
        "In the last month, how often have you found that you could not cope with all the things that you had to do?",
        "In the last month, how often have you been able to control irritations in your life?",
        "In the last month, how often have you felt that you were on top of things?",
        "In the last month, how often have you been angered because of things that were outside of your control?",
        "In the last month, how often have you felt difficulties were piling up so high that you could not overcome them?",
      ],
      answers: [
        "Never",
        "Almost never",
        "Sometimes",
        "Fairly often",
        "Very often",
      ],
      scores: [
        TestScoreModel(
          name: "0-13: Low perceived stress",
          analysis:
              "Low levels of perceived stress, indicating good ability to cope with life's challenges.",
          suggestions: [
            "Maintain healthy coping mechanisms such as exercise, relaxation techniques, and time management.",
            "Foster supportive relationships and communication with others.",
            "Practice mindfulness or meditation to manage stress levels effectively.",
          ],
        ),
        TestScoreModel(
          name: "14-26: Moderate perceived stress",
          analysis:
              "Moderate levels of perceived stress that may occasionally feel overwhelming but generally manageable.",
          suggestions: [
            "Develop a structured plan to prioritize tasks and manage time effectively.",
            "Seek support from friends, family, or a counselor to discuss stressors and develop coping strategies.",
            "Engage in regular physical activity and relaxation exercises to reduce stress.",
          ],
        ),
        TestScoreModel(
          name: "27-40: High perceived stress",
          analysis:
              "High levels of perceived stress that may significantly impact daily functioning and overall well-being.",
          suggestions: [
            "Immediate action to reduce stress is recommended, such as seeking professional help or counseling.",
            "Implement stress management techniques consistently, including mindfulness or stress-reduction programs.",
            "Evaluate and address underlying causes of stress, such as work or relationship issues.",
          ],
        ),
      ],
    ),
    TestModel(
      imagePath: "assets/images/tests/epds.jpg",
      description: "The EPDS screens for postnatal depression symptoms among new mothers, addressing mood, anxiety, and coping abilities following childbirth.",
      title: "Edinburgh Postnatal Depression Scale (EPDS)",
      questions: [
        "In the past 7 days, I have been able to laugh and see the funny side of things.",
        "I have looked forward with enjoyment to things.",
        "I have blamed myself unnecessarily when things went wrong.",
        "I have been anxious or worried for no good reason.",
        "I have felt scared or panicky for no good reason.",
        "Things have been getting on top of me.",
        "I have been so unhappy that I have had difficulty sleeping.",
        "I have felt sad or miserable.",
        "I have been so unhappy that I have been crying.",
        "The thought of harming myself has occurred to me.",
      ],
      answers: [
        "Not at all",
        "Only occasionally",
        "Quite often",
        "Yes, most of the time",
      ],
      scores: [
        TestScoreModel(
          name: "0-7: Normal",
          analysis:
              "Low likelihood of depression. No immediate intervention needed.",
          suggestions: [
            "Continue self-care practices such as adequate rest and healthy nutrition.",
            "Stay connected with supportive friends and family members.",
            "Monitor mood changes and seek help if symptoms worsen.",
          ],
        ),
        TestScoreModel(
          name: "8-10: Mild depression",
          analysis:
              "Mild symptoms of postnatal depression. May benefit from self-care strategies and support.",
          suggestions: [
            "Engage in activities that promote relaxation and stress reduction.",
            "Talk to a healthcare provider or counselor about your feelings.",
            "Consider joining a support group for mothers experiencing similar challenges.",
          ],
        ),
        TestScoreModel(
          name: "11-13: Moderate depression",
          analysis:
              "Moderate symptoms of postnatal depression that may require professional support.",
          suggestions: [
            "Seek counseling or therapy to address underlying emotional challenges.",
            "Involve partner or family members in childcare to reduce stress.",
            "Ensure adequate rest and nutrition to support mental well-being.",
          ],
        ),
        TestScoreModel(
          name: "14-30: High depression",
          analysis:
              "High likelihood of postnatal depression requiring immediate professional intervention.",
          suggestions: [
            "Consult a healthcare provider or mental health specialist for assessment and treatment options.",
            "Consider therapy or medication under medical guidance.",
            "Reach out to trusted individuals for emotional support and practical assistance.",
          ],
        ),
      ],
    ),
    TestModel(
      imagePath: "assets/images/tests/spin.jpeg",
      description: "The SPIN measures social anxiety symptoms related to fear and avoidance of social situations, assessing discomfort and distress in social interactions.",
      title: "Social Phobia Inventory (SPIN)",
      questions: [
        "Fear of speaking in front of others.",
        "Fear of talking to people in authority.",
        "Fear of working while being observed.",
        "Avoiding social events due to fear of embarrassment.",
        "Avoiding situations where you might be the center of attention.",
        "Feeling uncomfortable when meeting strangers.",
        "Feeling nervous when being criticized or teased.",
        "Feeling nervous when eating or drinking in front of others.",
        "Feeling anxious when using public restrooms.",
      ],
      answers: [
        "Not at all",
        "A little bit",
        "Somewhat",
        "Very much",
      ],
      scores: [
        TestScoreModel(
          name: "0-19: Low social anxiety",
          analysis:
              "Low levels of social anxiety, with minimal interference in daily social interactions.",
          suggestions: [
            "Practice gradual exposure to feared social situations to build confidence.",
            "Engage in cognitive-behavioral techniques to challenge and reframe anxious thoughts.",
            "Seek social support from trusted friends or family members.",
          ],
        ),
        TestScoreModel(
          name: "20-39: Moderate social anxiety",
          analysis:
              "Moderate social anxiety affecting social interactions and daily functioning.",
          suggestions: [
            "Consider therapy or counseling to develop skills for managing social anxiety.",
            "Practice relaxation techniques before entering anxiety-provoking situations.",
            "Participate in social skills training to improve comfort in social settings.",
          ],
        ),
        TestScoreModel(
          name: "40-60: Severe social anxiety",
          analysis:
              "Severe social anxiety significantly impacting daily life and relationships.",
          suggestions: [
            "Seek specialized treatment such as cognitive-behavioral therapy (CBT) or exposure therapy.",
            "Explore medication options under the guidance of a healthcare provider.",
            "Join support groups or workshops focused on social anxiety management.",
          ],
        ),
      ],
    ),
    TestModel(
      imagePath: "assets/images/tests/isi.jpg",
      description: "The ISI assesses the severity of insomnia symptoms, including difficulty falling asleep, staying asleep, and the impact on daily functioning.",
      title: "Insomnia Severity Index (ISI)",
      questions: [
        "Difficulty falling asleep.",
        "Difficulty staying asleep.",
        "Problems waking up too early and not being able to get back to sleep.",
        "Sleep satisfaction (how satisfied/dissatisfied are you with your current sleep pattern?).",
        "Problems functioning (how noticeable to others do you think your sleep problem is in terms of impairing the quality of your life?).",
        "Interference with daily functioning.",
        "Noticeability of impairment attributed to the sleep problem.",
      ],
      answers: [
        "None",
        "Mild",
        "Moderate",
        "Severe",
      ],
      scores: [
        TestScoreModel(
          name: "0-7: No clinically significant insomnia",
          analysis:
              "No clinically significant insomnia present, sleep patterns are generally normal.",
          suggestions: [
            "Maintain a consistent sleep schedule, even on weekends.",
            "Limit caffeine and alcohol intake close to bedtime.",
            "Create a relaxing bedtime routine to signal your body it's time to sleep.",
          ],
        ),
        TestScoreModel(
          name: "8-14: Subthreshold insomnia",
          analysis:
              "Subthreshold insomnia with mild sleep difficulties affecting overall sleep quality.",
          suggestions: [
            "Practice relaxation techniques like deep breathing or progressive muscle relaxation.",
            "Address underlying factors contributing to insomnia, such as stress or lifestyle habits.",
            "Consider cognitive-behavioral therapy for insomnia (CBT-I) techniques.",
          ],
        ),
        TestScoreModel(
          name: "15-21: Clinical insomnia (moderate)",
          analysis:
              "Moderate clinical insomnia impacting daily functioning and quality of life.",
          suggestions: [
            "Seek evaluation by a healthcare provider or sleep specialist for proper diagnosis and treatment.",
            "Explore therapeutic interventions such as CBT-I or sleep medications under medical guidance.",
            "Implement sleep hygiene practices consistently to improve sleep quality.",
          ],
        ),
        TestScoreModel(
          name: "22-28: Clinical insomnia (severe)",
          analysis:
              "Severe clinical insomnia severely impacting daily functioning and mental well-being.",
          suggestions: [
            "Consult with a sleep specialist or psychiatrist for comprehensive evaluation and treatment.",
            "Consider a combination of therapies including medications and behavioral interventions.",
            "Develop a personalized sleep management plan with professional guidance.",
          ],
        ),
      ],
    ),
    TestModel(
      imagePath: "assets/images/tests/bdi.jpg",
      description: "The BDI-II evaluates depression severity through 21 questions covering mood, guilt, and physical symptoms, reflecting the emotional and cognitive aspects of depression.",
      title: "Beck Depression Inventory (BDI-II)",
      questions: [
        "Sadness",
        "Pessimism",
        "Past failure",
        "Loss of pleasure",
        "Guilty feelings",
        "Punishment feelings",
        "Self-dislike",
        "Self-criticalness",
        "Suicidal thoughts or wishes",
        "Crying",
        "Agitation",
        "Loss of interest",
        "Indecisiveness",
        "Worthlessness",
        "Loss of energy",
        "Changes in sleeping pattern",
        "Irritability",
        "Changes in appetite",
        "Concentration difficulty",
        "Tiredness or fatigue",
        "Loss of interest in sex"
      ],
      answers: [
        "I don’t feel sad",
        "I feel sad",
        "I am sad all the time",
        "I am so sad or unhappy that I can't stand it",
      ],
      scores: [
        TestScoreModel(
          name: "0-13: Minimal depression",
          analysis:
              "Minimal symptoms of depression, likely no significant impact on daily life.",
          suggestions: [
            "Maintain a healthy lifestyle with regular exercise and balanced nutrition.",
            "Engage in activities that bring joy and fulfillment.",
            "Monitor mood and seek professional advice if symptoms worsen.",
          ],
        ),
        TestScoreModel(
          name: "14-19: Mild depression",
          analysis:
              "Mild symptoms of depression that may cause some discomfort but generally manageable.",
          suggestions: [
            "Practice self-care and stress reduction techniques.",
            "Stay connected with supportive friends and family.",
            "Consider speaking to a counselor or therapist if symptoms persist or worsen.",
            "Engage in regular physical activity and maintain a healthy sleep routine.",
          ],
        ),
        TestScoreModel(
          name: "20-28: Moderate depression",
          analysis:
              "Moderate symptoms of depression that can interfere with daily activities and reduce quality of life.",
          suggestions: [
            "Seek support from a mental health professional for therapy or counseling.",
            "Learn and apply cognitive-behavioral strategies to manage depression.",
            "Maintain a consistent routine and stay physically active.",
            "Consider joining support groups or engaging in therapeutic activities.",
          ],
        ),
        TestScoreModel(
          name: "29-63: Severe depression",
          analysis:
              "Severe symptoms of depression with significant impact on daily functioning and overall health.",
          suggestions: [
            "Immediate intervention from mental health professionals is necessary.",
            "Intensive therapy and possibly medication may be required.",
            "Develop a comprehensive treatment plan with professional guidance.",
            "Ensure a robust support network and consider intensive therapeutic programs.",
          ],
        ),
      ],
    ),
    TestModel(
      imagePath: "assets/images/tests/sta.jpg",
      description: "The STAI differentiates between state anxiety (current feelings of anxiety) and trait anxiety (general tendency to perceive situations as threatening), providing insights into anxiety levels.",
      title: "State-Trait Anxiety Inventory (STAI)",
      questions: [
        "I feel calm.",
        "I feel tense.",
        "I feel upset.",
        "I am relaxed.",
        "I feel content.",
        "I am worried.",
        "I feel comfortable.",
        "I feel nervous.",
        "I am jittery.",
        "I am at ease.",
        "I feel strained.",
        "I am stressed.",
        "I feel secure.",
        "I feel frightened.",
        "I am worried.",
        "I feel jittery.",
        "I feel comfortable.",
        "I am nervous.",
        "I am at ease.",
        "I feel strained.",
        "I am stressed."
      ],
      answers: [
        "Not at all",
        "Somewhat",
        "Moderately so",
        "Very much so",
      ],
      scores: [
        TestScoreModel(
          name: "20-31: Mild anxiety",
          analysis:
              "Mild symptoms of anxiety that may cause occasional discomfort but do not significantly impair daily functioning.",
          suggestions: [
            "Incorporate stress management techniques such as yoga or meditation.",
            "Maintain social connections and talk about your feelings with friends or family.",
            "Consider using apps or resources for guided relaxation exercises.",
            "Monitor symptoms and seek professional advice if they worsen.",
          ],
        ),
        TestScoreModel(
          name: "32-43: Moderate anxiety",
          analysis:
              "Moderate anxiety symptoms that can interfere with daily activities and reduce quality of life.",
          suggestions: [
            "Seek support from a mental health professional for counseling or therapy.",
            "Learn and apply cognitive-behavioral strategies to manage anxiety.",
            "Practice regular physical exercise and maintain a consistent sleep schedule.",
            "Consider joining support groups or anxiety management workshops.",
          ],
        ),
        TestScoreModel(
          name: "44-56: Severe anxiety",
          analysis:
              "Severe anxiety symptoms that likely impact daily functioning and well-being.",
          suggestions: [
            "Immediate professional help is recommended, such as therapy or counseling.",
            "Medication may be considered under the guidance of a healthcare provider.",
            "Implement structured relaxation techniques and coping strategies.",
            "Ensure a strong support system of friends, family, or support groups.",
          ],
        ),
      ],
    ),
  ];

  late int selectedScore;
}
