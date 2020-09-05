import 'dart:io';
import 'dart:ui';
import 'dart:math';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:huntersofwords/utilites/colors.dart';
class Game_Easy extends StatefulWidget {

  @override
  _Game_EasyState createState() => _Game_EasyState();
}

class _Game_EasyState extends State<Game_Easy> with TickerProviderStateMixin {

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
  ];
  int count = -1;
  Random random = new Random();
  List<String> words = ['', '', '', '', ''];
  List<String> all = [
    'feed',
    'title',
    'faith',
    'river',
    'count',
    'marry',
    'path',
    'shop',
    'folk',
    'lift',
    'jump',
    'limit',
    'worth',
    'warm',
    'soft',
    'gift',
    'speed',
    'cross',
    'youth',
    'wave',
    'broad',
    'deny',
    'twice',
    'suit',
    'blow',
    'cook',
    'burn',
    'shoe',
    'grade',
    'quiet',
    'dress',
    'aware',
    'bone',
    'chief',
    'wine',
    'below',
    'cool',
    'voter',
    'hell',
    'moral',
    'tour',
    'photo',
    'grab',
    'daily',
    'fair',
    'pair',
    'knee',
    'tape',
    'hire',
    'fully',
    'actor',
    'birth',
    'clean',
    'train',
    'lady',
    'neck',
    'lean',
    'tall',
    'plate',
    'hate',
    'male',
    'alive',
    'army',
    'abuse',
    'shut',
    'extra',
    'lots',
    'rain',
    'paint',
    'fuel',
    'leaf',
    'pool',
    'climb',
    'sweet',
    'salt',
    'metal',
    'urban',
    'lunch',
    'sugar',
    'enemy',
    'soul',
    'panel',
    'bear',
    'thin',
    'poll',
    'sight',
    'adopt',
    'works',
    'okay',
    'empty',
    'trail',
    'novel',
    'code',
    'jury',
    'Iraqi',
    'theme',
    'storm',
    'union',
    'desk',
    'fruit',
    'prime',
    'dance',
    'being',
    'ring',
    'shift',
    'mark',
    'trend',
    'loan',
    'angry',
    'crew',
    'meal',
    'truly',
    'earth',
    'chest',
    'thick',
    'cash',
    'link',
    'root',
    'nose',
    'file',
    'sick',
    'duty',
    'sheet',
    'ought',
    'slow',
    'zone',
    'wake',
    'brown',
    'shirt',
    'pilot',
    'warn',
    'guide',
    'snow',
    'steal',
    'slip',
    'meat',
    'funny',
    'soil',
    'blame',
    'golf',
    'crazy',
    'chain',
    'user',
    'kick',
    'solve',
    'used',
    'bowl',
    'equal',
    'forth',
    'frame',
    'host',
    'hall',
    'trust',
    'ocean',
    'tooth',
    'smart',
    'rely',
    'topic',
    'debt',
    'rare',
    'tank',
    'nurse',
    'aside',
    'bond',
    'wing',
    'pour',
    'stir',
    'beer',
    'tear',
    'doubt',
    'grant',
    'hero',
    'cloud',
    'seed',
    'busy',
    'copy',
    'cheap',
    'cite',
    'gray',
    'dish',
    'beach',
    'route',
    'core',
    'upper',
    'rush',
    'tired',
    'vast',
    'fewer',
    'apart',
    'match',
    'proud',
    'flow',
    'waste',
    'mass',
    'bomb',
    'tone',
    'wheel',
    'cable',
    'rural',
    'AIDS',
    'cream',
    'gate',
    'solid',
    'hill',
    'noise',
    'grass',
    'taste',
    'milk',
    'cast',
    'sharp',
    'lower',
    'plus',
    'weak',
    'honor',
    'knock',
    'wrap',
    'asset',
    'bread',
    'lucky',
    'drag',
    'roof',
    'diet',
    'wash',
    'brief',
    'post',
    'steel',
    'shout',
    'chip',
    'self',
    'bike',
    'layer',
    'slide',
    'lake',
    'bend',
    'shall',
    'error',
    'Arab',
    'sand',
    'print',
    'album',
    'joint',
    'reply',
    'cycle',
    'lock',
    'pose',
    'sale',
    'grand',
    'mine',
    'hello',
    'tale',
    'knife',
    'phase',
    'joke',
    'coat',
    'quote',
    'urge',
    'dust',
    'elect',
    'glad',
    'pack',
    'iron',
    'gene',
    'sauce',
    'shock',
    'kiss',
    'habit',
    'juice',
    'boss',
    'entry',
    'king',
    'maker',
    'mood',
    'boot',
    'Asian',
    'bean',
    'usual',
    'anger',
    'peak',
    'vary',
    'wire',
    'round',
    'holy',
    'twin',
    'luck',
    'smell',
    'toss',
    'bury',
    'pray',
    'ally',
    'tower',
    'smoke',
    'pure',
    'peer',
    'belt',
    'coast',
    'flag',
    'corn',
    'moon',
    'inner',
    'swing',
    'crop',
    'mayor',
    'pink',
    'buck',
    'poem',
    'bind',
    'fifth',
    'favor',
    'weigh',
    'mail',
    'false',
    'tube',
    'quit',
    'Latin',
    'jail',
    'pace',
    'essay',
    'giant',
    'cake',
    'depth',
    'shell',
    'onion',
    'flat',
    'brand',
    'award',
    'arise',
    'armed',
    'wage',
    'stake',
    'fiber',
    'snap',
    'gear',
    'minor',
    'gang',
    'label',
    'teen',
    'index',
    'draft',
    'rough',
    'yell',
    'drama',
    'clock',
    'sweep',
    'spin',
    'bell',
    'rank',
    'super',
    'yield',
    'fence',
    'bunch',
    'found',
    'react',
    'cheek',
    'lost',
    'pant',
    'apple',
    'virus',
    'wipe',
    'blind',
    'port',
    'slave',
    'elite',
    'dirt',
    'rice',
    'tight',
    'Bible',
    'chart',
    'solar',
    'strip',
    'salad',
    'pause',
    'bench',
    'lover',
    'deck',
    'newly',
    'pole',
    'mode',
    'imply',
    'pride',
    'bake',
    'sink',
    'ideal',
    'crash',
    'craft',
    'swim',
    'tire',
    'fault',
    'loose',
    'prior',
    'relax',
    'stair',
    'proof',
    'dirty',
    'fade',
    'alter',
    'mask',
    'load',
    'deer',
    'split',
    'vital',
    'fate',
    'oven',
    'poet',
    'mere',
    'adapt',
    'Irish',
    'honey',
    'pale',
    'flee',
    'tribe',
    'shelf',
    'lawn',
    'buyer',
    'plot',
    'pipe',
    'math',
    'shade',
    'tail',
    'mount',
    'angle',
    'palm',
    'soup',
    'pile',
    'crack',
    'given',
    'trace',
    'meter',
    'rapid',
    'aide',
    'fifty',
    'porch',
    'mall',
    'heel',
    'rifle',
    'trick',
    'tent',
    'myth',
    'nerve',
    'ratio',
    'menu',
    'humor',
    'loud',
    'glove',
    'delay',
    'scope',
    'badly',
    'eager',
    'auto',
    'motor',
    'float',
    'blade',
    'cabin',
    'bite',
    'yours',
    'pitch',
    'pine',
    'chef',
    'boom',
    'shit',
    'lemon',
    'naked',
    'shrug',
    'cope',
    'flame',
    'wound',
    'flesh',
    'grain',
    'brush',
    'ease',
    'seize',
    'wise',
    'acid',
    'odds',
    'shore',
    'lung',
    'ugly',
    'ghost',
    'awful',
    'piano',
    'mouse',
    'rope',
    'chase',
    'brick',
    'patch',
    'sake',
    'gaze',
    'swear',
    'clue',
    'slice',
    'dear',
    'coal',
    'exact',
    'uncle',
    'sigh',
    'dare',
    'grave',
    'rose',
    'rail',
    'couch',
    'mess',
    'shine',
    'norm',
    'upset',
    'organ',
    'magic',
    'stem',
    'rape',
    'jeans',
    'hunt',
    'echo',
    'pill',
    'flour',
    'bare',
    'slope',
    'rent',
    'pump',
    'candy',
    'evil',
    'medal',
    'slam',
    'melt',
    'curve',
    'logic',
    'harsh',
    'greet',
    'march',
    'snake',
    'fold',
    'flash',
    'beef',
    'Islam',
    'Roman',
    'elbow',
    'duck',
    'dose',
    'plead',
    'sixth',
    'trunk',
    'rumor',
    'trap',
    'cloth',
    'lens',
    'lend',
    'plain',
    'fraud',
    'nail',
    'array',
    'burst',
    'cave',
    'herb',
    'flood',
    'arena',
    'drift',
    'drain',
    'hurry',
    'suck',
    'leap',
    'wrist',
    'pond',
    'guilt',
    'skirt',
    'dump',
    'hence',
    'limb',
    'tune',
    'harm',
    'horn',
    'await',
    'spill',
    'grace',
    'towel',
    'prize',
    'boost',
    'alarm',
    'grip',
    'weird',
    'sweat',
    'outer',
    'drunk',
    'chaos',
    'forty',
    'lobby',
    'trait',
    'beam',
    'thumb',
    'unity',
    'twist',
    'fork',
    'disk',
    'shame',
    'rebel',
    'fluid',
    'hook',
    'click',
    'exit',
    'carve',
    'belly',
    'scare',
    'ankle',
    'mild',
    'rider',
    'doll',
    'noon',
    'amid',
    'crawl',
    'donor',
    'hers',
    'jazz',
    'opera',
    'oral',
    'clerk',
    'fist',
    'bath',
    'laser',
    'bold',
    'hint',
    'realm',
    'blend',
    'peel',
    'pizza',
    'flip',
    'bias',
    'lamp',
    'chin',
    'chop',
    'civic',
    'silk',
    'steep',
    'alien',
    'scary',
    'angel',
    'rage',
    'dawn',
    'silly',
    'tide',
    'seal',
    'scan',
    'fool',
    'rear',
    'ranch',
    'cart',
    'elder',
    'Dutch',
    'mate',
    'Greek',
    'quest',
    'juror',
    'stiff',
    'slap',
    'toxic',
    'grief',
    'ours',
    'buddy',
    'barn',
    'sword',
    'glory',
    'tuck',
    'drum',
    'faint',
    'queen',
    'input',
    'sail',
    'nest',
    'lane',
    'steam',
    'unite',
    'cage',
    'equip',
    'rack',
    'wolf',
    'grin',
    'bless',
    'aunt',
    'bonus',
    'mixed',
    'orbit',
    'grasp',
    'spite',
    'calm',
    'haul',
    'wagon',
    'ruin',
    'sheer',
    'bush',
    'clip',
    'thigh',
    'bull',
    'sheep',
    'exam',
    'whale',
    'skull',
    'loop',
    'edit',
    'whip',
    'boil',
    'pork',
    'sock',
    'sexy',
    'spell',
    'booth',
    'waist',
    'lion',
    'royal',
    'panic',
    'crush',
    'cliff',
    'cord',
    'tumor',
    'pulse',
    'fixed',
    'diary',
    'irony',
    'spoon',
    'midst',
    'alley',
    'soap',
    'cute',
    'rival',
    'punch',
    'known',
    'purse',
    'shed',
    'icon',
    'cheat',
    'heal',
    'fever',
    'coin',
    'dried',
    'shove',
    'stove',
    'alike',
    'dough',
    'trash',
    'gross',
    'damn',
    'spray',
    'beast',
    'shark',
    'mill',
    'fleet',
    'debut',
    'hike',
    'scent',
    'stack',
    'sack',
    'cease',
    'tray',
    'nasty',
    'wheat',
    'aisle',
    'vocal',
    'risky',
    'pasta',
    'genre',
    'merit',
    'chunk',
    'coup',
    'skip',
    'robot',
    'boast',
    'sole',
    'weed',
    'added',
    'deem',
    'sneak',
    'blank',
    'cure',
    'have',
    'that',
    'with',
    'this',
    'they',
    'from',
    'what',
    'their',
    'would',
    'make',
    'about',
    'know',
    'will',
    'time',
    'there',
    'year',
    'think',
    'when',
    'which',
    'them',
    'some',
    'take',
    'into',
    'just',
    'your',
    'come',
    'could',
    'than',
    'like',
    'other',
    'then',
    'more',
    'these',
    'want',
    'look',
    'first',
    'also',
    'find',
    'here',
    'thing',
    'give',
    'many',
    'well',
    'only',
    'those',
    'tell',
    'very',
    'even',
    'back',
    'good',
    'woman',
    'life',
    'child',
    'work',
    'down',
    'after',
    'call',
    'world',
    'over',
    'still',
    'last',
    'need',
    'feel',
    'three',
    'state',
    'never',
    'high',
    'most',
    'much',
    'leave',
    'while',
    'mean',
    'keep',
    'great',
    'same',
    'group',
    'begin',
    'seem',
    'help',
    'talk',
    'where',
    'turn',
    'every',
    'start',
    'hand',
    'might',
    'show',
    'part',
    'place',
    'such',
    'again',
    'case',
    'week',
    'each',
    'right',
    'hear',
    'play',
    'small',
    'move',
    'night',
    'live',
    'point',
    'hold',
    'today',
    'bring',
    'next',
    'large',
    'must',
    'home',
    'under',
    'water',
    'room',
    'write',
    'area',
    'money',
    'story',
    'young',
    'fact',
    'month',
    'study',
    'book',
    'word',
    'issue',
    'side',
    'kind',
    'four',
    'head',
    'black',
    'long',
    'both',
    'house',
    'since',
    'away',
    'until',
    'power',
    'hour',
    'game',
    'often',
    'line',
    'among',
    'ever',
    'stand',
    'lose',
    'meet',
    'city',
    'later',
    'name',
    'five',
    'once',
    'white',
    'least',
    'learn',
    'real',
    'team',
    'best',
    'idea',
    'body',
    'lead',
    'watch',
    'stop',
    'face',
    'speak',
    'read',
    'level',
    'allow',
    'spend',
    'door',
    'sure',
    'party',
    'grow',
    'open',
    'walk',
    'girl',
    'early',
    'food',
    'force',
    'offer',
    'foot',
    'maybe',
    'able',
    'love',
    'music',
    'human',
    'wait',
    'serve',
    'send',
    'sense',
    'build',
    'stay',
    'fall',
    'plan',
    'death',
    'reach',
    'local',
    'kill',
    'yeah',
    'class',
    'raise',
    'care',
    'late',
    'hard',
    'field',
    'else',
    'pass',
    'sell',
    'major',
    'along',
    'role',
    'rate',
    'heart',
    'drug',
    'light',
    'voice',
    'wife',
    'whole',
    'mind',
    'pull',
    'free',
    'price',
    'less',
    'hope',
    'view',
    'carry',
    'town',
    'road',
    'drive',
    'true',
    'break',
    'thank',
    'value',
    'full',
    'model',
    'join',
    'agree',
    'pick',
    'wear',
    'paper',
    'space',
    'form',
    'event',
    'whose',
    'site',
    'base',
    'star',
    'table',
    'court',
    'teach',
    'half',
    'easy',
    'cost',
    'image',
    'phone',
    'data',
    'cover',
    'quite',
    'clear',
    'piece',
    'land',
    'wall',
    'news',
    'test',
    'movie',
    'north',
    'third',
    'catch',
    'step',
    'baby',
    'type',
    'draw',
    'film',
    'tree',
    'cause',
    'hair',
    'soon',
    'plant',
    'term',
    'short',
    'rule',
    'south',
    'floor',
    'close',
    'risk',
    'fire',
    'wrong',
    'bank',
    'west',
    'sport',
    'board',
    'seek',
    'rest',
    'deal',
    'fight',
    'throw',
    'past',
    'goal',
    'order',
    'fill',
    'focus',
    'drop',
    'blood',
    'upon',
    'push',
    'color',
    'store',
    'sound',
    'note',
    'fine',
    'near',
    'page',
    'enter',
    'share',
    'poor',
    'race',
    'dead',
    'rise',
    'shoot',
    'east',
    'save',
    'seven',
    'scene',
    'stock',
    'eight',
    'thus',
    'happy',
    'size',
    'fund',
    'occur',
    'media',
    'ready',
    'sign',
    'list',
    'left',
    'argue',
    'staff',
    'loss',
    'trade',
    'bill',
    'fail',
    'glass',
    'skill',
    'crime',
    'stage',
    'miss',
    'sort',
    'blue',
    'truth',
    'song',
    'check',
    'dark',
    'laugh',
    'guess',
    'prove',
    'hang',
    'rock',
    'claim',
    'enjoy',
    'legal',
    'cold',
    'final',
    'main',
    'white',
    'card',
    'above',
    'seat',
    'cell',
    'nice',
    'trial',
    'firm',
    'radio',
    'visit',
    'avoid',
    'huge',
    'ball',
    'onto',
    'peace',
    'pain',
    'apply',
    'wide',
    'shake',
    'chair',
    'fish',
    'treat',
    'trip',
    'unit',
    'style',
    'adult',
    'worry',
    'range',
    'deep',
    'edge',
    'fear',
    'dream',
    'stuff',
    'hotel',
    'heavy',
    'heat',
    'tough',
    'sing',
    'exist',
    'whom',
    'skin',
    'agent',
    'owner',
    'ahead',
    'item',
    'coach',
    'yard',
    'beat',
    'total',
    'tend',
    'task',
    'civil',
    'shot',
    'wish',
    'safe',
    'mouth',
    'smile',
    'score',
    'rich',
    'vote',
    'none',
    'front',
    'born',
    'admit',
    'wind',
    'fast',
    'alone',
    'fresh',
    'video',
    'judge',
    'bird',
    'stare',
    'troop',
    'hurt',
    'track',
    'basic',
    'plane',
    'labor',
    'refer',
    'nine',
    'touch',
    'sleep',
    'press',
    'camp',
    'brain',
    'dozen',
    'date',
    'sorry',
    'stick',
    'hole',
    'ship',
    'stone',
    'scale',
    'park',
    'spot',
    'lack',
    'boat',
    'drink',
    'wood',
    'truck',
    'sales',
    'roll',
    'gain',
    'hide',
    'gold',
    'club',
    'farm',
    'shape',
    'crowd',
    'band',
    'horse',
    'ride',
    'guard',
    'terms',
    'text',
    'tool',
    'wild',
    'quick',
    'earn',
    'pound',
    'basis',
    'guest',
    'tiny',
    'block',
  ];
