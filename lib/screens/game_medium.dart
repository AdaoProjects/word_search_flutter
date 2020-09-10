import 'dart:io';
import 'dart:ui';
import 'dart:math';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:huntersofwords/utilites/colors.dart';
import 'package:audioplayers/audio_cache.dart';
AudioCache audioPlayer = AudioCache();
class Game_Medium extends StatefulWidget {

  @override
  _Game_MediumState createState() => _Game_MediumState();
}

class _Game_MediumState extends State<Game_Medium> with TickerProviderStateMixin {

  //Puzzle
  List<String> puzzle = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
  int count = -1;
  Random random = new Random();
  List<String> words = ['', '', '', '', ''];
  List<String> all =[
    'their',
    'would',
    'about',
    'there',
    'think',
    'which',
    'people',
    'could',
    'other',
    'these',
    'first',
    'thing',
    'those',
    'woman',
    'child',
    'after',
    'should',
    'world',
    'school',
    'still',
    'three',
    'state',
    'never',
    'become',
    'really',
    'family',
    'leave',
    'while',
    'great',
    'group',
    'begin',
    'where',
    'every',
    'start',
    'might',
    'place',
    'again',
    'system',
    'right',
    'during',
    'small',
    'number',
    'always',
    'night',
    'point',
    'today',
    'bring',
    'happen',
    'before',
    'large',
    'under',
    'water',
    'write',
    'mother',
    'money',
    'story',
    'young',
    'month',
    'study',
    'though',
    'issue',
    'black',
    'little',
    'house',
    'since',
    'around',
    'friend',
    'father',
    'until',
    'power',
    'often',
    'among',
    'stand',
    'member',
    'almost',
    'later',
    'white',
    'least',
    'learn',
    'change',
    'minute',
    'social',
    'watch',
    'follow',
    'parent',
    'create',
    'public',
    'speak',
    'others',
    'level',
    'allow',
    'office',
    'spend',
    'health',
    'person',
    'party',
    'within',
    'result',
    'reason',
    'early',
    'moment',
    'force',
    'offer',
    'enough',
    'across',
    'second',
    'maybe',
    'toward',
    'policy',
    'music',
    'appear',
    'human',
    'serve',
    'market',
    'expect',
    'sense',
    'build',
    'nation',
    'death',
    'course',
    'behind',
    'reach',
    'local',
    'remain',
    'effect',
    'class',
    'raise',
    'field',
    'former',
    'major',
    'along',
    'report',
    'better',
    'effort',
    'decide',
    'strong',
    'heart',
    'leader',
    'light',
    'voice',
    'whole',
    'police',
    'return',
    'price',
    'carry',
    'drive',
    'break',
    'thank',
    'value',
    'action',
    'model',
    'season',
    'player',
    'agree',
    'record',
    'paper',
    'space',
    'ground',
    'event',
    'whose',
    'matter',
    'center',
    'couple',
    'table',
    'court',
    'teach',
    'figure',
    'street',
    'image',
    'itself',
    'phone',
    'either',
    'cover',
    'quite',
    'clear',
    'piece',
    'recent',
    'doctor',
    'worker',
    'movie',
    'north',
    'simply',
    'third',
    'catch',
    'source',
    'nearly',
    'choose',
    'cause',
    'window',
    'listen',
    'chance',
    'energy',
    'period',
    'summer',
    'plant',
    'likely',
    'short',
    'letter',
    'choice',
    'single',
    'south',
    'floor',
    'church',
    'close',
    'future',
    'wrong',
    'anyone',
    'myself',
    'sport',
    'board',
    'fight',
    'throw',
    'order',
    'author',
    'focus',
    'blood',
    'agency',
    'nature',
    'color',
    'store',
    'reduce',
    'sound',
    'enter',
    'share',
    'common',
    'series',
    'animal',
    'factor',
    'decade',
    'shoot',
    'seven',
    'artist',
    'scene',
    'stock',
    'career',
    'eight',
    'beyond',
    'happy',
    'occur',
    'media',
    'ready',
    'simple',
    'accept',
    'answer',
    'argue',
    'amount',
    'staff',
    'growth',
    'degree',
    'wonder',
    'attack',
    'region',
    'pretty',
    'trade',
    'arrive',
    'lawyer',
    'glass',
    'skill',
    'sister',
    'crime',
    'stage',
    'design',
    'indeed',
    'truth',
    'check',
    'rather',
    'laugh',
    'guess',
    'prove',
    'entire',
    'forget',
    'claim',
    'remove',
    'enjoy',
    'legal',
    'final',
    'green',
    'memory',
    'above',
    'trial',
    'expert',
    'spring',
    'radio',
    'visit',
    'avoid',
    'finish',
    'theory',
    'impact',
    'charge',
    'reveal',
    'weapon',
    'peace',
    'apply',
    'shake',
    'manage',
    'chair',
    'camera',
    'weight',
    'treat',
    'affect',
    'inside',
    'style',
    'adult',
    'worry',
    'range',
    'writer',
    'middle',
    'dream',
    'stuff',
    'detail',
    'method',
    'hotel',
    'heavy',
    'sexual',
    'tough',
    'exist',
    'agent',
    'owner',
    'ahead',
    'cancer',
    'coach',
    'total',
    'finger',
    'garden',
    'notice',
    'modern',
    'civil',
    'budget',
    'mouth',
    'victim',
    'threat',
    'smile',
    'score',
    'dinner',
    'relate',
    'travel',
    'debate',
    'front',
    'admit',
    'senior',
    'assume',
    'alone',
    'suffer',
    'speech',
    'option',
    'fresh',
    'forest',
    'video',
    'global',
    'Senate',
    'reform',
    'access',
    'judge',
    'credit',
    'corner',
    'recall',
    'stare',
    'safety',
    'troop',
    'income',
    'track',
    'basic',
    'strike',
    'plane',
    'nobody',
    'object',
    'labor',
    'refer',
    'client',
    'touch',
    'please',
    'attend',
    'sleep',
    'press',
    'spirit',
    'brain',
    'dozen',
    'battle',
    'sorry',
    'crisis',
    'stick',
    'define',
    'easily',
    'vision',
    'status',
    'normal',
    'stone',
    'slowly',
    'scale',
    'driver',
    'drink',
    'handle',
    'truck',
    'survey',
    'winter',
    'Soviet',
    'refuse',
    'sales',
    'screen',
    'shape',
    'reader',
    'crowd',
    'horse',
    'target',
    'prison',
    'guard',
    'terms',
    'demand',
    'flight',
    'emerge',
    'quick',
    'pound',
    'basis',
    'bright',
    'guest',
    'sample',
    'block',
    'settle',
    'highly',
    'title',
    'mostly',
    'lesson',
    'faith',
    'river',
    'living',
    'count',
    'unless',
    'marry',
    'border',
    'gather',
    'limit',
    'worth',
    'critic',
    'aspect',
    'insist',
    'annual',
    'French',
    'affair',
    'spread',
    'ignore',
    'belief',
    'murder',
    'review',
    'editor',
    'engage',
    'coffee',
    'speed',
    'cross',
    'anyway',
    'commit',
    'female',
    'youth',
    'afraid',
    'native',
    'broad',
    'twice',
    'grade',
    'Indian',
    'quiet',
    'dress',
    'aware',
    'active',
    'extend',
    'chief',
    'below',
    'voter',
    'remind',
    'moral',
    'United',
    'depend',
    'photo',
    'direct',
    'daily',
    'famous',
    'flower',
    'supply',
    'fully',
    'actor',
    'birth',
    'search',
    'circle',
    'device',
    'bottom',
    'island',
    'clean',
    'studio',
    'train',
    'damage',
    'plate',
    'alive',
    'intend',
    'abuse',
    'extra',
    'danger',
    'desire',
    'injury',
    'paint',
    'climb',
    'sweet',
    'engine',
    'fourth',
    'expand',
    'metal',
    'ticket',
    'urban',
    'mental',
    'lunch',
    'farmer',
    'sugar',
    'planet',
    'obtain',
    'enemy',
    'invite',
    'repeat',
    'panel',
    'pocket',
    'breath',
    'sight',
    'adopt',
    'works',
    'belong',
    'advice',
    'empty',
    'trail',
    'novel',
    'breast',
    'Iraqi',
    'theme',
    'storm',
    'union',
    'thanks',
    'fruit',
    'yellow',
    'prime',
    'shadow',
    'dance',
    'being',
    'shift',
    'locate',
    'county',
    'bridge',
    'trend',
    'profit',
    'angry',
    'muscle',
    'notion',
    'prefer',
    'truly',
    'earth',
    'chest',
    'thick',
    'museum',
    'beauty',
    'unique',
    'ethnic',
    'stress',
    'select',
    'actual',
    'bottle',
    'hardly',
    'launch',
    'defend',
    'sheet',
    'ought',
    'ensure',
    'extent',
    'brown',
    'shirt',
    'pilot',
    'estate',
    'guide',
    'steal',
    'pursue',
    'funny',
    'Jewish',
    'blame',
    'crazy',
    'chain',
    'branch',
    'relief',
    'manner',
    'rating',
    'golden',
    'motion',
    'German',
    'gender',
    'solve',
    'equal',
    'forth',
    'frame',
    'except',
    'trust',
    'ocean',
    'afford',
    'regime',
    'appeal',
    'mirror',
    'tooth',
    'smart',
    'length',
    'topic',
    'secret',
    'nurse',
    'aside',
    'master',
    'doubt',
    'grant',
    'cloud',
    'winner',
    'volume',
    'pepper',
    'cheap',
    'beach',
    'divide',
    'oppose',
    'route',
    'league',
    'upper',
    'tired',
    'employ',
    'fewer',
    'apart',
    'match',
    'barely',
    'sector',
    'beside',
    'proud',
    'waste',
    'merely',
    'wheel',
    'invest',
    'cable',
    'expose',
    'rural',
    'narrow',
    'cream',
    'solid',
    'noise',
    'grass',
    'accuse',
    'useful',
    'reject',
    'talent',
    'taste',
    'escape',
    'height',
    'assess',
    'plenty',
    'sharp',
    'lower',
    'campus',
    'proper',
    'guilty',
    'column',
    'signal',
    'honor',
    'regard',
    'twenty',
    'knock',
    'asset',
    'prayer',
    'cheese',
    'permit',
    'bread',
    'scream',
    'deeply',
    'lucky',
    'agenda',
    'unable',
    'arrest',
    'brief',
    'steel',
    'shout',
    'visual',
    'fairly',
    'silent',
    'layer',
    'slide',
    'widely',
    'inform',
    'bother',
    'enable',
    'saving',
    'desert',
    'shall',
    'error',
    'double',
    'print',
    'formal',
    'album',
    'joint',
    'reply',
    'cycle',
    'stream',
    'grand',
    'hello',
    'knife',
    'racial',
    'phase',
    'potato',
    'quote',
    'online',
    'elect',
    'jacket',
    'rarely',
    'sauce',
    'priest',
    'shock',
    'adjust',
    'retire',
    'habit',
    'juice',
    'attach',
    'severe',
    'impose',
    'entry',
    'symbol',
    'maker',
    'Asian',
    'usual',
    'anger',
    'round',
    'clinic',
    'smell',
    'tomato',
    'butter',
    'surely',
    'tower',
    'smoke',
    'glance',
    'fellow',
    'smooth',
    'nearby',
    'coast',
    'silver',
    'inner',
    'junior',
    'throat',
    'salary',
    'swing',
    'unlike',
    'resist',
    'assist',
    'viewer',
    'mayor',
    'secure',
    'fifth',
    'favor',
    'weigh',
    'recipe',
    'wooden',
    'false',
    'Latin',
    'honest',
    'essay',
    'giant',
    'origin',
    'advise',
    'depth',
    'wealth',
    'shell',
    'onion',
    'deputy',
    'brand',
    'assure',
    'award',
    'dealer',
    'arise',
    'armed',
    'phrase',
    'stake',
    'Muslim',
    'fiber',
    'switch',
    'minor',
    'killer',
    'assign',
    'label',
    'index',
    'draft',
    'heaven',
    'rough',
    'drama',
    'clock',
    'sweep',
    'button',
    'super',
    'yield',
    'fence',
    'bunch',
    'found',
    'burden',
    'react',
    'string',
    'cheek',
    'resort',
    'tissue',
    'broken',
    'apple',
    'virus',
    'stupid',
    'occupy',
    'cousin',
    'blind',
    'retain',
    'latter',
    'slave',
    'terror',
    'elite',
    'bullet',
    'tight',
    'Bible',
    'chart',
    'solar',
    'square',
    'gently',
    'strip',
    'detect',
    'salad',
    'pause',
    'remote',
    'bench',
    'lover',
    'newly',
    'imply',
    'mutual',
    'pride',
    'mainly',
    'freeze',
    'ideal',
    'singer',
    'evolve',
    'partly',
    'thirty',
    'crash',
    'craft',
    'treaty',
    'fault',
    'loose',
    'prior',
    'relax',
    'stair',
    'proof',
    'sudden',
    'dirty',
    'tongue',
    'alter',
    'stable',
    'split',
    'steady',
    'vital',
    'adapt',
    'Irish',
    'honey',
    'vessel',
    'tribe',
    'shelf',
    'buyer',
    'dining',
    'wisdom',
    'garlic',
    'poetry',
    'scared',
    'slight',
    'shade',
    'mount',
    'angle',
    'differ',
    'custom',
    'carbon',
    'closer',
    'scheme',
    'crack',
    'galaxy',
    'given',
    'trace',
    'meter',
    'rapid',
    'hunter',
    'infant',
    'fifty',
    'porch',
    'derive',
    'fabric',
    'rifle',
    'trick',
    'asleep',
    'tennis',
    'nerve',
    'barrel',
    'ratio',
    'humor',
    'glove',
    'modest',
    'delay',
    'stroke',
    'scope',
    'badly',
    'prompt',
    'absorb',
    'eager',
    'cotton',
    'motor',
    'flavor',
    'float',
    'orange',
    'assert',
    'blade',
    'cabin',
    'valley',
    'yours',
    'pitch',
    'versus',
    'lemon',
    'hungry',
    'wander',
    'submit',
    'naked',
    'legacy',
    'shrug',
    'flame',
    'wound',
    'shower',
    'depict',
    'flesh',
    'garage',
    'borrow',
    'comedy',
    'twelve',
    'weekly',
    'grain',
    'brush',
    'devote',
    'seize',
    'ethics',
    'summit',
    'gifted',
    'medium',
    'shore',
    'basket',
    'powder',
    'ghost',
    'cookie',
    'awful',
    'admire',
    'exceed',
    'rhythm',
    'lovely',
    'script',
    'tactic',
    'piano',
    'margin',
    'mouse',
    'chase',
    'brick',
    'patch',
    'horror',
    'swear',
    'defeat',
    'slice',
    'sacred',
    'exact',
    'uncle',
    'soccer',
    'tunnel',
    'grave',
    'virtue',
    'abroad',
    'makeup',
    'couch',
    'legend',
    'shine',
    'upset',
    'remark',
    'resign',
    'reward',
    'gentle',
    'organ',
    'invent',
    'ritual',
    'insect',
    'salmon',
    'magic',
    'combat',
    'jeans',
    'flour',
    'bitter',
    'slope',
    'subtle',
    'bishop',
    'candy',
    'medal',
    'export',
    'curve',
    'logic',
    'harsh',
    'closet',
    'greet',
    'retail',
    'march',
    'snake',
    'excuse',
    'flash',
    'Islam',
    'Roman',
    'elbow',
    'deadly',
    'Korean',
    'plead',
    'sixth',
    'suburb',
    'trunk',
    'rumor',
    'render',
    'cloth',
    'plain',
    'fraud',
    'array',
    'strict',
    'burst',
    'motive',
    'flood',
    'arena',
    'drift',
    'drain',
    'hurry',
    'temple',
    'random',
    'wrist',
    'domain',
    'guilt',
    'cattle',
    'fiscal',
    'skirt',
    'hence',
    'endure',
    'strain',
    'guitar',
    'behave',
    'dancer',
    'await',
    'spill',
    'grace',
    'colony',
    'closed',
    'towel',
    'modify',
    'prize',
    'boost',
    'alarm',
    'weird',
    'sweat',
    'outer',
    'drunk',
    'govern',
    'ballot',
    'praise',
    'injure',
    'chaos',
    'canvas',
    'forty',
    'lobby',
    'format',
    'trait',
    'turkey',
    'thumb',
    'unity',
    'convey',
    'twist',
    'shame',
    'rebel',
    'frozen',
    'spouse',
    'fluid',
    'resume',
    'sodium',
    'bounce',
    'click',
    'pickup',
    'carve',
    'needle',
    'belly',
    'scare',
    'timing',
    'ankle',
    'rescue',
    'firmly',
    'rider',
    'poster',
    'crawl',
    'oxygen',
    'donor',
    'pastor',
    'opera',
    'punish',
    'equity',
    'statue',
    'repair',
    'decent',
    'clerk',
    'purple',
    'laser',
    'eating',
    'parade',
    'realm',
    'cancel',
    'blend',
    'pizza',
    'candle',
    'entity',
    'vanish',
    'racism',
    'casual',
    'enroll',
    'intent',
    'civic',
    'steep',
    'alien',
    'scary',
    'angel',
    'toilet',
    'hidden',
    'tender',
    'lonely',
    'silly',
    'shared',
    'pillow',
    'ruling',
    'lately',
    'ranch',
    'softly',
    'verbal',
    'tribal',
    'import',
    'divine',
    'elder',
    'Dutch',
    'Greek',
    'genius',
    'quest',
    'juror',
    'broker',
    'stiff',
    'output',
    'toxic',
    'grief',
    'rocket',
    'donate',
    'inmate',
    'tackle',
    'carpet',
    'bubble',
    'buddy',
    'sword',
    'glory',
    'faint',
    'queen',
    'input',
    'bloody',
    'steam',
    'accent',
    'unite',
    'equip',
    'shrimp',
    'bless',
    'bonus',
    'mixed',
    'orbit',
    'grasp',
    'spite',
    'voting',
    'patrol',
    'wagon',
    'sheer',
    'immune',
    'exotic',
    'thigh',
    'drawer',
    'sheep',
    'runner',
    'empire',
    'whale',
    'skull',
    'puzzle',
    'tragic',
    'safely',
    'eleven',
    'bureau',
    'breeze',
    'costly',
    'spell',
    'insert',
    'booth',
    'helmet',
    'waist',
    'royal',
    'panic',
    'crush',
    'cliff',
    'casino',
    'tumor',
    'pulse',
    'fixed',
    'diary',
    'irony',
    'spoon',
    'midst',
    'alley',
    'rival',
    'punch',
    'hockey',
    'known',
    'purse',
    'liquid',
    'foster',
    'cheat',
    'fever',
    'filter',
    'rabbit',
    'dried',
    'shove',
    'stove',
    'alike',
    'dough',
    'outfit',
    'patent',
    'trash',
    'gross',
    'pencil',
    'spray',
    'banker',
    'beast',
    'eighth',
    'behalf',
    'shark',
    'fleet',
    'stance',
    'compel',
    'debut',
    'scent',
    'stack',
    'cease',
    'nasty',
    'shrink',
    'wheat',
    'fierce',
    'aisle',
    'weaken',
    'vocal',
    'openly',
    'unfair',
    'deploy',
    'risky',
    'pasta',
    'genre',
    'merit',
    'chunk',
    'ladder',
    'jungle',
    'invade',
    'robot',
    'sphere',
    'boast',
    'unfold',
    'collar',
    'streak',
    'added',

  ];
  int num_rows_and_columns=10;
  bool word_one_scratch =false;
  bool word_two_scratch=false;
  bool word_three_scratch=false;
  bool word_four_scratch=false;
  bool word_five_scratch=false;
  int row_one;
  int column_one;
  int row_two;
  int column_two;
  int row_three;
  int column_three;
  int row_four;
  int column_four;
  int row_five;
  int column_five;
  int sorted_Num_Words;
//Paint
  bool fisrt_Point_drawed=false;
  int number_Of_Words_Selected=0;
  int init_Pan_Update=0;
  List<int> solution_positions=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,];
  int row_start;
  int column_start;
  int row_end=0;
  int column_end=0;
  double start_Of_Selection_dx;
  double start_Of_Selection_dy;
  double end_Of_Selection_dx;
  double end_Of_Selection_dy;
  List<DrawingPoints> points = List();
  StrokeCap strokeCap = (Platform.isAndroid) ? StrokeCap.butt : StrokeCap.round;
  Color selected_color;
  bool old_Puzzle=false;
  double opacity = 0.2;
  List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.amber,
  ];
  //Timer
  int _counter = 0;
  AnimationController _controller;
  int levelClock = 180;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: GestureDetector(
          onPanUpdate: (details) {
            RenderBox box = context.findRenderObject();
            final Offset local = box.globalToLocal(
                details.globalPosition);
            for (int row = 0; row < num_rows_and_columns; row++) {
              for (int column = 0; column < num_rows_and_columns; column++) {
                if (local.dx > MediaQuery
                    .of(context)
                    .size
                    .width / 18.4
                    + column * MediaQuery
                        .of(context)
                        .size
                        .width / 11.28 && local.dx < MediaQuery
                    .of(context)
                    .size
                    .width / 18.4 + (column + 1) * MediaQuery
                    .of(context)
                    .size
                    .width / 11.28

                    && local.dy > MediaQuery
                        .of(context)
                        .size
                        .height / 3.732 + row * MediaQuery
                        .of(context)
                        .size
                        .height / 18.75 && local.dy < MediaQuery
                    .of(context)
                    .size
                    .height / 3.732 + (row + 1) * MediaQuery
                    .of(context)
                    .size
                    .height / 18.75) {
                  end_Of_Selection_dx = MediaQuery
                      .of(context)
                      .size
                      .width / 18.4 + (column + 1 / 2) * MediaQuery
                      .of(context)
                      .size
                      .width / 11.28;
                  end_Of_Selection_dy = MediaQuery
                      .of(context)
                      .size
                      .height / 3.732 + (row + 1 / 2) * MediaQuery
                      .of(context)
                      .size
                      .height / 18.75;
                  if(row_end!=row || column_end!=column){
                    audioPlayer.play('sounds/selectionsound.wav');
                  }
                  row_end=row;
                  column_end=column;
                  if(init_Pan_Update!=0) {
                    points.removeAt(2*number_Of_Words_Selected + 1);
                  }init_Pan_Update=1;
                  setState(() {
                    points.add(DrawingPoints(
                      first:false,
                      points: Offset(
                        end_Of_Selection_dx,
                        end_Of_Selection_dy,),
                      paint: Paint()
                        ..strokeCap = strokeCap
                        ..isAntiAlias = true
                        ..color = selected_color.withOpacity(
                            opacity)
                        ..strokeWidth = MediaQuery
                            .of(context)
                            .size
                            .height / 18.75,
                    ));
                    count=-1;
                  });
                }
              }
            }

          },
          onPanStart: (details) {
            old_Puzzle = true;
            RenderBox box = context.findRenderObject();
            if(!fisrt_Point_drawed) {
              final Offset local = box.globalToLocal(
                  details.globalPosition);
              for (int row = 0; row < num_rows_and_columns; row++) {
                for (int column = 0; column < num_rows_and_columns; column++) {
                  if (local.dx > MediaQuery
                      .of(context)
                      .size
                      .width / 18.4
                      + column * MediaQuery
                          .of(context)
                          .size
                          .width / 11.28 && local.dx < MediaQuery
                      .of(context)
                      .size
                      .width / 18.4 + (column + 1) * MediaQuery
                      .of(context)
                      .size
                      .width / 11.28

                      && local.dy > MediaQuery
                          .of(context)
                          .size
                          .height / 3.732 + row * MediaQuery
                          .of(context)
                          .size
                          .height / 18.75 && local.dy < MediaQuery
                      .of(context)
                      .size
                      .height / 3.732 + (row + 1) * MediaQuery
                      .of(context)
                      .size
                      .height / 18.75) {
                    audioPlayer.play('sounds/selectionsound.wav');
                    setState(() {
                      start_Of_Selection_dx=MediaQuery
                          .of(context)
                          .size
                          .width / 18.4 +
                          (column + 1 / 2) * MediaQuery
                              .of(context)
                              .size
                              .width / 11.28;
                      start_Of_Selection_dy=MediaQuery
                          .of(context)
                          .size
                          .height / 3.732 +
                          (row + 1 / 2) * MediaQuery
                              .of(context)
                              .size
                              .height / 18.75;

                      row_start=row;
                      column_start=column;
                      points.add(DrawingPoints(
                        first:true,
                        points: Offset(start_Of_Selection_dx, start_Of_Selection_dy),
                        paint: Paint()
                          ..strokeCap = strokeCap
                          ..isAntiAlias = true
                          ..color = random_Color().withOpacity(
                              opacity)
                          ..strokeWidth = MediaQuery
                              .of(context)
                              .size
                              .height / 18.75,


                      ));
                      count = -1;
                      init_Pan_Update=0;
                    });
                  }
                }
              }
            }
            fisrt_Point_drawed=true;
          },
          onPanEnd: (details) {
            bool found_word=false;
            for(int i =0 ;i<words.length;i++){
              if(
              row_start==solution_positions[4*i]&&
                  column_start==solution_positions[4*i+1]&&
                  row_end==solution_positions[4*i+2]&&
                  column_end==solution_positions[4*i+3]
                  ||
                  row_start==solution_positions[4*i+2]&&
                      column_start==solution_positions[4*i+3]&&
                      row_end==solution_positions[4*i]&&
                      column_end==solution_positions[4*i+1]){
                found_word=true;
                number_Of_Words_Selected++;
                if((row_one==row_start && column_one==column_start) ||(row_one==row_end && column_one==column_end) ){
                  setState(() {
                    word_one_scratch=true;
                  });
                }else if((row_two==row_start && column_two==column_start) ||(row_two==row_end && column_two==column_end) ){
                  setState(() {
                    word_two_scratch=true;
                  });
                }else if((row_three==row_start && column_three==column_start) ||(row_three==row_end && column_three==column_end) ){
                  setState(() {
                    word_three_scratch=true;
                  });
                }else if((row_four==row_start && column_four==column_start) ||(row_four==row_end && column_four==column_end) ){
                  setState(() {
                    word_four_scratch=true;
                  });
                }else {
                  setState(() {
                    word_five_scratch=true;
                  });
                }
              }
            }
            if(!found_word){
              points.removeAt(2*number_Of_Words_Selected+1);
              points.removeAt(2*number_Of_Words_Selected);
            }
            fisrt_Point_drawed=false;
          },

          child: CustomPaint(
            size: Size.infinite,
            foregroundPainter:DrawingPainter(
              pointsList: points,
            ) ,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset('assets/images/artecriada.jpg',
                      height: MediaQuery
                          .of(context)
                          .size
                          .height / 7,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width),
                  Row(
                      children: [
                        SizedBox(width: MediaQuery
                            .of(context)
                            .size
                            .width / 10),
                        Text('LEVEL: MEDIUM',
                          style: TextStyle(fontSize: MediaQuery
                              .of(context)
                              .size
                              .height / 25,
                            color:Colors.white,),
                        ),
                        SizedBox(width: MediaQuery
                            .of(context)
                            .size
                            .width / 10),
                        //Timer
                        Icon(Icons.timer,
                          color: Colors.white,),
                        Countdown(
                          animation: StepTween(
                            begin: levelClock,
                            end: 0,
                          ).animate(_controller),
                        ),
                      ]
                  ),
                  SizedBox(height:MediaQuery
                      .of(context)
                      .size
                      .height / 25),
                  Container(
                    width:MediaQuery
                        .of(context)
                        .size
                        .width* 8/ 10 *1.1,
                    child:Table(
                      children: [
                        TableRow(
                          children: [
                             Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                          ],
                        ),

                        TableRow(
                          children: [
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                          ],
                        ),

                        TableRow(
                          children: [
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                          ],
                        ),


                        TableRow(
                          children: [
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                          ],
                        ),

                        TableRow(
                          children: [
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                          ],
                        ),

                        TableRow(
                          children: [
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                          ],
                        ),

                        TableRow(
                          children: [
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) :
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35),) ,

                            ),
                          ],
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,

                        boxShadow: [
                          BoxShadow(
                              color: GameColors.button_Background_Light, spreadRadius: MediaQuery.of(context).size.height/100),
                        ],
                        borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height/30)
                    ),
                  ),
                  SizedBox(height:MediaQuery
                      .of(context)
                      .size
                      .height / 25),
                  Container(
                    width:MediaQuery
                        .of(context)
                        .size
                        .width* 3/ 5 ,
                    child: Table(
                        children: [
                          TableRow( children:[
                            Row(children:[
                              SizedBox(width:MediaQuery.of(context).size.width/15),
                              (word_one_scratch && sorted_Num_Words==4) ||(word_two_scratch && sorted_Num_Words==0)||(word_three_scratch && sorted_Num_Words==1)||(word_four_scratch && sorted_Num_Words==2)||(word_five_scratch && sorted_Num_Words==3) ? Center(child:Text(return_Sorted_Words()+', ' ,
                                style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 30,
                                    color:Colors.black),
                              )):Center(child:Text(return_Sorted_Words()+',' ,
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 30,
                                    color:Colors.black),
                              ),),
                              SizedBox(width:MediaQuery.of(context).size.width/17),
                              (word_one_scratch && sorted_Num_Words==4) ||(word_two_scratch && sorted_Num_Words==0)||(word_three_scratch && sorted_Num_Words==1)||(word_four_scratch && sorted_Num_Words==2)||(word_five_scratch && sorted_Num_Words==3) ? Text(return_Sorted_Words() ,
                                style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 30,
                                    color:Colors.black),
                              ):Text(return_Sorted_Words() ,
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 30,
                                    color:Colors.black),
                              )
                            ]
                            ),
                          ]),


                          TableRow( children:[
                            Row(children:[
                              SizedBox(width:MediaQuery.of(context).size.width/15),
                              (word_one_scratch && sorted_Num_Words==4) ||(word_two_scratch && sorted_Num_Words==0)||(word_three_scratch && sorted_Num_Words==1)||(word_four_scratch && sorted_Num_Words==2)||(word_five_scratch && sorted_Num_Words==3) ? Center(child:Text(return_Sorted_Words()+', ' ,
                                style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 30,
                                    color:Colors.black),
                              )):Center(child:Text(return_Sorted_Words()+',' ,
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 30,
                                    color:Colors.black),
                              ),),
                              SizedBox(width:MediaQuery.of(context).size.width/17),
                              (word_one_scratch && sorted_Num_Words==4) ||(word_two_scratch && sorted_Num_Words==0)||(word_three_scratch && sorted_Num_Words==1)||(word_four_scratch && sorted_Num_Words==2)||(word_five_scratch && sorted_Num_Words==3) ? Center(child:Text(return_Sorted_Words(),
                                style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 30,
                                    color:Colors.black),
                              ),):Center(child:Text(return_Sorted_Words() ,
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 30,
                                    color:Colors.black),
                              ),),
                            ]
                            ),
                          ]
                          ),

                          TableRow( children:[
                            Column(
                                children:[
                                  (word_one_scratch && sorted_Num_Words==4) ||(word_two_scratch && sorted_Num_Words==0)||(word_three_scratch && sorted_Num_Words==1)||(word_four_scratch && sorted_Num_Words==2)||(word_five_scratch && sorted_Num_Words==3) ? Text(return_Sorted_Words() ,
                                    style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        fontSize: MediaQuery
                                            .of(context)
                                            .size
                                            .height / 30,
                                        color:Colors.black),
                                  ):Text(return_Sorted_Words() ,
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 30,
                                        color:Colors.black),
                                  )
                                ]
                            ),
                          ]
                          ),
                        ]
                    ),

                    decoration: BoxDecoration(
                      color: Colors.white,

                      boxShadow: [
                        BoxShadow(
                            color: GameColors.button_Background_Light, spreadRadius: MediaQuery.of(context).size.height/100),

                      ],
                      borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height/30) ,
                    ),
                  ),
                ]
            ),
          ),
        ),
      ),

    );
  }

  String write_Random_Letter() {
    List<String> letters = [
      'A',
      'B',
      'C',
      'D',
      'E',
      'F',
      'G',
      'H',
      'I',
      'J',
      'K',
      'L',
      'M',
      'N',
      'O',
      'P',
      'Q',
      'R',
      'S',
      'T',
      'U',
      'V',
      'W',
      'X',
      'Y',
      'Z'
    ];
    Random random = new Random();
    return letters[random.nextInt(26)];
  }

  create_Puzzle_Random(){
    if (count == -1) {
      for (int i = 0; i < num_rows_and_columns*num_rows_and_columns; i++) {
        puzzle[i] = write_Random_Letter();
      }
      pick_Random_Words();
      write_Puzzle_Words(
          puzzle, words[0], words[1], words[2], words[3], words[4]);
    }
    sorted_Num_Words=random.nextInt(5)-1;
    print('Here');
  }
  String return_Sorted_Words(){
    sorted_Num_Words++;
    if(sorted_Num_Words==5){
      sorted_Num_Words=0;
    }
    return words[sorted_Num_Words];
  }
  String write_Puzzle_Letter() {
    create_Puzzle_Random();
    count++;
    if (count == num_rows_and_columns*num_rows_and_columns) {
      count=0;
    }
    return puzzle[count];
  }
  String get_Old_Puzzle_Letter(){
    count++;
    if (count == num_rows_and_columns*num_rows_and_columns) {
      count=0;
    }
    return puzzle[count];
  }

  write_Puzzle_Words(List<String> puzzle, String word_one, String word_two,
      String word_three, String word_four, String word_five) {
    Random random = new Random();
    // the row and column from the 'beginer of the words', rigth is positive and down is positive, later the word can be changed to reversed order so it makes more difficult the puzzle
    row_one = random.nextInt(num_rows_and_columns);
    row_two = random.nextInt(num_rows_and_columns);
    row_three = random.nextInt(num_rows_and_columns - word_three.length + 1);
    row_four = random.nextInt(num_rows_and_columns - word_four.length + 1);

    column_one = random.nextInt(num_rows_and_columns - word_one.length + 1);
    column_two = random.nextInt(num_rows_and_columns - word_two.length + 1);
    column_three = random.nextInt(num_rows_and_columns);
    column_four = random.nextInt(num_rows_and_columns);


    int direction_of_diagonal = random.nextInt(2);
    //  zero is SO, one is SE
    if(random.nextInt(2)==0) {
      if (random.nextInt(2)==0) {
        row_five = random.nextInt(num_rows_and_columns - word_five.length + 1);
        column_five = random.nextInt(num_rows_and_columns - word_five.length + 1);

        while (row_one == row_two || ((row_five <= row_one &&
            row_five + word_five.length - 1 >= row_one) &&
            ((column_five >= column_one &&
                column_five <= column_one + word_one.length - 1) ||
                (column_five + word_five.length - 1 >= column_one &&
                    column_five + word_five.length - 1 <=
                        column_one + word_one.length - 1)))
            || ((row_five <= row_two &&
                row_five + word_five.length - 1 >= row_two) &&
                ((column_five >= column_two &&
                    column_five <= column_two + word_two.length - 1) ||
                    (column_five + word_five.length - 1 >= column_two &&
                        column_five + word_five.length - 1 <=
                            column_two + word_two.length - 1)))) {
          row_one = random.nextInt(num_rows_and_columns);
          row_two = random.nextInt(num_rows_and_columns);
          column_one = random.nextInt(num_rows_and_columns - word_one.length + 1);
          column_two = random.nextInt(num_rows_and_columns - word_two.length + 1);
        }
        int tried_too_much_just_find_solution = 0;
        while ((column_three >= column_one &&
            column_three <= column_one + word_one.length - 1 &&
            row_three <= row_one &&
            row_three + word_three.length - 1 >= row_one) ||
            (column_three >= column_two &&
                column_three <= column_two + word_two.length - 1 &&
                row_three <= row_two &&
                row_three + word_three.length - 1 >= row_two) ||
            ((column_five <= column_three &&
                column_five + word_five.length - 1 >= column_three) &&
                ((row_five >= row_three &&
                    row_five <= row_three + word_two.length - 1) ||
                    (row_five + word_five.length - 1 >= row_three &&
                        row_five + word_five.length - 1 <=
                            row_three + word_two.length - 1)))) {
          if (tried_too_much_just_find_solution > 90) {
            if (tried_too_much_just_find_solution % word_four.length+1 != 0) {
              row_three++;
            } else {
              column_three++;
              row_three = 0;
            }
          } else {
            column_three = random.nextInt(num_rows_and_columns);
            row_three = random.nextInt(num_rows_and_columns - word_three.length + 1);
          }
          tried_too_much_just_find_solution++;
          if (tried_too_much_just_find_solution == 91) {
            column_three = 0;
            row_three = 0;
          }
        }
        tried_too_much_just_find_solution = 0;
        while (column_four == column_three || (column_four >= column_one &&
            column_four <= column_one + word_one.length - 1 &&
            row_four <= row_one &&
            row_four + word_four.length - 1 >= row_one) ||
            (column_four >= column_two &&
                column_four <= column_two + word_two.length - 1 &&
                row_four <= row_two &&
                row_four + word_four.length - 1 >= row_two) ||
            ((column_five <= column_four &&
                column_five + word_five.length - 1 >= column_four) &&
                ((row_five >= row_four &&
                    row_five <= row_four + word_two.length - 1) ||
                    (row_five + word_five.length - 1 >= row_four &&
                        row_five + word_five.length - 1 <=
                            row_four + word_two.length - 1)))) {
          if (tried_too_much_just_find_solution > 90) {
            if (tried_too_much_just_find_solution % word_four.length+1 != 0) {
              row_four--;
            } else {
              column_four--;
              row_four = num_rows_and_columns-word_four.length;
            }
          } else {
            column_four = random.nextInt(num_rows_and_columns);
            row_four = random.nextInt(num_rows_and_columns - word_four.length + 1);
          }
          tried_too_much_just_find_solution++;
          if (tried_too_much_just_find_solution == 91) {
            column_four = num_rows_and_columns-1;
            row_four = num_rows_and_columns-word_four.length;
          }
        }

        if (random.nextInt(2) == 0) {
          for (int i = 0; i < word_five.length; i++) {
            puzzle[(row_five + i) * num_rows_and_columns + column_five + i] = word_five[i];
          }
        } else {
          for (int i = 0; i < word_five.length; i++) {
            puzzle[(row_five + i) * num_rows_and_columns + column_five + i] =
            word_five[word_five.length - 1 - i];
          }
        }
        solution_positions[16]=row_five;
        solution_positions[17]=column_five;
        solution_positions[18]=row_five+word_five.length-1;
        solution_positions[19]=column_five+word_five.length-1;

      } else {
        row_five = random.nextInt(num_rows_and_columns - word_five.length + 1);
        column_five = num_rows_and_columns-1 - random.nextInt(num_rows_and_columns - word_five.length + 1);
        while (row_one == row_two || ((row_five <= row_one &&
            row_five + word_five.length - 1 >= row_one) &&
            ((column_five >= column_one &&
                column_five <= column_one + word_one.length - 1) ||
                (column_five - word_five.length + 1 >= column_one &&
                    column_five - word_five.length + 1 <=
                        column_one + word_one.length - 1)))
            || ((row_five <= row_two &&
                row_five + word_five.length - 1 >= row_two) &&
                ((column_five >= column_two &&
                    column_five <= column_two + word_two.length - 1) ||
                    (column_five - word_five.length + 1 >= column_two &&
                        column_five - word_five.length + 1 <=
                            column_two + word_two.length - 1)))) {
          row_one = random.nextInt(num_rows_and_columns);
          row_two = random.nextInt(num_rows_and_columns);
          column_one = random.nextInt(num_rows_and_columns - word_one.length + 1);
          column_two = random.nextInt(num_rows_and_columns - word_two.length + 1);
        }
        int tried_too_much_just_find_solution = 0;
        while ((column_three >= column_one &&
            column_three <= column_one + word_one.length - 1 &&
            row_three <= row_one &&
            row_three + word_three.length - 1 >= row_one) ||
            (column_three >= column_two &&
                column_three <= column_two + word_two.length - 1 &&
                row_three <= row_two &&
                row_three + word_three.length - 1 >= row_two) ||
            ((column_five >= column_three &&
                column_five - word_five.length + 1 <= column_three) &&
                ((row_five >= row_three &&
                    row_five <= row_three + word_two.length - 1) ||
                    (row_five + word_five.length - 1 >= row_three &&
                        row_five + word_five.length - 1 <=
                            row_three + word_two.length - 1)))) {
          if (tried_too_much_just_find_solution > 90) {

            if (tried_too_much_just_find_solution % word_three.length+1 != 0) {
              row_three++;
            } else {
              row_three = 0;
              column_three++;
            }
          } else {
            column_three = random.nextInt(8);
            row_three = random.nextInt(8 - word_three.length + 1);
          }
          tried_too_much_just_find_solution++;
          if (tried_too_much_just_find_solution == 91) {
            column_three = 0;
            row_three = 0;
          }
        }
        tried_too_much_just_find_solution = 0;
        while (column_four == column_three || (column_four >= column_one &&
            column_four <= column_one + word_one.length - 1 &&
            row_four <= row_one &&
            row_four + word_four.length - 1 >= row_one) ||
            (column_four >= column_two &&
                column_four <= column_two + word_two.length - 1 &&
                row_four <= row_two &&
                row_four + word_four.length - 1 >= row_two) ||
            ((column_five >= column_four &&
                column_five - word_five.length + 1 <= column_four) &&
                ((row_five >= row_four &&
                    row_five <= row_four + word_two.length - 1) ||
                    (row_five + word_five.length - 1 >= row_four &&
                        row_five + word_five.length - 1 <=
                            row_four + word_two.length - 1)))) {
          if (tried_too_much_just_find_solution > 90) {

            if (tried_too_much_just_find_solution % word_four.length+1 != 0) {
              row_four--;
            } else {
              row_four = num_rows_and_columns-word_four.length;
              column_four--;
            }
          } else {
            column_four = random.nextInt(8);
            row_four = random.nextInt(8 - word_four.length + 1);
          }
          tried_too_much_just_find_solution++;
          if (tried_too_much_just_find_solution == 91) {
            column_four = num_rows_and_columns-1;
            row_four = num_rows_and_columns-word_four.length;
          }
        }
        if (random.nextInt(2) == 0) {
          for (int i = 0; i < word_five.length; i++) {
            puzzle[(row_five + i) * num_rows_and_columns + column_five - i] = word_five[i];
          }
        } else {
          for (int i = 0; i < word_five.length; i++) {
            puzzle[(row_five + i) * num_rows_and_columns + column_five - i] =
            word_five[word_five.length - 1 - i];
          }
        }
        solution_positions[16]=row_five;
        solution_positions[17]=column_five;
        solution_positions[18]=row_five+word_five.length-1;
        solution_positions[19]=column_five-word_five.length+1;
      }
    }else {
      if (random.nextInt(2) == 0) {
        row_five = random.nextInt(num_rows_and_columns);
        column_five =
            random.nextInt(num_rows_and_columns - word_five.length + 1);
        while (row_five == row_one || row_five == row_two ||
            row_one == row_two) {
          row_one = random.nextInt(num_rows_and_columns);
          row_two = random.nextInt(num_rows_and_columns);
          row_five = random.nextInt(num_rows_and_columns);
          column_one =
              random.nextInt(num_rows_and_columns - word_one.length + 1);
          column_two =
              random.nextInt(num_rows_and_columns - word_two.length + 1);
          column_five =
              random.nextInt(num_rows_and_columns - word_five.length + 1);
        }
        while ((column_three >= column_one &&
            column_three <= column_one + word_one.length - 1 &&
            row_three <= row_one &&
            row_three + word_three.length - 1 >= row_one) ||
            (column_three >= column_two &&
                column_three <= column_two + word_two.length - 1 &&
                row_three <= row_two &&
                row_three + word_three.length - 1 >= row_two) ||
            (column_three >= column_five &&
                column_three <= column_five + word_five.length - 1 &&
                row_three <= row_five &&
                row_three + word_three.length - 1 >= row_five)) {
          column_three = random.nextInt(num_rows_and_columns);
          row_three =
              random.nextInt(num_rows_and_columns - word_three.length + 1);
        }
        while ((column_four >= column_one &&
            column_four <= column_one + word_one.length - 1 &&
            row_four <= row_one &&
            row_four + word_four.length - 1 >= row_one) ||
            (column_four >= column_two &&
                column_four <= column_two + word_two.length - 1 &&
                row_four <= row_two &&
                row_four + word_four.length - 1 >= row_two) ||
            (column_four >= column_five &&
                column_four <= column_five + word_five.length - 1 &&
                row_four <= row_five &&
                row_four + word_four.length - 1 >= row_five) ||
            column_four == column_three) {
          column_four = random.nextInt(num_rows_and_columns);
          row_four =
              random.nextInt(num_rows_and_columns - word_four.length + 1);
        }
        if (random.nextInt(2) == 0) {
          for (int i = 0; i < word_five.length; i++) {
            puzzle[row_five * num_rows_and_columns + i + column_five] =
            word_five[i];
          }
        } else {
          for (int i = 0; i < word_five.length; i++) {
            puzzle[row_five * num_rows_and_columns + i + column_five] =
            word_five[word_five.length - 1 - i];
          }
        }
        solution_positions[16] = row_five;
        solution_positions[17] = column_five;
        solution_positions[18] = row_five;
        solution_positions[19] = column_five + word_five.length - 1;
      } else {
        row_five = random.nextInt(num_rows_and_columns - word_five.length);
        column_five = random.nextInt(num_rows_and_columns);
        while (row_one == row_two) {
          row_one = random.nextInt(num_rows_and_columns);
          row_two = random.nextInt(num_rows_and_columns);
          column_one =
              random.nextInt(num_rows_and_columns - word_one.length + 1);
          column_two =
              random.nextInt(num_rows_and_columns - word_two.length + 1);
        }
        while ((column_three >= column_one &&
            column_three <= column_one + word_one.length - 1 &&
            row_three <= row_one &&
            row_three + word_three.length - 1 >= row_one) ||
            (column_three >= column_two &&
                column_three <= column_two + word_two.length - 1 &&
                row_three <= row_two &&
                row_three + word_three.length - 1 >= row_two)) {
          column_three = random.nextInt(num_rows_and_columns);
          row_three =
              random.nextInt(num_rows_and_columns - word_three.length + 1);
        }
        while ((column_four >= column_one &&
            column_four <= column_one + word_one.length - 1 &&
            row_four <= row_one &&
            row_four + word_four.length - 1 >= row_one) ||
            (column_four >= column_two &&
                column_four <= column_two + word_two.length - 1 &&
                row_four <= row_two &&
                row_four + word_four.length - 1 >= row_two) ||
            column_three == column_four) {
          column_four = random.nextInt(num_rows_and_columns);
          row_four =
              random.nextInt(num_rows_and_columns - word_four.length + 1);
        }
        while ((column_five >= column_one &&
            column_five <= column_one + word_one.length - 1 &&
            row_five <= row_one &&
            row_five + word_five.length - 1 >= row_one) ||
            (column_five >= column_two &&
                column_five <= column_two + word_two.length - 1 &&
                row_five <= row_two &&
                row_five + word_five.length - 1 >= row_two) ||
            column_three == column_five || column_four == column_five) {
          column_five = random.nextInt(num_rows_and_columns);
          row_five =
              random.nextInt(num_rows_and_columns - word_five.length + 1);
        }
        if (random.nextInt(2) == 0) {
          for (int i = 0; i < word_five.length; i++) {
            puzzle[(row_five + i) * num_rows_and_columns + column_five] =
            word_five[i];
          }
        } else {
          for (int i = 0; i < word_five.length; i++) {
            puzzle[(row_five + i) * num_rows_and_columns + column_five] =
            word_five[word_five.length - 1 - i];
          }
        }
        solution_positions[16] = row_five;
        solution_positions[17] = column_five;
        solution_positions[18] = row_five + word_five.length - 1;
        solution_positions[19] = column_five;
      }
    }
    solution_positions[0]=row_one;
    solution_positions[1]=column_one;
    solution_positions[2]=row_one;
    solution_positions[3]=column_one+word_one.length-1;
    solution_positions[4]=row_two;
    solution_positions[5]=column_two;
    solution_positions[6]=row_two;
    solution_positions[7]=column_two+word_two.length-1;
    solution_positions[8]=row_three;
    solution_positions[9]=column_three;
    solution_positions[10]=row_three+word_three.length-1;
    solution_positions[11]=column_three;
    solution_positions[12]=row_four;
    solution_positions[13]=column_four;
    solution_positions[14]=row_four+word_four.length-1;
    solution_positions[15]=column_four;

  }


  pick_Random_Words() {
    Random random = new Random();
    int one = random.nextInt(1200);
    int two = random.nextInt(1200);
    int three = random.nextInt(1200);
    int four = random.nextInt(1200);
    int five = random.nextInt(1200);
    while (all[three].length == 6 || all[four].length == 6 || all[five].length == 6 || one==two || one==three || one == four || one==five || two==three || two==four||two==five||three==four||three==five||four==five) {
      one = random.nextInt(1200);
      two = random.nextInt(1200);
      three = random.nextInt(1200);
      four = random.nextInt(1200);
      five = random.nextInt(1200);
    }
    words[0] = all[one].toUpperCase();
    words[1] = all[two].toUpperCase();
    words[2] = all[three].toUpperCase();
    words[3] = all[four].toUpperCase();
    words[4] = all[five].toUpperCase();
  }

  Color random_Color(){
    Random random = new Random();
    selected_color=colors[random.nextInt(4)];
    return selected_color;
  }

