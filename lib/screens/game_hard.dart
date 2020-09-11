import 'dart:io';
import 'dart:ui';
import 'dart:math';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:huntersofwords/utilites/colors.dart';
import 'package:audioplayers/audio_cache.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
AudioCache audioPlayer = AudioCache();
class Game_Hard extends StatefulWidget {

  @override
  _Game_HardState createState() => _Game_HardState();
}

class _Game_HardState extends State<Game_Hard> with TickerProviderStateMixin {

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
    'people',
    'because',
    'through',
    'should',
    'school',
    'become',
    'between',
    'really',
    'another',
    'family',
    'student',
    'country',
    'problem',
    'against',
    'company',
    'system',
    'program',
    'during',
    'number',
    'always',
    'believe',
    'happen',
    'without',
    'before',
    'million',
    'mother',
    'though',
    'little',
    'provide',
    'service',
    'around',
    'friend',
    'father',
    'however',
    'member',
    'almost',
    'include',
    'change',
    'minute',
    'several',
    'nothing',
    'social',
    'whether',
    'follow',
    'parent',
    'create',
    'public',
    'already',
    'others',
    'office',
    'health',
    'person',
    'history',
    'within',
    'result',
    'morning',
    'reason',
    'moment',
    'himself',
    'teacher',
    'enough',
    'across',
    'second',
    'toward',
    'policy',
    'process',
    'appear',
    'market',
    'expect',
    'nation',
    'college',
    'course',
    'someone',
    'behind',
    'remain',
    'effect',
    'suggest',
    'control',
    'perhaps',
    'former',
    'require',
    'report',
    'better',
    'effort',
    'decide',
    'strong',
    'leader',
    'police',
    'finally',
    'return',
    'explain',
    'develop',
    'federal',
    'receive',
    'action',
    'season',
    'society',
    'player',
    'record',
    'special',
    'ground',
    'support',
    'matter',
    'center',
    'couple',
    'project',
    'produce',
    'figure',
    'street',
    'itself',
    'either',
    'picture',
    'recent',
    'product',
    'doctor',
    'patient',
    'worker',
    'certain',
    'simply',
    'source',
    'nearly',
    'choose',
    'century',
    'window',
    'listen',
    'culture',
    'billion',
    'chance',
    'brother',
    'energy',
    'period',
    'summer',
    'realize',
    'hundred',
    'likely',
    'letter',
    'choice',
    'single',
    'husband',
    'economy',
    'medical',
    'church',
    'current',
    'future',
    'involve',
    'defense',
    'anyone',
    'myself',
    'subject',
    'officer',
    'private',
    'quickly',
    'author',
    'foreign',
    'agency',
    'nature',
    'reduce',
    'common',
    'natural',
    'concern',
    'series',
    'similar',
    'usually',
    'animal',
    'factor',
    'decade',
    'article',
    'artist',
    'career',
    'despite',
    'central',
    'beyond',
    'exactly',
    'protect',
    'serious',
    'thought',
    'simple',
    'quality',
    'accept',
    'answer',
    'meeting',
    'prepare',
    'disease',
    'success',
    'amount',
    'ability',
    'growth',
    'degree',
    'wonder',
    'attack',
    'herself',
    'region',
    'pretty',
    'general',
    'feeling',
    'message',
    'outside',
    'arrive',
    'benefit',
    'forward',
    'lawyer',
    'present',
    'section',
    'sister',
    'compare',
    'design',
    'station',
    'clearly',
    'discuss',
    'indeed',
    'example',
    'various',
    'rather',
    'entire',
    'forget',
    'remove',
    'manager',
    'network',
    'science',
    'memory',
    'expert',
    'spring',
    'imagine',
    'tonight',
    'finish',
    'theory',
    'impact',
    'respond',
    'charge',
    'popular',
    'reveal',
    'weapon',
    'contain',
    'measure',
    'manage',
    'camera',
    'perform',
    'weight',
    'evening',
    'affect',
    'inside',
    'mention',
    'writer',
    'trouble',
    'middle',
    'instead',
    'improve',
    'detail',
    'method',
    'soldier',
    'reflect',
    'sexual',
    'surface',
    'purpose',
    'pattern',
    'machine',
    'address',
    'cancer',
    'reality',
    'finger',
    'garden',
    'notice',
    'modern',
    'partner',
    'kitchen',
    'budget',
    'capital',
    'victim',
    'threat',
    'account',
    'dinner',
    'western',
    'relate',
    'travel',
    'debate',
    'prevent',
    'citizen',
    'senior',
    'assume',
    'mission',
    'suffer',
    'speech',
    'option',
    'forest',
    'global',
    'Senate',
    'reform',
    'access',
    'publish',
    'release',
    'opinion',
    'credit',
    'corner',
    'recall',
    'version',
    'safety',
    'income',
    'species',
    'strike',
    'freedom',
    'nobody',
    'achieve',
    'object',
    'concept',
    'client',
    'perfect',
    'conduct',
    'examine',
    'please',
    'attend',
    'variety',
    'nuclear',
    'spirit',
    'replace',
    'British',
    'feature',
    'weekend',
    'battle',
    'African',
    'crisis',
    'define',
    'easily',
    'element',
    'vision',
    'status',
    'normal',
    'Chinese',
    'slowly',
    'driver',
    'attempt',
    'handle',
    'survey',
    'winter',
    'village',
    'Soviet',
    'refuse',
    'screen',
    'reader',
    'express',
    'willing',
    'target',
    'prison',
    'demand',
    'deliver',
    'vehicle',
    'observe',
    'flight',
    'average',
    'emerge',
    'bright',
    'operate',
    'sample',
    'settle',
    'collect',
    'highly',
    'mostly',
    'lesson',
    'promote',
    'living',
    'unless',
    'survive',
    'border',
    'gather',
    'critic',
    'aspect',
    'insist',
    'failure',
    'annual',
    'French',
    'comment',
    'affair',
    'regular',
    'spread',
    'ignore',
    'belief',
    'anybody',
    'murder',
    'review',
    'editor',
    'engage',
    'coffee',
    'anyway',
    'commit',
    'female',
    'afraid',
    'quarter',
    'native',
    'growing',
    'destroy',
    'context',
    'mistake',
    'clothes',
    'Indian',
    'promise',
    'active',
    'extend',
    'combine',
    'remind',
    'United',
    'victory',
    'healthy',
    'depend',
    'finding',
    'direct',
    'contact',
    'justice',
    'famous',
    'flower',
    'supply',
    'search',
    'eastern',
    'primary',
    'circle',
    'device',
    'bottom',
    'island',
    'studio',
    'damage',
    'plastic',
    'writing',
    'intend',
    'chicken',
    'theater',
    'session',
    'danger',
    'welcome',
    'desire',
    'injury',
    'respect',
    'Russian',
    'engine',
    'fourth',
    'expand',
    'ticket',
    'strange',
    'reading',
    'mental',
    'farmer',
    'planet',
    'explore',
    'obtain',
    'complex',
    'athlete',
    'invite',
    'repeat',
    'meaning',
    'married',
    'predict',
    'weather',
    'Supreme',
    'pocket',
    'breath',
    'balance',
    'connect',
    'belong',
    'advice',
    'somehow',
    'breast',
    'thanks',
    'yellow',
    'shadow',
    'analyst',
    'largely',
    'revenue',
    'locate',
    'county',
    'package',
    'bridge',
    'obvious',
    'anymore',
    'propose',
    'visitor',
    'profit',
    'hearing',
    'traffic',
    'muscle',
    'notion',
    'capture',
    'prefer',
    'museum',
    'beauty',
    'unique',
    'ethnic',
    'stress',
    'content',
    'select',
    'declare',
    'actual',
    'bottle',
    'hardly',
    'setting',
    'launch',
    'outcome',
    'defend',
    'ensure',
    'extent',
    'airport',
    'estate',
    'English',
    'pursue',
    'neither',
    'surgery',
    'correct',
    'Jewish',
    'branch',
    'relief',
    'manner',
    'ancient',
    'silence',
    'rating',
    'golden',
    'motion',
    'German',
    'gender',
    'typical',
    'except',
    'afford',
    'regime',
    'confirm',
    'appeal',
    'mirror',
    'length',
    'attract',
    'bedroom',
    'secret',
    'master',
    'totally',
    'stretch',
    'winner',
    'volume',
    'fashion',
    'pepper',
    'welfare',
    'opening',
    'overall',
    'divide',
    'initial',
    'oppose',
    'league',
    'careful',
    'employ',
    'holiday',
    'witness',
    'barely',
    'sector',
    'beneath',
    'beside',
    'limited',
    'faculty',
    'merely',
    'liberal',
    'massive',
    'decline',
    'invest',
    'towards',
    'expose',
    'narrow',
    'succeed',
    'fishing',
    'accuse',
    'useful',
    'reject',
    'talent',
    'escape',
    'unusual',
    'closely',
    'height',
    'assess',
    'plenty',
    'approve',
    'campus',
    'proper',
    'guilty',
    'acquire',
    'compete',
    'illegal',
    'column',
    'signal',
    'forever',
    'regard',
    'Israeli',
    'twenty',
    'display',
    'musical',
    'prayer',
    'suspect',
    'scholar',
    'warning',
    'climate',
    'cheese',
    'payment',
    'permit',
    'request',
    'emotion',
    'scream',
    'deeply',
    'airline',
    'library',
    'agenda',
    'recover',
    'factory',
    'unable',
    'expense',
    'arrest',
    'funding',
    'therapy',
    'housing',
    'visual',
    'fairly',
    'violent',
    'silent',
    'suppose',
    'widely',
    'wedding',
    'inform',
    'portion',
    'abandon',
    'tension',
    'leading',
    'bother',
    'consist',
    'alcohol',
    'enable',
    'saving',
    'desert',
    'double',
    'Spanish',
    'passage',
    'formal',
    'arrange',
    'deserve',
    'stream',
    'resolve',
    'racial',
    'Mexican',
    'symptom',
    'potato',
    'online',
    'breathe',
    'jacket',
    'rarely',
    'suicide',
    'passion',
    'priest',
    'amazing',
    'intense',
    'advance',
    'inspire',
    'adjust',
    'retire',
    'visible',
    'illness',
    'analyze',
    'attach',
    'parking',
    'severe',
    'enhance',
    'mystery',
    'impose',
    'poverty',
    'symbol',
    'monitor',
    'digital',
    'heavily',
    'missile',
    'equally',
    'command',
    'clinic',
    'veteran',
    'capable',
    'nervous',
    'tourist',
    'crucial',
    'tomato',
    'butter',
    'deficit',
    'journey',
    'mixture',
    'surely',
    'glance',
    'fellow',
    'smooth',
    'nearby',
    'silver',
    'whisper',
    'junior',
    'throat',
    'salary',
    'anxiety',
    'unlike',
    'resist',
    'embrace',
    'assist',
    'viewer',
    'secure',
    'testing',
    'stomach',
    'install',
    'recipe',
    'wooden',
    'concert',
    'channel',
    'extreme',
    'drawing',
    'protein',
    'absence',
    'rapidly',
    'honest',
    'speaker',
    'restore',
    'origin',
    'quietly',
    'advise',
    'wealth',
    'deputy',
    'assure',
    'dealer',
    'utility',
    'highway',
    'routine',
    'phrase',
    'Muslim',
    'Islamic',
    'refugee',
    'switch',
    'barrier',
    'killer',
    'assign',
    'classic',
    'heaven',
    'distant',
    'Italian',
    'ceiling',
    'button',
    'roughly',
    'lawsuit',
    'burden',
    'chamber',
    'string',
    'profile',
    'penalty',
    'resort',
    'tissue',
    'cabinet',
    'broken',
    'proceed',
    'stupid',
    'dispute',
    'fortune',
    'occupy',
    'cousin',
    'genetic',
    'adviser',
    'retain',
    'latter',
    'whereas',
    'terror',
    'Olympic',
    'bullet',
    'square',
    'gently',
    'fiction',
    'detect',
    'senator',
    'hunting',
    'remote',
    'journal',
    'testify',
    'mutual',
    'founder',
    'dismiss',
    'mainly',
    'freeze',
    'finance',
    'diverse',
    'working',
    'singer',
    'evolve',
    'partly',
    'unknown',
    'offense',
    'counter',
    'thirty',
    'justify',
    'protest',
    'treaty',
    'insight',
    'possess',
    'episode',
    'shortly',
    'assault',
    'sudden',
    'tongue',
    'license',
    'shelter',
    'tragedy',
    'funeral',
    'squeeze',
    'convert',
    'stable',
    'pretend',
    'elderly',
    'violate',
    'steady',
    'segment',
    'nowhere',
    'comfort',
    'radical',
    'vessel',
    'storage',
    'leather',
    'dining',
    'wisdom',
    'council',
    'garlic',
    'poetry',
    'fantasy',
    'scared',
    'gesture',
    'ongoing',
    'chapter',
    'divorce',
    'slight',
    'sustain',
    'differ',
    'custom',
    'fifteen',
    'satisfy',
    'briefly',
    'carbon',
    'closer',
    'consume',
    'scheme',
    'tobacco',
    'besides',
    'wealthy',
    'galaxy',
    'fighter',
    'hunter',
    'educate',
    'painful',
    'infant',
    'uniform',
    'qualify',
    'derive',
    'scandal',
    'helpful',
    'impress',
    'privacy',
    'fabric',
    'contest',
    'organic',
    'asleep',
    'tennis',
    'barrel',
    'bombing',
    'modest',
    'explode',
    'stroke',
    'handful',
    'horizon',
    'curious',
    'prompt',
    'absorb',
    'cotton',
    'flavor',
    'undergo',
    'orange',
    'assert',
    'edition',
    'valley',
    'versus',
    'appoint',
    'hungry',
    'wander',
    'submit',
    'legacy',
    'battery',
    'arrival',
    'cluster',
    'shower',
    'depict',
    'garage',
    'borrow',
    'comedy',
    'twelve',
    'weekly',
    'habitat',
    'devote',
    'ethics',
    'actress',
    'summit',
    'gifted',
    'medium',
    'running',
    'basket',
    'worried',
    'portray',
    'powder',
    'cookie',
    'carrier',
    'cooking',
    'admire',
    'miracle',
    'exceed',
    'rhythm',
    'killing',
    'lovely',
    'charity',
    'script',
    'tactic',
    'venture',
    'grocery',
    'exhibit',
    'blanket',
    'margin',
    'recruit',
    'horror',
    'painter',
    'courage',
    'defeat',
    'sacred',
    'formula',
    'captain',
    'gallery',
    'soccer',
    'tunnel',
    'fitness',
    'virtue',
    'abroad',
    'makeup',
    'inquiry',
    'compose',
    'legend',
    'remark',
    'resign',
    'reward',
    'gentle',
    'related',
    'lightly',
    'invent',
    'ritual',
    'insect',
    'salmon',
    'trading',
    'combat',
    'surgeon',
    'physics',
    'counsel',
    'excited',
    'bitter',
    'serving',
    'subtle',
    'greatly',
    'bishop',
    'pleased',
    'sponsor',
    'ethical',
    'export',
    'entitle',
    'evident',
    'essence',
    'exclude',
    'closet',
    'retail',
    'pitcher',
    'excuse',
    'reverse',
    'missing',
    'deadly',
    'confuse',
    'monthly',
    'Korean',
    'lecture',
    'suburb',
    'swallow',
    'render',
    'enforce',
    'contend',
    'strict',
    'frankly',
    'hallway',
    'monster',
    'crystal',
    'written',
    'motive',
    'consult',
    'forgive',
    'maximum',
    'warrior',
    'temple',
    'outdoor',
    'random',
    'curtain',
    'domain',
    'cattle',
    'walking',
    'playoff',
    'minimum',
    'fiscal',
    'execute',
    'endure',
    'chronic',
    'strain',
    'guitar',
    'behave',
    'dancer',
    'retired',
    'trigger',
    'virtual',
    'colony',
    'closed',
    'convict',
    'modify',
    'landing',
    'govern',
    'ballot',
    'driving',
    'vitamin',
    'praise',
    'injure',
    'endless',
    'mandate',
    'canvas',
    'format',
    'turkey',
    'reserve',
    'genuine',
    'scatter',
    'convey',
    'relieve',
    'suspend',
    'frozen',
    'spouse',
    'pension',
    'resume',
    'sodium',
    'rebuild',
    'bounce',
    'pickup',
    'needle',
    'shuttle',
    'timing',
    'rescue',
    'firmly',
    'precise',
    'anxious',
    'liberty',
    'poster',
    'oxygen',
    'pastor',
    'punish',
    'equity',
    'doorway',
    'teenage',
    'statue',
    'pursuit',
    'repair',
    'decent',
    'endorse',
    'thereby',
    'purple',
    'eating',
    'sharply',
    'parade',
    'cancel',
    'candle',
    'entity',
    'garbage',
    'servant',
    'elegant',
    'vanish',
    'confess',
    'racism',
    'starter',
    'banking',
    'casual',
    'gravity',
    'enroll',
    'intent',
    'isolate',
    'hostage',
    'dynamic',
    'toilet',
    'hidden',
    'tender',
    'stumble',
    'lonely',
    'descend',
    'shared',
    'readily',
    'romance',
    'pillow',
    'circuit',
    'ruling',
    'lately',
    'coastal',
    'softly',
    'burning',
    'verbal',
    'tribal',
    'diamond',
    'import',
    'divine',
    'oversee',
    'trailer',
    'genius',
    'broker',
    'loyalty',
    'output',
    'nominee',
    'alleged',
    'rocket',
    'donate',
    'inmate',
    'tackle',
    'dignity',
    'carpet',
    'bubble',
    'seventh',
    'tightly',
    'dilemma',
    'shallow',
    'stadium',
    'bloody',
    'condemn',
    'accent',
    'shrimp',
    'costume',
    'statute',
    'cartoon',
    'hostile',
    'vaccine',
    'opposed',
    'voting',
    'patrol',
    'jewelry',
    'concede',
    'immune',
    'exotic',
    'drawer',
    'runner',
    'secular',
    'empire',
    'neutral',
    'biology',
    'whoever',
    'verdict',
    'puzzle',
    'subsidy',
    'tragic',
    'safely',
    'dessert',
    'eleven',
    'bureau',
    'utilize',
    'breeze',
    'costly',
    'rolling',
    'insert',
    'helmet',
    'minimal',
    'cocaine',
    'casino',
    'sibling',
    'hockey',
    'passing',
    'persist',
    'liquid',
    'foster',
    'bicycle',
    'filter',
    'rabbit',
    'exploit',
    'charter',
    'consent',
    'outfit',
    'workout',
    'patent',
    'hormone',
    'texture',
    'pencil',
    'custody',
    'banker',
    'eighth',
    'outline',
    'uncover',
    'behalf',
    'catalog',
    'stance',
    'compel',
    'someday',
    'instant',
    'trainer',
    'eyebrow',
    'inherit',
    'pioneer',
    'shrink',
    'fierce',
    'kingdom',
    'weaken',
    'openly',
    'unfair',
    'terrain',
    'deploy',
    'planner',
    'closest',
    'ladder',
    'jungle',
    'invade',
    'density',
    'Persian',
    'feather',
    'sphere',
    'tighten',
    'unfold',
    'partial',
    'collar',
    'streak',
    'builder',
    'glimpse',
    'premise',
  ];
  int num_rows_and_columns=12;
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
    Colors.pink
  ];
  int next_Color=0;
  //Timer
  int _seconds=0;
  int _minutes=0;
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
                    .width / 40
                    + column * MediaQuery
                        .of(context)
                        .size
                        .width / 12.65 && local.dx < MediaQuery
                    .of(context)
                    .size
                    .width / 40 + (column + 1) * MediaQuery
                    .of(context)
                    .size
                    .width / 12.65

                    && local.dy > MediaQuery
                        .of(context)
                        .size
                        .height / 6.12 + row * MediaQuery
                        .of(context)
                        .size
                        .height / 20 && local.dy < MediaQuery
                    .of(context)
                    .size
                    .height / 6.12 + (row + 1) * MediaQuery
                    .of(context)
                    .size
                    .height / 20) {
                  end_Of_Selection_dx = MediaQuery
                      .of(context)
                      .size
                      .width / 40 + (column + 1 / 2) * MediaQuery
                      .of(context)
                      .size
                      .width / 12.65;
                  end_Of_Selection_dy = MediaQuery
                      .of(context)
                      .size
                      .height / 6.12 + (row + 1 / 2) * MediaQuery
                      .of(context)
                      .size
                      .height / 20;
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
                            .height / 20,
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
                      .width / 40
                      + column * MediaQuery
                          .of(context)
                          .size
                          .width / 12.65 && local.dx < MediaQuery
                      .of(context)
                      .size
                      .width / 40 + (column + 1) * MediaQuery
                      .of(context)
                      .size
                      .width / 12.65

                      && local.dy > MediaQuery
                          .of(context)
                          .size
                          .height / 6.12 + row * MediaQuery
                          .of(context)
                          .size
                          .height / 20 && local.dy < MediaQuery
                      .of(context)
                      .size
                      .height / 6.12 + (row + 1) * MediaQuery
                      .of(context)
                      .size
                      .height / 20) {
                    audioPlayer.play('sounds/selectionsound.wav');
                    setState(() {
                      start_Of_Selection_dx=MediaQuery
                          .of(context)
                          .size
                          .width / 40 +
                          (column + 1 / 2) * MediaQuery
                              .of(context)
                              .size
                              .width / 12.65;
                      start_Of_Selection_dy=MediaQuery
                          .of(context)
                          .size
                          .height / 6.12 +
                          (row + 1 / 2) * MediaQuery
                              .of(context)
                              .size
                              .height / 20;

                      row_start=row;
                      column_start=column;
                      points.add(DrawingPoints(
                        first:true,
                        points: Offset(start_Of_Selection_dx, start_Of_Selection_dy),
                        paint: Paint()
                          ..strokeCap = strokeCap
                          ..isAntiAlias = true
                          ..color = serie_Color().withOpacity(
                              opacity)
                          ..strokeWidth = MediaQuery
                              .of(context)
                              .size
                              .height / 20,


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
            if(word_one_scratch==true && word_two_scratch==true && word_three_scratch==true&&word_four_scratch==true&&word_five_scratch==true){
              set_Best_Time();
              showAlertDialog(context,'You won');
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
                 
                  Row(
                      children: [
                        SizedBox(width: MediaQuery
                            .of(context)
                            .size
                            .width / 10),
                        Text('LEVEL: HARD',
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
                          color: Colors.white,
                          size: MediaQuery
                              .of(context)
                              .size
                              .height / 25,),
                        return_Timer()
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
                        .width* 19/ 20,
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
                                  .height /20,
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
                                  .height /20,
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

                            ), Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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

                            ), Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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

                            ), Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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

                            ), Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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

                            ), Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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

                            ), Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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

                            ), Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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

                            ), Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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

                            ), Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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

                            ), Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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

                            ), Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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

                            ), Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                                  .height /20,
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
                        .width* 2/ 3 ,
                    child: Table(
                        children: [
                          TableRow( children:[
                            Row(children:[
                              SizedBox(width:MediaQuery.of(context).size.width/25),
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
                              SizedBox(width:MediaQuery.of(context).size.width/27),
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
                              SizedBox(width:MediaQuery.of(context).size.width/25),
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
                              SizedBox(width:MediaQuery.of(context).size.width/27),
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
      sorted_Num_Words=random.nextInt(5)-1;
      next_Color=random.nextInt(5);
    }
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

    // the row and column from the 'beginer of the words', rigth is positive and down is positive, later the word can be changed to reversed order so it makes more difficult the puzzle
    row_one = random.nextInt(num_rows_and_columns);
    row_two = random.nextInt(num_rows_and_columns);
    row_three = random.nextInt(num_rows_and_columns - word_three.length + 1);
    row_four = random.nextInt(num_rows_and_columns - word_four.length + 1);

    column_one = random.nextInt(num_rows_and_columns - word_one.length + 1);
    column_two = random.nextInt(num_rows_and_columns - word_two.length + 1);
    column_three = random.nextInt(num_rows_and_columns);
    column_four = random.nextInt(num_rows_and_columns);



    //  zero is SO, one is SE
    if (random.nextInt(2) == 0) {
      if (random.nextInt(2) == 0) {
        row_five = random.nextInt(num_rows_and_columns - word_five.length + 1);
        column_five =
            random.nextInt(num_rows_and_columns - word_five.length + 1);

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
          column_one =
              random.nextInt(num_rows_and_columns - word_one.length + 1);
          column_two =
              random.nextInt(num_rows_and_columns - word_two.length + 1);
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
            if (tried_too_much_just_find_solution % word_four.length + 1 != 0) {
              row_three++;
            } else {
              column_three++;
              row_three = 0;
            }
          } else {
            column_three = random.nextInt(num_rows_and_columns);
            row_three =
                random.nextInt(num_rows_and_columns - word_three.length + 1);
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
            if (tried_too_much_just_find_solution % word_four.length + 1 != 0) {
              row_four--;
            } else {
              column_four--;
              row_four = num_rows_and_columns - word_four.length;
            }
          } else {
            column_four = random.nextInt(num_rows_and_columns);
            row_four =
                random.nextInt(num_rows_and_columns - word_four.length + 1);
          }
          tried_too_much_just_find_solution++;
          if (tried_too_much_just_find_solution == 91) {
            column_four = num_rows_and_columns - 1;
            row_four = num_rows_and_columns - word_four.length;
          }
        }

        if (random.nextInt(2) == 0) {
          for (int i = 0; i < word_five.length; i++) {
            puzzle[(row_five + i) * num_rows_and_columns + column_five + i] =
            word_five[i];
          }
        } else {
          for (int i = 0; i < word_five.length; i++) {
            puzzle[(row_five + i) * num_rows_and_columns + column_five + i] =
            word_five[word_five.length - 1 - i];
          }
        }
        solution_positions[16] = row_five;
        solution_positions[17] = column_five;
        solution_positions[18] = row_five + word_five.length - 1;
        solution_positions[19] = column_five + word_five.length - 1;
      } else {
        row_five = random.nextInt(num_rows_and_columns - word_five.length + 1);
        column_five = num_rows_and_columns - 1 -
            random.nextInt(num_rows_and_columns - word_five.length + 1);
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
          column_one =
              random.nextInt(num_rows_and_columns - word_one.length + 1);
          column_two =
              random.nextInt(num_rows_and_columns - word_two.length + 1);
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
            if (tried_too_much_just_find_solution % word_three.length + 1 !=
                0) {
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
            if (tried_too_much_just_find_solution % word_four.length + 1 != 0) {
              row_four--;
            } else {
              row_four = num_rows_and_columns - word_four.length;
              column_four--;
            }
          } else {
            column_four = random.nextInt(8);
            row_four = random.nextInt(8 - word_four.length + 1);
          }
          tried_too_much_just_find_solution++;
          if (tried_too_much_just_find_solution == 91) {
            column_four = num_rows_and_columns - 1;
            row_four = num_rows_and_columns - word_four.length;
          }
        }
        if (random.nextInt(2) == 0) {
          for (int i = 0; i < word_five.length; i++) {
            puzzle[(row_five + i) * num_rows_and_columns + column_five - i] =
            word_five[i];
          }
        } else {
          for (int i = 0; i < word_five.length; i++) {
            puzzle[(row_five + i) * num_rows_and_columns + column_five - i] =
            word_five[word_five.length - 1 - i];
          }
        }
        solution_positions[16] = row_five;
        solution_positions[17] = column_five;
        solution_positions[18] = row_five + word_five.length - 1;
        solution_positions[19] = column_five - word_five.length + 1;
      }
    } else {
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
    // now it just needs to write  the letters in the list string puzzle which in two possible ways original order or reverse order
    if (random.nextInt(2) == 0) {
      for (int i = 0; i < word_one.length; i++) {
        puzzle[row_one * num_rows_and_columns + i + column_one] = word_one[i];
      }
    } else {
      for (int i = 0; i < word_one.length; i++) {
        puzzle[row_one * num_rows_and_columns + i + column_one] =
        word_one[word_one.length - 1 - i];
      }
    }
    if (random.nextInt(2) == 0) {
      for (int i = 0; i < word_two.length; i++) {
        puzzle[row_two * num_rows_and_columns + i + column_two] = word_two[i];
      }
    } else {
      for (int i = 0; i < word_two.length; i++) {
        puzzle[row_two * num_rows_and_columns + i + column_two] =
        word_two[word_two.length - 1 - i];
      }
    }

    if (random.nextInt(2) == 0) {
      for (int i = 0; i < word_three.length; i++) {
        puzzle[(row_three + i) * num_rows_and_columns + column_three] =
        word_three[i];
      }
    } else {
      for (int i = 0; i < word_three.length; i++) {
        puzzle[(row_three + i) * num_rows_and_columns + column_three] =
        word_three[word_three.length - 1 - i];
      }
    }
    if (random.nextInt(2) == 0) {
      for (int i = 0; i < word_four.length; i++) {
        puzzle[(row_four + i) * num_rows_and_columns + column_four] =
        word_four[i];
      }
    } else {
      for (int i = 0; i < word_four.length; i++) {
        puzzle[(row_four + i) * num_rows_and_columns + column_four] =
        word_four[word_four.length - 1 - i];
      }
    }
    solution_positions[0] = row_one;
    solution_positions[1] = column_one;
    solution_positions[2] = row_one;
    solution_positions[3] = column_one + word_one.length - 1;
    solution_positions[4] = row_two;
    solution_positions[5] = column_two;
    solution_positions[6] = row_two;
    solution_positions[7] = column_two + word_two.length - 1;
    solution_positions[8] = row_three;
    solution_positions[9] = column_three;
    solution_positions[10] = row_three + word_three.length - 1;
    solution_positions[11] = column_three;
    solution_positions[12] = row_four;
    solution_positions[13] = column_four;
    solution_positions[14] = row_four + word_four.length - 1;
    solution_positions[15] = column_four;
  }


  pick_Random_Words() {
    Random random = new Random();
    int one = random.nextInt(1200);
    int two = random.nextInt(1200);
    int three = random.nextInt(1200);
    int four = random.nextInt(1200);
    int five = random.nextInt(1200);
    while (all[three].length == 7 || all[four].length == 7 || all[five].length == 7 || one==two || one==three || one == four || one==five || two==three || two==four||two==five||three==four||three==five||four==five) {
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

  Color serie_Color(){
    next_Color++;
    if(next_Color==5){
      next_Color=0;
    }
    selected_color=colors[next_Color];
    return selected_color;
  }
  set_Best_Time() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int time_now=_minutes*60+_seconds;
    int old_best_time_minutes = (prefs.getInt('best_time_hard_minutes') ?? null);
    int old_best_time_seconds=(prefs.getInt('best_time_hard_seconds') ?? null);
    int old_time;
    if(old_best_time_minutes==null ||old_best_time_seconds==null){
      old_time=0;
    }else {
      old_time = old_best_time_minutes * 60 + old_best_time_seconds;
    }
    if(time_now<old_time || old_time==0){
      await prefs.setInt('best_time_hard_minutes', _minutes);
      await prefs.setInt('best_time_hard_seconds', _seconds);
      String best_time=_minutes.toString()+":"+_seconds.toString();
      prefs.setString('best_time_hard', best_time);
      Navigator.of(context).pushNamed("/stats");
    }
  }
//Timer
  @override
  void dispose() {
    super.dispose();

  }
  @override
  void initState() {

    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }

  void _getTime() {
    _seconds++;
    if(_seconds==60){
      _minutes++;
      _seconds=0;
    }
    setState(() {
    });
  }
  Text return_Timer(){
    return Text("${_minutes} :${_seconds.toString().padLeft(2, '0')}",
      style: TextStyle(fontSize: MediaQuery
          .of(context)
          .size
          .height / 25,
        color: Colors.white,),);
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
              height: size.height / 20,
              width: size.height / 20,),
            0,
            3.1415926535897932,
            true,
            pointsList[i].paint,
          );
          canvas.drawArc(
            Rect.fromCenter(
              center: pointsList[i].points,
              height: size.height / 20,
              width: size.height / 20,),
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
              height: size.height / 20,
              width: size.height / 20,),
            3.1415926535897932,
            3.1415926535897932,
            true,
            pointsList[i].paint,
          );
          canvas.drawArc(
            Rect.fromCenter(
              center: pointsList[i].points,
              height: size.height / 20,
              width: size.height / 20,),
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
              height: size.height / 20,
              width: size.height / 20,),
            3.1415926535897932 * 3 / 2,
            3.1415926535897932,
            true,
            pointsList[i].paint,
          );
          canvas.drawArc(
            Rect.fromCenter(
              center: pointsList[i].points,
              height: size.height / 20,
              width: size.height / 20,),
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
              height: size.height / 20,
              width: size.height / 20,),
            3.1415926535897932 / 2,
            3.1415926535897932,
            true,
            pointsList[i].paint,
          );
          canvas.drawArc(
            Rect.fromCenter(
              center: pointsList[i].points,
              height: size.height / 20,
              width: size.height / 20,),
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
              height: size.height / 20,
              width: size.height / 20,),
            0,
            3.1415926535897932,
            true,
            pointsList[i].paint,
          );
          canvas.drawArc(
            Rect.fromCenter(
              center: pointsList[i].points,
              height: size.height / 20,
              width: size.height / 20,),
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
              height: size.height / 20,
              width: size.height / 20,),
            3.1415926535897932,
            3.1415926535897932,
            true,
            pointsList[i].paint,
          );
          canvas.drawArc(
            Rect.fromCenter(
              center: pointsList[i].points,
              height: size.height / 20,
              width: size.height / 20,),
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
              height: size.height / 20,
              width: size.height / 20,),
            3.1415926535897932 * 3 / 2,
            3.1415926535897932,
            true,
            pointsList[i].paint,
          );
          canvas.drawArc(
            Rect.fromCenter(
              center: pointsList[i].points,
              height: size.height / 20,
              width: size.height / 20,),
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
              height: size.height / 20,
              width: size.height / 20,),
            3.1415926535897932 / 2,
            3.1415926535897932,
            true,
            pointsList[i].paint,
          );
          canvas.drawArc(
            Rect.fromCenter(
              center: pointsList[i].points,
              height: size.height / 20,
              width: size.height / 20,),
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
                height: size.height / 20,
                width: size.height / 20,),
              3.1415926535897932 / 2+atan((pointsList[i].points.dy-pointsList[i-1].points.dy)/(pointsList[i].points.dx-pointsList[i-1].points.dx)),
              3.1415926535897932,
              true,
              pointsList[i].paint,
            );
            canvas.drawArc(
              Rect.fromCenter(
                center: pointsList[i].points,
                height: size.height / 20,
                width: size.height / 20,),
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
                height: size.height / 20,
                width: size.height / 20,),
              3.1415926535897932 / 2+atan((pointsList[i].points.dy-pointsList[i-1].points.dy)/(pointsList[i].points.dx-pointsList[i-1].points.dx)),
              3.1415926535897932,
              true,
              pointsList[i].paint,
            );
            canvas.drawArc(
              Rect.fromCenter(
                center: pointsList[i].points,
                height: size.height / 20,
                width: size.height / 20,),
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
                height: size.height / 20,
                width: size.height / 20,),
              -3.1415926535897932 / 2+atan((pointsList[i].points.dy-pointsList[i-1].points.dy)/(pointsList[i].points.dx-pointsList[i-1].points.dx)),
              3.1415926535897932,
              true,
              pointsList[i].paint,
            );
            canvas.drawArc(
              Rect.fromCenter(
                center: pointsList[i].points,
                height: size.height / 20,
                width: size.height / 20,),
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
                height: size.height / 20,
                width: size.height / 20,),
              -3.1415926535897932 / 2+atan((pointsList[i].points.dy-pointsList[i-1].points.dy)/(pointsList[i].points.dx-pointsList[i-1].points.dx)),
              3.1415926535897932,
              true,
              pointsList[i].paint,
            );
            canvas.drawArc(
              Rect.fromCenter(
                center: pointsList[i].points,
                height: size.height / 20,
                width: size.height / 20,),
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
showAlertDialog(BuildContext context, String alert_string) {
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Game_Hard()),
    );},
  );


  AlertDialog alert = AlertDialog(
    title: Text(alert_string.toUpperCase()),
    content: Text('Try again.'),
    actions: [
      okButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}