//Paint
  Color selected_color;
  bool old_Puzzle=false;
  List<bool> is_Selected_Container=[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false];
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

                    },
                    onPanStart: (details) {
                      RenderBox box = context.findRenderObject();
                      final Offset local = box.globalToLocal(details.globalPosition);


                          puzzle[0]=local.dx.toString();
                          puzzle[8]=local.dy.toString();
                          puzzle[16]=(MediaQuery.of(context).size.width/19.63).toString();
                          puzzle[24]=(MediaQuery.of(context).size.height/2.92).toString();

                            for(int row =0; row<8;row++) {
                              for (int column = 0; column < 8; column++) {
                                if (local.dx>MediaQuery.of(context).size.width/20+column*MediaQuery.of(context).size.width/8.8&&local.dx<18+(column+1)*MediaQuery.of(context).size.width/8.8

                                && local.dy>MediaQuery.of(context).size.height/3.8+row*MediaQuery.of(context).size.height/15 && local.dy<MediaQuery.of(context).size.height/3.8+(row+1)*MediaQuery.of(context).size.height/15) {
                                  setState(() {
                                    is_Selected_Container[8 * row + column] =
                                    true;
                                    old_Puzzle = true;
                                    count = -1;
                                  });
                                }
                              }
                            }

    /* Testing gesture
                          puzzle[0]=local.dx.toString();
                          puzzle[8]=local.dy.toString();
                          puzzle[16]=(MediaQuery.of(context).size.width/19.63).toString();
                          puzzle[24]=(MediaQuery.of(context).size.height/2.92).toString();
                        */

                    },
                    onPanEnd: (details) {

                    },

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
                            Text('LEVEL: EASY',
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
                        child: Table(
                          children: [
                            TableRow(
                              children: [
                                Container(
                                  width:  MediaQuery
                                      .of(context)
                                      .size
                                      .width/10*1.1,
                                  height:  MediaQuery
                                      .of(context)
                                      .size
                                      .height /15,
                                  alignment: Alignment.center,
                                  child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),style:TextStyle(fontSize: MediaQuery.of(context).size.height/35)) : Text(write_Puzzle_Letter() ,style:TextStyle(fontSize: MediaQuery.of(context).size.height/35)),
                                  decoration: BoxDecoration(
                                    color: is_Selected_Container[0] ? random_Color() : Colors.white,
                                    
                                  ),
                                ),
                                Container(
                                  width:  MediaQuery
                                      .of(context)
                                      .size
                                      .width/10*1.1,
                                  height:  MediaQuery
                                      .of(context)
                                      .size
                                      .height /15,
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
                                  decoration: BoxDecoration(
                                    color: is_Selected_Container[1] ? random_Color() : Colors.white,
                                    
                                  ),
                                ),
                                Container(
                                  width:  MediaQuery
                                      .of(context)
                                      .size
                                      .width/10*1.1,
                                  height:  MediaQuery
                                      .of(context)
                                      .size
                                      .height /15,
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
                                  decoration: BoxDecoration(
                                    color: is_Selected_Container[2] ? random_Color() : Colors.white,
                                    
                                  ),
                                ),
                                Container(
                                  width:  MediaQuery
                                      .of(context)
                                      .size
                                      .width/10*1.1,
                                  height:  MediaQuery
                                      .of(context)
                                      .size
                                      .height /15,
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
                                  decoration: BoxDecoration(
                                    color: is_Selected_Container[3] ? random_Color() : Colors.white,
                                    
                                  ),
                                ),
                                Container(
                                  width:  MediaQuery
                                      .of(context)
                                      .size
                                      .width/10*1.1,
                                  height:  MediaQuery
                                      .of(context)
                                      .size
                                      .height /15,
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
                                  decoration: BoxDecoration(
                                    color: is_Selected_Container[4] ? random_Color() : Colors.white,
                                    
                                  ),
                                ),
                                Container(
                                  width:  MediaQuery
                                      .of(context)
                                      .size
                                      .width/10*1.1,
                                  height:  MediaQuery
                                      .of(context)
                                      .size
                                      .height /15,
                                  alignment: Alignment.center,
                                  child:
                                  old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) :
                                  Text(write_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) ,
                                  decoration: BoxDecoration(
                                    color: is_Selected_Container[5] ? random_Color() : Colors.white,
                                    
                                  ),
                                ),
                                Container(
                                  width:  MediaQuery
                                      .of(context)
                                      .size
                                      .width/10*1.1,
                                  height:  MediaQuery
                                      .of(context)
                                      .size
                                      .height /15,
                                  alignment: Alignment.center,
                                  child:
                                  old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) :
                                  Text(write_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) ,
                                  decoration: BoxDecoration(
                                    color: is_Selected_Container[6] ? random_Color() : Colors.white,
                                    
                                  ),
                                ),
                                Container(
                                  width:  MediaQuery
                                      .of(context)
                                      .size
                                      .width/10*1.1,
                                  height:  MediaQuery
                                      .of(context)
                                      .size
                                      .height /15,
                                  alignment: Alignment.center,
                                  child:
                                  old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) :
                                  Text(write_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) ,
                                  decoration: BoxDecoration(
                                    color: is_Selected_Container[7] ? random_Color() : Colors.white,

                                  ),
                                ),
                              ],
                            ),

                            TableRow(
                              children: [
                                Container(
                                  width:  MediaQuery
                                      .of(context)
                                      .size
                                .width/10*1.1,
                                  height:  MediaQuery
                                      .of(context)
                                      .size
                                      .height /15,
                                  alignment: Alignment.center,
                                  child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),style:TextStyle(fontSize: MediaQuery.of(context).size.height/35)) : Text(write_Puzzle_Letter() ,style:TextStyle(fontSize: MediaQuery.of(context).size.height/35)),
                                  decoration: BoxDecoration(
                                    color: is_Selected_Container[8] ? random_Color() : Colors.white,

                                  ),
                                ),
                                Container(
                                  width:  MediaQuery
                                      .of(context)
                                      .size
                                      .width/10*1.1,
                                  height:  MediaQuery
                                      .of(context)
                                      .size
                                      .height /15,
                                  alignment: Alignment.center,
                                  child:
                                  old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) :
                                  Text(write_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) ,
                                  decoration: BoxDecoration(
                                    color: is_Selected_Container[9] ? random_Color() : Colors.white,

                                  ),
                                ),
                                Container(
                                  width:  MediaQuery
                                      .of(context)
                                      .size
                                      .width/10*1.1,
                                  height:  MediaQuery
                                      .of(context)
                                      .size
                                      .height /15,
                                  alignment: Alignment.center,
                                  child:
                                  old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) :
                                  Text(write_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) ,
                                  decoration: BoxDecoration(
                                    color: is_Selected_Container[10] ? random_Color() : Colors.white,

                                  ),
                                ),
                                Container(
                                  width:  MediaQuery
                                      .of(context)
                                      .size
                                      .width/10*1.1,
                                  height:  MediaQuery
                                      .of(context)
                                      .size
                                      .height /15,
                                  alignment: Alignment.center,
                                  child:
                                  old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) :
                                  Text(write_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) ,
                                  decoration: BoxDecoration(
                                    color: is_Selected_Container[11] ? random_Color() : Colors.white,

                                  ),
                                ),
                                Container(
                                  width:  MediaQuery
                                      .of(context)
                                      .size
                                      .width/10*1.1,
                                  height:  MediaQuery
                                      .of(context)
                                      .size
                                      .height /15,
                                  alignment: Alignment.center,
                                  child:
                                  old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) :
                                  Text(write_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) ,
                                  decoration: BoxDecoration(
                                    color: is_Selected_Container[12] ? random_Color() : Colors.white,

                                  ),
                                ),
                                Container(
                                  width:  MediaQuery
                                      .of(context)
                                      .size
                                      .width/10*1.1,
                                  height:  MediaQuery
                                      .of(context)
                                      .size
                                      .height /15,
                                  alignment: Alignment.center,
                                  child:
                                  old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) :
                                  Text(write_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) ,
                                  decoration: BoxDecoration(
                                    color: is_Selected_Container[13] ? random_Color() : Colors.white,

                                  ),
                                ),
                                Container(
                                  width:  MediaQuery
                                      .of(context)
                                      .size
                                      .width/10*1.1,
                                  height:  MediaQuery
                                      .of(context)
                                      .size
                                      .height /15,
                                  alignment: Alignment.center,
                                  child:
                                  old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) :
                                  Text(write_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) ,
                                  decoration: BoxDecoration(
                                    color: is_Selected_Container[14] ? random_Color() : Colors.white,

                                  ),
                                ),
                                Container(
                                  width:  MediaQuery
                                      .of(context)
                                      .size
                                      .width/10*1.1,
                                  height:  MediaQuery
                                      .of(context)
                                      .size
                                      .height /15,
                                  alignment: Alignment.center,
                                  child:
                                  old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) :
                                  Text(write_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) ,
                                  decoration: BoxDecoration(
                                    color: is_Selected_Container[15] ? random_Color() : Colors.white,

                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                Container(
                                  width:  MediaQuery
                                      .of(context)
                                      .size
                                      .width/10*1.1,
                                  height:  MediaQuery
                                      .of(context)
                                      .size
                                      .height /15,
                                  alignment: Alignment.center,
                                  child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),style:TextStyle(fontSize: MediaQuery.of(context).size.height/35)) : Text(write_Puzzle_Letter() ,style:TextStyle(fontSize: MediaQuery.of(context).size.height/35)),
                                  decoration: BoxDecoration(
                                    color: is_Selected_Container[16] ? random_Color() : Colors.white,

                                  ),
                                ),
                                Container(
                                  width:  MediaQuery
                                      .of(context)
                                      .size
                                      .width/10*1.1,
                                  height:  MediaQuery
                                      .of(context)
                                      .size
                                      .height /15,
                                  alignment: Alignment.center,
                                  child:
                                  old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) :
                                  Text(write_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) ,
                                  decoration: BoxDecoration(
                                    color: is_Selected_Container[17] ? random_Color() : Colors.white,

                                  ),
                                ),
                                Container(
                                  width:  MediaQuery
                                      .of(context)
                                      .size
                                      .width/10*1.1,
                                  height:  MediaQuery
                                      .of(context)
                                      .size
                                      .height /15,
                                  alignment: Alignment.center,
                                  child:
                                  old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) :
                                  Text(write_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) ,
                                  decoration: BoxDecoration(
                                    color: is_Selected_Container[18] ? random_Color() : Colors.white,

                                  ),
                                ),
                                Container(
                                  width:  MediaQuery
                                      .of(context)
                                      .size
                                      .width/10*1.1,
                                  height:  MediaQuery
                                      .of(context)
                                      .size
                                      .height /15,
                                  alignment: Alignment.center,
                                  child:
                                  old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) :
                                  Text(write_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) ,
                                  decoration: BoxDecoration(
                                    color: is_Selected_Container[19] ? random_Color() : Colors.white,

                                  ),
                                ),
                                Container(
                                  width:  MediaQuery
                                      .of(context)
                                      .size
                                      .width/10*1.1,
                                  height:  MediaQuery
                                      .of(context)
                                      .size
                                      .height /15,
                                  alignment: Alignment.center,
                                  child:
                                  old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) :
                                  Text(write_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) ,
                                  decoration: BoxDecoration(
                                    color: is_Selected_Container[20] ? random_Color() : Colors.white,

                                  ),
                                ),
                                Container(
                                  width:  MediaQuery
                                      .of(context)
                                      .size
                                      .width/10*1.1,
                                  height:  MediaQuery
                                      .of(context)
                                      .size
                                      .height /15,
                                  alignment: Alignment.center,
                                  child:
                                  old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) :
                                  Text(write_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) ,
                                  decoration: BoxDecoration(
                                    color: is_Selected_Container[21] ? random_Color() : Colors.white,

                                  ),
                                ),
                                Container(
                                  width:  MediaQuery
                                      .of(context)
                                      .size
                                      .width/10*1.1,
                                  height:  MediaQuery
                                      .of(context)
                                      .size
                                      .height /15,
                                  alignment: Alignment.center,
                                  child:
                                  old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) :
                                  Text(write_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) ,
                                  decoration: BoxDecoration(
                                    color: is_Selected_Container[22] ? random_Color() : Colors.white,

                                  ),
                                ),
                                Container(
                                  width:  MediaQuery
                                      .of(context)
                                      .size
                                      .width/10*1.1,
                                  height:  MediaQuery
                                      .of(context)
                                      .size
                                      .height /15,
                                  alignment: Alignment.center,
                                  child:
                                  old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) :
                                  Text(write_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) ,
                                  decoration: BoxDecoration(
                                    color: is_Selected_Container[23] ? random_Color() : Colors.white,

                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                Container(
                                  width:  MediaQuery
                                      .of(context)
                                      .size
                                      .width/10*1.1,
                                  height:  MediaQuery
                                      .of(context)
                                      .size
                                      .height /15,
                                  alignment: Alignment.center,
                                  child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),style:TextStyle(fontSize: MediaQuery.of(context).size.height/35)) : Text(write_Puzzle_Letter() ,style:TextStyle(fontSize: MediaQuery.of(context).size.height/35)),
                                  decoration: BoxDecoration(
                                    color: is_Selected_Container[24] ? random_Color() : Colors.white,

                                  ),
                                ),
                                Container(
                                  width:  MediaQuery
                                      .of(context)
                                      .size
                                      .width/10*1.1,
                                  height:  MediaQuery
                                      .of(context)
                                      .size
                                      .height /15,
                                  alignment: Alignment.center,
                                  child:
                                  old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) :
                                  Text(write_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) ,
                                  decoration: BoxDecoration(
                                    color: is_Selected_Container[25] ? random_Color() : Colors.white,

                                  ),
                                ),
                                Container(
                                  width:  MediaQuery
                                      .of(context)
                                      .size
                                      .width/10*1.1,
                                  height:  MediaQuery
                                      .of(context)
                                      .size
                                      .height /15,
                                  alignment: Alignment.center,
                                  child:
                                  old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) :
                                  Text(write_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) ,
                                  decoration: BoxDecoration(
                                    color: is_Selected_Container[26] ? random_Color() : Colors.white,

                                  ),
                                ),
                                Container(
                                  width:  MediaQuery
                                      .of(context)
                                      .size
                                      .width/10*1.1,
                                  height:  MediaQuery
                                      .of(context)
                                      .size
                                      .height /15,
                                  alignment: Alignment.center,
                                  child:
                                  old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) :
                                  Text(write_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) ,
                                  decoration: BoxDecoration(
                                    color: is_Selected_Container[27] ? random_Color() : Colors.white,

                                  ),
                                ),
                                Container(
                                  width:  MediaQuery
                                      .of(context)
                                      .size
                                      .width/10*1.1,
                                  height:  MediaQuery
                                      .of(context)
                                      .size
                                      .height /15,
                                  alignment: Alignment.center,
                                  child:
                                  old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) :
                                  Text(write_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) ,
                                  decoration: BoxDecoration(
                                    color: is_Selected_Container[28] ? random_Color() : Colors.white,

                                  ),
                                ),
                                Container(
                                  width:  MediaQuery
                                      .of(context)
                                      .size
                                      .width/10*1.1,
                                  height:  MediaQuery
                                      .of(context)
                                      .size
                                      .height /15,
                                  alignment: Alignment.center,
                                  child:
                                  old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) :
                                  Text(write_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) ,
                                  decoration: BoxDecoration(
                                    color: is_Selected_Container[29] ? random_Color() : Colors.white,

                                  ),
                                ),
                                Container(
                                  width:  MediaQuery
                                      .of(context)
                                      .size
                                      .width/10*1.1,
                                  height:  MediaQuery
                                      .of(context)
                                      .size
                                      .height /15,
                                  alignment: Alignment.center,
                                  child:
                                  old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) :
                                  Text(write_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) ,
                                  decoration: BoxDecoration(
                                    color: is_Selected_Container[30] ? random_Color() : Colors.white,

                                  ),
                                ),
                                Container(
                                  width:  MediaQuery
                                      .of(context)
                                      .size
                                      .width/10*1.1,
                                  height:  MediaQuery
                                      .of(context)
                                      .size
                                      .height /15,
                                  alignment: Alignment.center,
                                  child:
                                  old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) :
                                  Text(write_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) ,
                                  decoration: BoxDecoration(
                                    color: is_Selected_Container[31] ? random_Color() : Colors.white,

                                  ),
                                ),
                              ],
                            ),

                            TableRow(
                              children: [
                                Container(
                                  width:  MediaQuery
                                      .of(context)
                                      .size
                                      .width/10*1.1,
                                  height:  MediaQuery
                                      .of(context)
                                      .size
                                      .height /15,
                                  alignment: Alignment.center,
                                  child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),style:TextStyle(fontSize: MediaQuery.of(context).size.height/35)) : Text(write_Puzzle_Letter() ,style:TextStyle(fontSize: MediaQuery.of(context).size.height/35)),
                                  decoration: BoxDecoration(
                                    color: is_Selected_Container[32] ? random_Color() : Colors.white,

                                  ),
                                ),
                                Container(
                                  width:  MediaQuery
                                      .of(context)
                                      .size
                                      .width/10*1.1,
                                  height:  MediaQuery
                                      .of(context)
                                      .size
                                      .height /15,
                                  alignment: Alignment.center,
                                  child:
                                  old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) :
                                  Text(write_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) ,
                                  decoration: BoxDecoration(
                                    color: is_Selected_Container[33] ? random_Color() : Colors.white,

                                  ),
                                ),
                                Container(
                                  width:  MediaQuery
                                      .of(context)
                                      .size
                                      .width/10*1.1,
                                  height:  MediaQuery
                                      .of(context)
                                      .size
                                      .height /15,
                                  alignment: Alignment.center,
                                  child:
                                  old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) :
                                  Text(write_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) ,
                                  decoration: BoxDecoration(
                                    color: is_Selected_Container[34] ? random_Color() : Colors.white,

                                  ),
                                ),
                                Container(
                                  width:  MediaQuery
                                      .of(context)
                                      .size
                                      .width/10*1.1,
                                  height:  MediaQuery
                                      .of(context)
                                      .size
                                      .height /15,
                                  alignment: Alignment.center,
                                  child:
                                  old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) :
                                  Text(write_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) ,
                                  decoration: BoxDecoration(
                                    color: is_Selected_Container[35] ? random_Color() : Colors.white,

                                  ),
                                ),
                                Container(
                                  width:  MediaQuery
                                      .of(context)
                                      .size
                                      .width/10*1.1,
                                  height:  MediaQuery
                                      .of(context)
                                      .size
                                      .height /15,
                                  alignment: Alignment.center,
                                  child:
                                  old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) :
                                  Text(write_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) ,
                                  decoration: BoxDecoration(
                                    color: is_Selected_Container[36] ? random_Color() : Colors.white,

                                  ),
                                ),
                                Container(
                                  width:  MediaQuery
                                      .of(context)
                                      .size
                                      .width/10*1.1,
                                  height:  MediaQuery
                                      .of(context)
                                      .size
                                      .height /15,
                                  alignment: Alignment.center,
                                  child:
                                 old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) :
                                  Text(write_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) ,
                                  decoration: BoxDecoration(
                                    color: is_Selected_Container[37] ? random_Color() : Colors.white,

                                  ),
                                ),
                                Container(
                                  width:  MediaQuery
                                      .of(context)
                                      .size
                                      .width/10*1.1,
                                  height:  MediaQuery
                                      .of(context)
                                      .size
                                      .height /15,
                                  alignment: Alignment.center,
                                  child:
                                  old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) :
                                  Text(write_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) ,
                                  decoration: BoxDecoration(
                                    color: is_Selected_Container[38] ? random_Color() : Colors.white,

                                  ),
                                ),
                                Container(
                                  width:  MediaQuery
                                      .of(context)
                                      .size
                                      .width/10*1.1,
                                  height:  MediaQuery
                                      .of(context)
                                      .size
                                      .height /15,
                                  alignment: Alignment.center,
                                  child:
                                  old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) :
                                  Text(write_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) ,
                                  decoration: BoxDecoration(
                                    color: is_Selected_Container[39] ? random_Color() : Colors.white,

                                  ),
                                ),
                              ],
                            ),

                            TableRow(
                              children: [
                                Container(
                                  width:  MediaQuery
                                      .of(context)
                                      .size
                                      .width/10*1.1,
                                  height:  MediaQuery
                                      .of(context)
                                      .size
                                      .height /15,
                                  alignment: Alignment.center,
                                  child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),style:TextStyle(fontSize: MediaQuery.of(context).size.height/35)) : Text(write_Puzzle_Letter() ,style:TextStyle(fontSize: MediaQuery.of(context).size.height/35)),
                                  decoration: BoxDecoration(
                                    color: is_Selected_Container[40] ? random_Color() : Colors.white,

                                  ),
                                ),
                                Container(
                                  width:  MediaQuery
                                      .of(context)
                                      .size
                                      .width/10*1.1,
                                  height:  MediaQuery
                                      .of(context)
                                      .size
                                      .height /15,
                                  alignment: Alignment.center,
                                  child:
                                  old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) :
                                  Text(write_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) ,
                                  decoration: BoxDecoration(
                                    color: is_Selected_Container[41] ? random_Color() : Colors.white,

                                  ),
                                ),
                                Container(
                                  width:  MediaQuery
                                      .of(context)
                                      .size
                                      .width/10*1.1,
                                  height:  MediaQuery
                                      .of(context)
                                      .size
                                      .height /15,
                                  alignment: Alignment.center,
                                  child:
                                  old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) :
                                  Text(write_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) ,
                                  decoration: BoxDecoration(
                                    color: is_Selected_Container[42] ? random_Color() : Colors.white,

                                  ),
                                ),
                                Container(
                                  width:  MediaQuery
                                      .of(context)
                                      .size
                                      .width/10*1.1,
                                  height:  MediaQuery
                                      .of(context)
                                      .size
                                      .height /15,
                                  alignment: Alignment.center,
                                  child:
                                  old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) :
                                  Text(write_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) ,
                                  decoration: BoxDecoration(
                                    color: is_Selected_Container[43] ? random_Color() : Colors.white,

                                  ),
                                ),
                                Container(
                                  width:  MediaQuery
                                      .of(context)
                                      .size
                                      .width/10*1.1,
                                  height:  MediaQuery
                                      .of(context)
                                      .size
                                      .height /15,
                                  alignment: Alignment.center,
                                  child:
                                 old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) :
                                  Text(write_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) ,
                                  decoration: BoxDecoration(
                                    color: is_Selected_Container[44] ? random_Color() : Colors.white,

                                  ),
                                ),
                                Container(
                                  width:  MediaQuery
                                      .of(context)
                                      .size
                                      .width/10*1.1,
                                  height:  MediaQuery
                                      .of(context)
                                      .size
                                      .height /15,
                                  alignment: Alignment.center,
                                  child:
                                 old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) :
                                  Text(write_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) ,
                                  decoration: BoxDecoration(
                                    color: is_Selected_Container[45] ? random_Color() : Colors.white,

                                  ),
                                ),
                                Container(
                                  width:  MediaQuery
                                      .of(context)
                                      .size
                                      .width/10*1.1,
                                  height:  MediaQuery
                                      .of(context)
                                      .size
                                      .height /15,
                                  alignment: Alignment.center,
                                  child:
                                  old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) :
                                  Text(write_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) ,
                                  decoration: BoxDecoration(
                                    color: is_Selected_Container[46] ? random_Color() : Colors.white,

                                  ),
                                ),
                                Container(
                                  width:  MediaQuery
                                      .of(context)
                                      .size
                                      .width/10*1.1,
                                  height:  MediaQuery
                                      .of(context)
                                      .size
                                      .height /15,
                                  alignment: Alignment.center,
                                  child:
                                  old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) :
                                  Text(write_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) ,
                                  decoration: BoxDecoration(
                                    color: is_Selected_Container[47] ? random_Color() : Colors.white,

                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                Container(
                                  width:  MediaQuery
                                      .of(context)
                                      .size
                                      .width/10*1.1,
                                  height:  MediaQuery
                                      .of(context)
                                      .size
                                      .height /15,
                                  alignment: Alignment.center,
                                  child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),style:TextStyle(fontSize: MediaQuery.of(context).size.height/35)) : Text(write_Puzzle_Letter() ,style:TextStyle(fontSize: MediaQuery.of(context).size.height/35)),
                                  decoration: BoxDecoration(
                                    color: is_Selected_Container[48] ? random_Color() : Colors.white,

                                  ),
                                ),
                                Container(
                                  width:  MediaQuery
                                      .of(context)
                                      .size
                                      .width/10*1.1,
                                  height:  MediaQuery
                                      .of(context)
                                      .size
                                      .height /15,
                                  alignment: Alignment.center,
                                  child:
                                  old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) :
                                  Text(write_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) ,
                                  decoration: BoxDecoration(
                                    color: is_Selected_Container[49] ? random_Color() : Colors.white,

                                  ),
                                ),
                                Container(
                                  width:  MediaQuery
                                      .of(context)
                                      .size
                                      .width/10*1.1,
                                  height:  MediaQuery
                                      .of(context)
                                      .size
                                      .height /15,
                                  alignment: Alignment.center,
                                  child:
                                  old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) :
                                  Text(write_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) ,
                                  decoration: BoxDecoration(
                                    color: is_Selected_Container[50] ? random_Color() : Colors.white,

                                  ),
                                ),
                                Container(
                                  width:  MediaQuery
                                      .of(context)
                                      .size
                                      .width/10*1.1,
                                  height:  MediaQuery
                                      .of(context)
                                      .size
                                      .height /15,
                                  alignment: Alignment.center,
                                  child:
                                  old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) :
                                  Text(write_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) ,
                                  decoration: BoxDecoration(
                                    color: is_Selected_Container[51] ? random_Color() : Colors.white,

                                  ),
                                ),
                                Container(
                                  width:  MediaQuery
                                      .of(context)
                                      .size
                                      .width/10*1.1,
                                  height:  MediaQuery
                                      .of(context)
                                      .size
                                      .height /15,
                                  alignment: Alignment.center,
                                  child:
                                 old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) :
                                  Text(write_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) ,
                                  decoration: BoxDecoration(
                                    color: is_Selected_Container[52] ? random_Color() : Colors.white,

                                  ),
                                ),
                                Container(
                                  width:  MediaQuery
                                      .of(context)
                                      .size
                                      .width/10*1.1,
                                  height:  MediaQuery
                                      .of(context)
                                      .size
                                      .height /15,
                                  alignment: Alignment.center,
                                  child:
                                 old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) :
                                  Text(write_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) ,
                                  decoration: BoxDecoration(
                                    color: is_Selected_Container[53] ? random_Color() : Colors.white,

                                  ),
                                ),
                                Container(
                                  width:  MediaQuery
                                      .of(context)
                                      .size
                                      .width/10*1.1,
                                  height:  MediaQuery
                                      .of(context)
                                      .size
                                      .height /15,
                                  alignment: Alignment.center,
                                  child:
                                  old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) :
                                  Text(write_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) ,
                                  decoration: BoxDecoration(
                                    color: is_Selected_Container[54] ? random_Color() : Colors.white,

                                  ),
                                ),
                                Container(
                                  width:  MediaQuery
                                      .of(context)
                                      .size
                                      .width/10*1.1,
                                  height:  MediaQuery
                                      .of(context)
                                      .size
                                      .height /15,
                                  alignment: Alignment.center,
                                  child:
                                  old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) :
                                  Text(write_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) ,
                                  decoration: BoxDecoration(
                                    color: is_Selected_Container[55] ? random_Color() : Colors.white,

                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                Container(
                                  width:  MediaQuery
                                      .of(context)
                                      .size
                                      .width/10*1.1,
                                  height:  MediaQuery
                                      .of(context)
                                      .size
                                      .height /15,
                                  alignment: Alignment.center,
                                  child: old_Puzzle ?  Text(get_Old_Puzzle_Letter(),style:TextStyle(fontSize: MediaQuery.of(context).size.height/35)) : Text(write_Puzzle_Letter() ,style:TextStyle(fontSize: MediaQuery.of(context).size.height/35)),
                                  decoration: BoxDecoration(
                                    color: is_Selected_Container[56] ? random_Color() : Colors.white,

                                  ),
                                ),
                                Container(
                                  width:  MediaQuery
                                      .of(context)
                                      .size
                                        .width/10*1.1,
                                  height:  MediaQuery
                                      .of(context)
                                      .size
                                      .height /15,
                                  alignment: Alignment.center,
                                  child:
                                  old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) :
                                  Text(write_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) ,
                                  decoration: BoxDecoration(
                                    color: is_Selected_Container[57] ? random_Color() : Colors.white,

                                  ),
                                ),
                                Container(
                                  width:  MediaQuery
                                      .of(context)
                                      .size
                                      .width/10*1.1,
                                  height:  MediaQuery
                                      .of(context)
                                      .size
                                      .height /15,
                                  alignment: Alignment.center,
                                  child:
                                  old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) :
                                  Text(write_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) ,
                                  decoration: BoxDecoration(
                                    color: is_Selected_Container[58] ? random_Color() : Colors.white,

                                  ),
                                ),
                                Container(
                                  width:  MediaQuery
                                      .of(context)
                                      .size
                                             .width/10*1.1,
                                  height:  MediaQuery
                                      .of(context)
                                      .size
                                      .height /15,
                                  alignment: Alignment.center,
                                  child:
                                  old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) :
                                  Text(write_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) ,
                                  decoration: BoxDecoration(
                                    color: is_Selected_Container[59] ? random_Color() : Colors.white,

                                  ),
                                ),
                                Container(
                                  width:  MediaQuery
                                      .of(context)
                                      .size
                                    .width/10*1.1,
                                  height:  MediaQuery
                                      .of(context)
                                      .size
                                      .height /15,
                                  alignment: Alignment.center,
                                  child:
                                  old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) :
                                  Text(write_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) ,
                                  decoration: BoxDecoration(
                                    color: is_Selected_Container[60] ? random_Color() : Colors.white,

                                  ),
                                ),
                                Container(
                                  width:  MediaQuery
                                      .of(context)
                                      .size
        .width/10*1.1,
                                  height:  MediaQuery
                                      .of(context)
                                      .size
                                      .height /15,
                                  alignment: Alignment.center,
                                  child:
                                  old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) :
                                  Text(write_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) ,
                                  decoration: BoxDecoration(
                                    color: is_Selected_Container[61] ? random_Color() : Colors.white,

                                  ),
                                ),
                                Container(
                                  width:  MediaQuery
                                      .of(context)
                                      .size
        .width/10*1.1,
                                  height:  MediaQuery
                                      .of(context)
                                      .size
                                      .height /15,
                                  alignment: Alignment.center,
                                  child:
                                  old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) :
                                  Text(write_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) ,
                                  decoration: BoxDecoration(
                                    color: is_Selected_Container[62] ? random_Color() : Colors.white,

                                  ),
                                ),
                                Container(
                                  width:  MediaQuery
                                      .of(context)
                                      .size
        .width/10*1.1,
                                  height:  MediaQuery
                                      .of(context)
                                      .size
                                      .height /15,
                                  alignment: Alignment.center,
                                  child:
                                  old_Puzzle ?  Text(get_Old_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) :
                                  Text(write_Puzzle_Letter(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35),) ,
                                  decoration: BoxDecoration(
                                    color: is_Selected_Container[63] ? random_Color() : Colors.white,
                                    borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height/30) ,
                                  ),
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
                                Column(children:[
                                  Text(words[0] + ", " + words[1],
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 30,
                                        color:Colors.black),
                                  ),
                                ]
                                ),
                              ]
                              ),
                              TableRow( children:[
                                Column(children:[
                                  Text(words[2] + ", " + words[3],
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 30,
                                        color:Colors.black),
                                  ),
                      ]
                                ),
                              ]
                              ),

                              TableRow( children:[
                                Column(children:[
                                  Text(words[4] ,
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 30,
                                        color:Colors.black),
                                  ),
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
     for (int i = 0; i < 64; i++) {
       puzzle[i] = write_Random_Letter();
     }
     pick_Random_Words();
     write_Puzzle_Words(
         puzzle, words[0], words[1], words[2], words[3], words[4]);
     words.sort();
   }
 }
  String write_Puzzle_Letter() {
    create_Puzzle_Random();
    count++;
    if (count == 64) {
      count=0;
    }
      return puzzle[count];
  }
  String get_Old_Puzzle_Letter(){
    count++;
    if (count == 64) {
      count=0;
    }
    return puzzle[count];
  }

  write_Puzzle_Words(List<String> puzzle, String word_one, String word_two,
      String word_three, String word_four, String word_five) {
    Random random = new Random();
    // the row and column from the 'beginer of the words', rigth is positive and down is positive, later the word can be changed to reversed order so it makes more difficult the puzzle
    int row_one = random.nextInt(8);
    int row_two = random.nextInt(8);
    int row_three = random.nextInt(8 - word_three.length + 1);
    int row_four = random.nextInt(8 - word_four.length + 1);
    int row_five;
    int column_one = random.nextInt(8 - word_one.length + 1);
    int column_two = random.nextInt(8 - word_two.length + 1);
    int column_three = random.nextInt(8);
    int column_four = random.nextInt(8);
    int column_five;

    int direction_of_diagonal = random.nextInt(2);
    //  zero is SO, one is SE

    if (direction_of_diagonal == 0) {
      row_five = random.nextInt(8 - word_five.length + 1);
      column_five = random.nextInt(8 - word_five.length + 1);

      while (row_one == row_two || ((column_five >= column_one &&
          column_five <= column_one + word_one.length - 1 &&
          row_five <= row_one && row_five + word_five.length - 1 >= row_one) ||
          (column_five >= column_two &&
              column_five <= column_two + word_two.length - 1 &&
              row_five <= row_two &&
              row_five + word_five.length - 1 >= row_two))) {
        row_one = random.nextInt(8);
        row_two = random.nextInt(8);
      }

      while ((column_three >= column_one &&
          column_three <= column_one + word_one.length - 1 &&
          row_three <= row_one &&
          row_three + word_three.length - 1 >= row_one) ||
          (column_three >= column_two &&
              column_three <= column_two + word_two.length - 1 &&
              row_three <= row_two &&
              row_three + word_three.length - 1 >= row_two) ||
          (row_five >= row_three &&
              row_five <= row_three + word_three.length - 1 &&
              column_five <= column_three &&
              column_five + word_five.length - 1 >= column_three)) {
        column_three = random.nextInt(8);
        row_three = random.nextInt(8 - word_three.length + 1);
      }
      while ((column_four >= column_one &&
          column_four <= column_one + word_one.length - 1 &&
          row_four <= row_one && row_four + word_four.length - 1 >= row_one) ||
          (column_four >= column_two &&
              column_four <= column_two + word_two.length - 1 &&
              row_four <= row_two &&
              row_four + word_four.length - 1 >= row_two) ||
          (row_five >= row_four &&
              row_five <= row_four + word_four.length - 1 &&
              column_five <= column_four &&
              column_five + word_five.length - 1 >= column_four) ||
          column_four == column_three) {
        column_four = random.nextInt(8);
        row_four = random.nextInt(8 - word_three.length + 1);
      }
    } else {
      row_five = random.nextInt(8 - word_five.length + 1);
      column_five = 7 - random.nextInt(8 - word_five.length + 1);
      while (row_one == row_two || (column_five >= column_one &&
          column_five <= column_one + word_one.length - 1 &&
          row_five <= row_one && row_five - word_five.length + 1 >= row_one) ||
          (column_five >= column_two &&
              column_five <= column_two + word_two.length - 1 &&
              row_five <= row_two &&
              row_five - word_five.length + 1 >= row_two)) {
        row_one = random.nextInt(8);
        row_two = random.nextInt(8);
      }

      while ((column_three >= column_one &&
          column_three <= column_one + word_one.length - 1 &&
          row_three <= row_one &&
          row_three + word_three.length - 1 >= row_one) ||
          (column_three >= column_two &&
              column_three <= column_two + word_two.length - 1 &&
              row_three <= row_two &&
              row_three + word_three.length - 1 >= row_two) ||
          (row_five >= row_three &&
              row_five <= row_three + word_three.length - 1 &&
              column_five <= column_three &&
              column_five - word_five.length - 1 >= column_three)) {
        column_three = random.nextInt(8);
        row_three = random.nextInt(8 - word_three.length + 1);
      }
      while ((column_four >= column_one &&
          column_four <= column_one + word_one.length - 1 &&
          row_four <= row_one && row_four + word_four.length - 1 >= row_one) ||
          (column_four >= column_two &&
              column_four <= column_two + word_two.length - 1 &&
              row_four <= row_two &&
              row_four + word_four.length - 1 >= row_two) ||
          (column_four == column_three) ||
          (row_five >= row_four &&
              row_five <= row_four + word_four.length - 1 &&
              column_five <= column_four &&
              column_five + word_five.length - 1 >= column_four) ||
          column_four == column_three) {
        column_four = random.nextInt(8);
        row_four = random.nextInt(8 - word_three.length + 1);
      }
    }
    // now it just needs to write  the letters in the list string puzzle which in two possible ways original order or reverse order
    if (random.nextInt(2) == 0) {
      for (int i = 0; i < word_one.length; i++) {
        puzzle[row_one * 8 + i + column_one] = word_one[i];
      }
    } else {
      for (int i = 0; i < word_one.length; i++) {
        puzzle[row_one * 8 + i + column_one] =
        word_one[word_one.length - 1 - i];
      }
    }
    if (random.nextInt(2) == 0) {
      for (int i = 0; i < word_two.length; i++) {
        puzzle[row_two * 8 + i + column_two] = word_two[i];
      }
    } else {
      for (int i = 0; i < word_two.length; i++) {
        puzzle[row_two * 8 + i + column_two] =
        word_two[word_two.length - 1 - i];
      }
    }

    if (random.nextInt(2) == 0) {
      for (int i = 0; i < word_three.length; i++) {
        puzzle[(row_three + i) * 8 + column_three] = word_three[i];
      }
    } else {
      for (int i = 0; i < word_three.length; i++) {
        puzzle[(row_three + i) * 8 + column_three] =
        word_three[word_three.length - 1 - i];
      }
    }
    if (random.nextInt(2) == 0) {
      for (int i = 0; i < word_four.length; i++) {
        puzzle[(row_four + i) * 8 + column_four] = word_four[i];
      }
    } else {
      for (int i = 0; i < word_four.length; i++) {
        puzzle[(row_four + i) * 8 + column_four] =
        word_four[word_four.length - 1 - i];
      }
    }

    if (direction_of_diagonal == 0) {
      if (random.nextInt(2) == 0) {
        for (int i = 0; i < word_five.length; i++) {
          puzzle[(row_five + i) * 8 + column_five + i] = word_five[i];
        }
      } else {
        for (int i = 0; i < word_five.length; i++) {
          puzzle[(row_five + i) * 8 + column_five + i] =
          word_four[word_four.length - 1 - i];
        }
      }
    } else {
      if (random.nextInt(2) == 0) {
        for (int i = 0; i < word_five.length; i++) {
          puzzle[(row_five + i) * 8 + column_five - i] = word_five[i];
        }
      } else {
        for (int i = 0; i < word_five.length; i++) {
          puzzle[(row_five + i) * 8 + column_five - i] =
          word_four[word_four.length - 1 - i];
        }
      }
    }
  }

  pick_Random_Words() {
    Random random = new Random();
    int one = random.nextInt(1200);
    int two = random.nextInt(1200);
    int three = random.nextInt(1200);
    int four = random.nextInt(1200);
    int five = random.nextInt(1200);
    while (all[three].length == 5 || all[four].length == 5 || all[five].length == 5 || one==two || one==three || one == four || one==five || two==three || two==four||two==five||three==four||three==five||four==five) {
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
    return colors[random.nextInt(4)];
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
        '${clockTimer.inMinutes.remainder(80).toString()}:${clockTimer.inSeconds.remainder(80).toString().padLeft(2, '0')}';

    print('animation.value  ${animation.value} ');
    print('inMinutes ${clockTimer.inMinutes.toString()}');
    print('inSeconds ${clockTimer.inSeconds.toString()}');
    print('inSeconds.remainder ${clockTimer.inSeconds.remainder(80).toString()}');

    return Text(
      "$timerText",
      style: TextStyle(
        fontSize: MediaQuery.of(context).size.height/25,
        color: Colors.white,
      ),
    );
  }
}