//Timer

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this,
        duration: Duration(
            seconds:
            levelClock)
    );

    _controller.forward();
  }
}
class Countdown extends AnimatedWidget {
  Countdown({Key key, this.animation}) : super(key: key, listenable: animation);
  Animation<int> animation;

  @override
  build(BuildContext context) {
    Duration clockTimer = Duration(seconds: animation.value);

    String timerText =
        '${clockTimer.inMinutes.remainder(60).toString()}:${clockTimer.inSeconds.remainder(60).toString().padLeft(2, '0')}';

    print('animation.value  ${animation.value} ');
    print('inMinutes ${clockTimer.inMinutes.toString()}');
    print('inSeconds ${clockTimer.inSeconds.toString()}');
    print('inSeconds.remainder ${clockTimer.inSeconds.remainder(60).toString()}');

    return Text(
      "$timerText",
      style: TextStyle(
        fontSize: MediaQuery.of(context).size.height/25,
        color: Colors.white,
      ),
    );
  }
}

class DrawingPainter extends CustomPainter {

  DrawingPainter({this.pointsList});
  List<DrawingPoints> pointsList;
  List<Offset> offsetPoints = List();

  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < pointsList.length; i++) {
      if (pointsList[i].first) {
        if (pointsList.length - 1 == i) {
          canvas.drawCircle(pointsList[i].points, size.height / 37.5, pointsList[i].paint);
        }
      } else {
        if (pointsList[i - 1].points.dx == pointsList[i].points.dx
            && pointsList[i - 1].points.dy > pointsList[i].points.dy) {
          canvas.drawLine(pointsList[i - 1].points, pointsList[i].points,
              pointsList[i].paint);
          canvas.drawArc(
            Rect.fromCenter(
              center: pointsList[i - 1].points,
              height: size.height / 18.75,
              width: size.height / 18.75,),
            0,
            3.1415926535897932,
            true,
            pointsList[i].paint,
          );
          canvas.drawArc(
            Rect.fromCenter(
              center: pointsList[i].points,
              height: size.height / 18.75,
              width: size.height / 18.75,),
            3.1415926535897932,
            3.1415926535897932,
            true,
            pointsList[i].paint,
          );
        } else if (pointsList[i - 1].points.dx == pointsList[i].points.dx
            && pointsList[i - 1].points.dy < pointsList[i].points.dy) {
          canvas.drawLine(pointsList[i - 1].points, pointsList[i].points,
              pointsList[i].paint);
          canvas.drawArc(
            Rect.fromCenter(
              center: pointsList[i - 1].points,
              height: size.height / 18.75,
              width: size.height / 18.75,),
            3.1415926535897932,
            3.1415926535897932,
            true,
            pointsList[i].paint,
          );
          canvas.drawArc(
            Rect.fromCenter(
              center: pointsList[i].points,
              height: size.height / 18.75,
              width: size.height / 18.75,),
            0,
            3.1415926535897932,
            true,
            pointsList[i].paint,
          );
        } else if (pointsList[i - 1].points.dx > pointsList[i].points.dx
            && pointsList[i - 1].points.dy == pointsList[i].points.dy) {
          canvas.drawLine(pointsList[i - 1].points, pointsList[i].points,
              pointsList[i].paint);
          canvas.drawArc(
            Rect.fromCenter(
              center: pointsList[i - 1].points,
              height: size.height / 18.75,
              width: size.height / 18.75,),
            3.1415926535897932 * 3 / 2,
            3.1415926535897932,
            true,
            pointsList[i].paint,
          );
          canvas.drawArc(
            Rect.fromCenter(
              center: pointsList[i].points,
              height: size.height / 18.75,
              width: size.height / 18.75,),
            3.1415926535897932 / 2,
            3.1415926535897932,
            true,
            pointsList[i].paint,
          );
        } else if (pointsList[i - 1].points.dx < pointsList[i].points.dx
            && pointsList[i - 1].points.dy == pointsList[i].points.dy) {
          canvas.drawLine(pointsList[i - 1].points, pointsList[i].points,
              pointsList[i].paint);
          canvas.drawArc(
            Rect.fromCenter(
              center: pointsList[i - 1].points,
              height: size.height / 18.75,
              width: size.height / 18.75,),
            3.1415926535897932 / 2,
            3.1415926535897932,
            true,
            pointsList[i].paint,
          );
          canvas.drawArc(
            Rect.fromCenter(
              center: pointsList[i].points,
              height: size.height / 18.75,
              width: size.height / 18.75,),
            3.1415926535897932 * 3 / 2,
            3.1415926535897932,
            true,
            pointsList[i].paint,
          );
        } else if (pointsList[i - 1].points.dx == pointsList[i].points.dx
            && pointsList[i - 1].points.dy > pointsList[i].points.dy) {
          canvas.drawLine(pointsList[i - 1].points, pointsList[i].points,
              pointsList[i].paint);
          canvas.drawArc(
            Rect.fromCenter(
              center: pointsList[i - 1].points,
              height: size.height / 18.75,
              width: size.height / 18.75,),
            0,
            3.1415926535897932,
            true,
            pointsList[i].paint,
          );
          canvas.drawArc(
            Rect.fromCenter(
              center: pointsList[i].points,
              height: size.height / 18.75,
              width: size.height / 18.75,),
            3.1415926535897932,
            3.1415926535897932,
            true,
            pointsList[i].paint,
          );
        } else if (pointsList[i - 1].points.dx == pointsList[i].points.dx
            && pointsList[i - 1].points.dy < pointsList[i].points.dy) {
          canvas.drawLine(pointsList[i - 1].points, pointsList[i].points,
              pointsList[i].paint);
          canvas.drawArc(
            Rect.fromCenter(
              center: pointsList[i - 1].points,
              height: size.height / 18.75,
              width: size.height / 18.75,),
            3.1415926535897932,
            3.1415926535897932,
            true,
            pointsList[i].paint,
          );
          canvas.drawArc(
            Rect.fromCenter(
              center: pointsList[i].points,
              height: size.height / 18.75,
              width: size.height / 18.75,),
            0,
            3.1415926535897932,
            true,
            pointsList[i].paint,
          );
        } else if (pointsList[i - 1].points.dx > pointsList[i].points.dx
            && pointsList[i - 1].points.dy == pointsList[i].points.dy) {
          canvas.drawLine(pointsList[i - 1].points, pointsList[i].points,
              pointsList[i].paint);
          canvas.drawArc(
            Rect.fromCenter(
              center: pointsList[i - 1].points,
              height: size.height / 18.75,
              width: size.height / 18.75,),
            3.1415926535897932 * 3 / 2,
            3.1415926535897932,
            true,
            pointsList[i].paint,
          );
          canvas.drawArc(
            Rect.fromCenter(
              center: pointsList[i].points,
              height: size.height / 18.75,
              width: size.height / 18.75,),
            3.1415926535897932 / 2,
            3.1415926535897932,
            true,
            pointsList[i].paint,
          );
        } else if (pointsList[i - 1].points.dx < pointsList[i].points.dx
            && pointsList[i - 1].points.dy == pointsList[i].points.dy) {
          canvas.drawLine(pointsList[i - 1].points, pointsList[i].points,
              pointsList[i].paint);
          canvas.drawArc(
            Rect.fromCenter(
              center: pointsList[i - 1].points,
              height: size.height / 18.75,
              width: size.height / 18.75,),
            3.1415926535897932 / 2,
            3.1415926535897932,
            true,
            pointsList[i].paint,
          );
          canvas.drawArc(
            Rect.fromCenter(
              center: pointsList[i].points,
              height: size.height / 18.75,
              width: size.height / 18.75,),
            3.1415926535897932 * 3 / 2,
            3.1415926535897932,
            true,
            pointsList[i].paint,
          );
        } else {

          if (pointsList[i - 1].points.dx < pointsList[i].points.dx
              && pointsList[i - 1].points.dy < pointsList[i].points.dy) {
            canvas.drawLine(pointsList[i - 1].points, pointsList[i].points,
                pointsList[i].paint);
            canvas.drawArc(
              Rect.fromCenter(
                center: pointsList[i - 1].points,
                height: size.height / 18.75,
                width: size.height / 18.75,),
              3.1415926535897932 / 2+atan((pointsList[i].points.dy-pointsList[i-1].points.dy)/(pointsList[i].points.dx-pointsList[i-1].points.dx)),
              3.1415926535897932,
              true,
              pointsList[i].paint,
            );
            canvas.drawArc(
              Rect.fromCenter(
                center: pointsList[i].points,
                height: size.height / 18.75,
                width: size.height / 18.75,),
              -3.1415926535897932 / 2+atan((pointsList[i].points.dy-pointsList[i-1].points.dy)/(pointsList[i].points.dx-pointsList[i-1].points.dx)),
              3.1415926535897932,
              true,
              pointsList[i].paint,
            );
          } else if (pointsList[i - 1].points.dx < pointsList[i].points.dx
              && pointsList[i - 1].points.dy > pointsList[i].points.dy) {
            canvas.drawLine(pointsList[i - 1].points, pointsList[i].points,
                pointsList[i].paint);
            canvas.drawArc(
              Rect.fromCenter(
                center: pointsList[i - 1].points,
                height: size.height / 18.75,
                width: size.height / 18.75,),
              3.1415926535897932 / 2+atan((pointsList[i].points.dy-pointsList[i-1].points.dy)/(pointsList[i].points.dx-pointsList[i-1].points.dx)),
              3.1415926535897932,
              true,
              pointsList[i].paint,
            );
            canvas.drawArc(
              Rect.fromCenter(
                center: pointsList[i].points,
                height: size.height / 18.75,
                width: size.height / 18.75,),
              -3.1415926535897932 / 2+atan((pointsList[i].points.dy-pointsList[i-1].points.dy)/(pointsList[i].points.dx-pointsList[i-1].points.dx)),
              3.1415926535897932,
              true,
              pointsList[i].paint,
            );

          } else if (pointsList[i - 1].points.dx > pointsList[i].points.dx
              && pointsList[i - 1].points.dy< pointsList[i].points.dy) {
            canvas.drawLine(pointsList[i - 1].points, pointsList[i].points,
                pointsList[i].paint);
            canvas.drawArc(
              Rect.fromCenter(
                center: pointsList[i - 1].points,
                height: size.height / 18.75,
                width: size.height / 18.75,),
              -3.1415926535897932 / 2+atan((pointsList[i].points.dy-pointsList[i-1].points.dy)/(pointsList[i].points.dx-pointsList[i-1].points.dx)),
              3.1415926535897932,
              true,
              pointsList[i].paint,
            );
            canvas.drawArc(
              Rect.fromCenter(
                center: pointsList[i].points,
                height: size.height / 18.75,
                width: size.height / 18.75,),
              3.1415926535897932 / 2+atan((pointsList[i].points.dy-pointsList[i-1].points.dy)/(pointsList[i].points.dx-pointsList[i-1].points.dx)),
              3.1415926535897932,
              true,
              pointsList[i].paint,
            );

          } else if (pointsList[i - 1].points.dx > pointsList[i].points.dx
              && pointsList[i - 1].points.dy > pointsList[i].points.dy) {
            canvas.drawLine(pointsList[i - 1].points, pointsList[i].points,
                pointsList[i].paint);
            canvas.drawArc(
              Rect.fromCenter(
                center: pointsList[i - 1].points,
                height: size.height / 18.75,
                width: size.height / 18.75,),
              -3.1415926535897932 / 2+atan((pointsList[i].points.dy-pointsList[i-1].points.dy)/(pointsList[i].points.dx-pointsList[i-1].points.dx)),
              3.1415926535897932,
              true,
              pointsList[i].paint,
            );
            canvas.drawArc(
              Rect.fromCenter(
                center: pointsList[i].points,
                height: size.height / 18.75,
                width: size.height / 18.75,),
              3.1415926535897932 / 2+atan((pointsList[i].points.dy-pointsList[i-1].points.dy)/(pointsList[i].points.dx-pointsList[i-1].points.dx)),
              3.1415926535897932,
              true,
              pointsList[i].paint,
            );
          }

        }
      }
    }
  }
  @override
  bool shouldRepaint(DrawingPainter oldDelegate) => false;
}

class DrawingPoints {
  Paint paint;
  Offset points;
  bool first;
  DrawingPoints({this.points, this.paint, this.first});
}