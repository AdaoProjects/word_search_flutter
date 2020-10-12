import 'dart:io';
import 'dart:ui';
import 'dart:math';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:findthewords/utilites/colors.dart';
import 'package:findthewords/screens/levels.dart';
import 'package:findthewords/custom_painter.dart';
import 'package:findthewords/main.dart';
import 'package:audioplayers/audio_cache.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:findthewords/app_localizations.dart';
AudioCache audioPlayer = AudioCache();
class Game_Easy extends StatefulWidget {
  Game_Type game_type;
  Game_Easy({Key key, @required this.game_type}) : super(key: key);
  @override
  _Game_EasyState createState() => _Game_EasyState();

}

class _Game_EasyState extends State<Game_Easy> with TickerProviderStateMixin {
  //Puzzle
  static List<List<String>> all_puzzles=[
    ["PgQwkdMEAYoyooaXfbndVrobGedargtcdlitejfhZoShenobRwPGcXlPNRjumpkW"],
    ["AdeefHKcbtDevawouPeboneoytwicetkViDgufAMVmbYiqRXSialTpDIHldpmujH"],
    ["TbOJsuitXedargGIplNrZWwCioAleiWpgwignsSmWfTeiysutshoefujNlimittb"],
    ["NeohsPMKtfPtiusPmedargVgreittfiladFuipHtwSKMqmSeMynedWijwineBIBl"],
    ["UbTpigAHYGlwwineJsaowbDZLvsawrwleGreKooiRmKPralfVGgradetcatnrubM"],
    ["kLtacXwboXcdabauoYghHfvrciWPieenpawareBIomrawdfOhTObroadsTKGNGUP"],
    ["BXIPsbuytshoeuRIZerawaiQmhihtaptrytuYFpUanorqXoMweMboAhPTdnaNwsL"],
    ["SJjumpSSQXtfilbYgenoborYitQYyXoffPerawaetLTigodetiusuAQdGEbuyqHS"],
    ["enobHUTtFKjumpfpdWKMSicalrIwgaQtiMeotnAhfdgradeUtaVtsKRXAbZhsuit"],
    ["POpIpnkyNiOarpongTtumboechbuWtcdThjUUiVltwicemciXHUeYiafGDGLfltt"],
    ["limitWMTgsSGtfigiXsIefTDpAMejeBbtawareboijumpdonuTtfilyesHROQKHW"],
    ["folkhVVtgipOtNelSOWmajVidsrWpICmZaskoociwNbeciwtshoerEFUevawBdPU"],
    ["CboyEGLMMBdbonelQVZrATibtwicefKeevawtsMldwarmcsooworthawgOEtiust"],
    ["FpZIwXEEloNYwarmihdabOvCmstfboneiJcerawatMoeiOLaVUodYuOnMWktejqd"],
    ["DJnrubATChtaprSSsLfHLoOEBoledargwcfiidtEpaotfhabiRvoKtcagPVekXEd"],
    ["GkoocNJbtpathQutDfdeFyiefoopomQvgeosihPaThilNPswsHNhOyobOtwiceSP"],
    ["MgtRPHjLCifAYuFjcpiwmZebKhlpotpltwiceraoORbeKMtwenobfRhhPByCtfig"],
    ["MAdWsPAYBasGfoBEbKGseTfCtwiceCCticatdrBimfolkeduiVbonenslEZPdnay"],
    ["tbNAFBCFkerawatdlliOHfncooLuiawofwUgqojomrawreCkCVOttyobCOhshoeU"],
    ["PdeohsHBGyrfandhMQneciwtsGResFErwhcddsyoiSoFPouwnIopFfbFeTkHPtMC"],
    ["limitMWtjXXeVIipUuoLguabthmostTosedphhgytwiceioHTFIufQKpNJHtqcat"],
    ["tbevawDeLedargtngliYUyiiEoCuuEmwBwdbqtiLGJsoftlPXFLisuitYVlVenob"],
    ["VUplQYPCHiiFMpZRgfLYwaveteciwttbbUphIhiruaRmiZuorFdCuesanCjetjfd"],
    ["eniwpohsAtfosDKstftacWNuwerawaliaeiBPAitvdguILmSeiDSqMiRpeohsBtB"],
    ["JQtfandWdabedargEdPeiyDdXFadVuUepeVoZbqnooRmrawyhhDZVbJDsscookHG"],
    ["catLXGLtTLtfosfeqOHVtioddubfghMocaiaspQgoloedargoOErttKAkCHWbhQT"],
    ["ZctejPGNHOhpohsZpsuitgAbawareiOrtGRwpfsohZaibthaBrgoCWodmFyCLGeE"],
    ["belowUbeJETHsMrosVwuXdohhqiaeNasotunrJdDpByibmGcgradeoaYMYdogtyG"],
    ["XfftfilbEPerawarPVeiFSNoSpdEhyJacXmbscodUapuouEbUitJjniPgIwaveet"],
    ["NwarmSQKDPtXdenyhYterawatwiViyobroucdukeolsoalqowegXotDhSbQfFWMs"],
    ["chtapAJZomrawoUIoteohshYkderawasENeiBDtYdVQnuRaWapigyqcMbhtrowQO"],
    ["RVwwtbadwGbooaUTaPLulrcRvpbfrbttemeVenfhDultwiceXjoYlQhRSZwCgipc"],
    ["CtaceBBtgTHYHoOiohtrowhudUPtbbXsawarekomgiftliryDMRooauPWGfMwZXq"],
    ["buytIJIeHTfdfRevNodoenRasalsoeNwbkXbsMfVhtroweFPVIYedargblowMand"],
    ["IPBdnaEwYbHfbrCogradeOulwoWNliYbaawloShyrdiiwBncmfVSneIKtbuydeMB"],
    ["XSFsgybVfUsVoaunqoOudfrbPulSiutrUMikbtNoGPSerawadenytPKdBpathLUD"],
    ["ILfeedOZUcbswarmToEOsRwGyoWMReoTykFedargnburnWtdeCVyubhodVLpohsg"],
    ["twiceDdbdabQhGolSGDKQigoGEshopewlimitQtftjumpJfJeFhtapiXjshoeEgE"],
    ["stJenobOUhiXGTMyIqomrawoBQupiHhbPcKiEltWgradevawgiptGtpJSEYItius"],
    ["denyGDyehQDshopntqPRbfiorAuLJegbotwiceJcwyubedVoJTNEJtYotfosGUFk"],
    ["LnpohsedYrqFTvnmbuwuaaTrlbowibZaogradeVwwjtLbltKVehGaoIJOtHMdwCN"],
    ["sBBpmujtBssuitUfpSepigbiawareaHgtoOSdZZFhrtfilCQTtIQenobBhBOtejL"],
    ["yobbXhMNAcuDtyubYrhrliftnEoifKGwawareSRaFnCFefJvdFLLdRMekoocjump"],
    ["estbtacwnuPerawaoiAliBJrbtVoZuBmtPKwSLqNPfworthytfigipoUILClGbBO"],
    ["NsVshoeUPuRJfolkPijetOEJctmrawebRhgfMBnrLdieAUioYnferawaNatdfHOd"],
    ["bcWatPFCrFhanHkboMciOdlTawareoowdogewffaNlbioNErReMofhWmYbYVytsO"],
    ["XeAWfdabEvtfYeFWwaaAowekawcqolodrCPruokpmNtCciViBhawaregWshoeJZt"],
    ["sZRteOHOuYBsfnVQitejsooTttwicesbsiftgKrKFhmefoGdCFoieidObadpldgP"],
    ["TOEMtacndabiwCGrEEmaBTQutivsoftbleFtfeedtwiceoPLPuMuMQlHsgodqPGk"],
    ["LZtimilDSGKyubIytwiceGLnkoQyhPEeolESoiIdoednabeGcbNjumpffolknrub"],
    ["JIEqsZDSdoguuyobtfilVibBJtgradeNLmrawBltjBwaveoPeshoeWwPtVLlimit"],
    ["NwJFbadPXoZtbdnagradeMPeUtKtlivLShftoauXXofMwtMqsiblowePlUTburnj"],
    ["gdMdcLtQiAapaofHpVdooboXqKLerhskbuYfnbsAobieZyXYnuUedargeyEdtGKP"],
    ["BXpohstCeniwOAatqnfeedcfsuoSVOwoudibBPosieMedargtnXUtKtCOygodVhR"],
    ["VQfIwolbBHFetfosKwnliftfDotWDhAebratwiceStcBbLYdShOgodYSZXMJyned"],
    ["twiceCGKiXsGhjetmIAhwineiBShoKeFllttpetfOaimifYppPufiuHiZjCgtCsg"],
    ["SwZYeDQWcodboNkBalarhVljtbbosAoudedargfmeoidGYVpnXgupathyCSIqPII"],
    ["ynedKLfVqboneotbQuGUlOarCYikBHcodscerawaeEootApdeITfoQiDfdabtkgR"],
    ["ZBBbRdASRTlAeanddofepmujwafedargWposiyZPKOorhhoYXFIhbocbtfigsjet"],
    ["elHpXCdCtnikoocZsfimghOXZsowiQscpGesntEaawarerRttLUPdNuEhwaveIFb"],
    ["CsXbwolbIhJreBYdfoXoIlEnbedargoauEidIdCwyPChevawjumpcYXbOliftZMW"],
    ["YyXcsNVUjMohhbuyuLobpiKGmegradehpkdNtItfFleJhriYVondoguKRfywJCsR"],
    ["CBnmgiftVWrraDdkCaqnuaflwddubbeocatwicefAoRJtedZRroCeMtCXbKkjSNG"],
    ["wfbdaorbidedargCnnliklofeaoVhZXjBHwtJcuVsuitamWUevawpcGDSFboneVG"],
    ["XeohsHVJCtfgipdtFYerawaftFeiOIoiikdwuUrgutlCaqbysaCoFroQEcQRfbmW"],
    ["dnaNLsHEMeGMburnsWettiIKhCnfetRAoUitwicepgwKPBubYCjumpuqdaorbySF"],
    ["qbadfJUthuNLeHaKtwicecEerLIedQmvoHlbtrZawCuiaQpwJrTwfNiCnblowtgY"],
    ["NlWVVhjdOHiNXteebadfIrtnGfOPtowypkerawasgaoiWVrhYitohZmoOTphccMe"],
    ["qjetKyULsuKIoVwTCoibSwoCGWfedargsuittvtRtfilHehgHZeohsUoJwolebYd"],
    ["bXBbelowlgiftwPwoBPfaaCiwCHrelcnJPmtwiceliftYmhPdogBKiUcAnrubtAP"],
    ["blowtfosRdCPOpdbLerawaaaMZDeTtodsXykshrCChlnHsbZBooQejetfGCeSdna"],
    ["badjsGCgEwJYeoNoMoJfbtfdgradenytGtpsliQVGhouoVhXWRhiwMIcXFsteohs"],
    ["SEGfILMsgradeMUhworthiUobQZwRFhpatacJGCcdvsoftSdeCsuitnRbonepath"],
    ["JmVtbQTtgradeCnfgaCEliriowLcoTugdloKwLbqAoilimitkKQfyobGLYOStbuy"],
    ["RLshoeWwtwiceMaowolbhvGrSlaEeiFtGentwEehTbdOfiPfMLtaconKYtfilZse"],
    ["folkFtsdRMsTFeueTDJsbjintwicegtyibQslriKmaKooCdpidIfwWSSlPZtburn"],
    ["LYstPRYUtfoseSfgbfXDejeioliCbrepnpogradeeoRwobadRhUNaYJGWsWWdSMI"],
    ["wHburnFFoSdIgblYlaFTSiuNbwbcfTfyYarthITtaroEtiSBnmawareYdHdDpLOf"],
    ["KfbtacdKLCerawapbXliBSoileoWhArgonwJKcbywomrawGnVbVwineeKtfilZDd"],
    ["dabtfilwglnrubawiciLZrSofWhmmZdltYViiIebgradetedJTSKDffoTyubZEGg"],
    ["jettlaUBawareinHRoIWLifdTlshoeutPeiRDDVqJbKmwarmtiusidabUdenytEF"],
    ["ssoftXRUuASVYbRtipohsrdftwineoeiberawaeggoitSdfPiJnuaNMJpTHeqcGX"],
    ["efNsoftWKnedargNfloiaTBUeWibhbBteKCmlcfBdHgiiiRjUofFgtBedtZLsuit"],
    ["mGJelgGEdrWWviiKerawaafpADewKhwtbDbstKSpoElrsbaMnDojetoCewwZhAWy"],
    ["CBCLeohspathbGXugiftrVCidJLRobBterawaLftRgeddifcBQosloCaAUQdsHBt"],
    ["edYMtGDEnNrfkoociDieciwtwgHesQWiWfUdNssmLojumphiQlyubOolBkdnaKeG"],
    ["giftfFRdHsQSLeaWyubVCbeIsiWsQCddhtFssnaAoDoOaeoTpfLedargtZHenobd"],
    ["PgPwavebtocsOHrMfdoChoDwosotaoRoshkdeNelJoJtwiceWpbadEubtacSJKMq"],
    ["OsdnaINUIuRsNfJdwineseOebtwiceVnuikIadryrmlKtOKdniojumpRUlfVNVEV"],
    ["HZqBbZHdkIFuburnoFymibIaogradePWcaFapltdwTooBoBaVrhKUwKbbsdenyIF"],
    ["evawpigCsqpohstYuWuWPapPitwicemytUoAeUuoLGrFXtjbVXtwolebQPhboneR"],
    ["shoeliftSGUsGBDGJEoRboyYwftimilptacerawaBUvoicPtgodeouahUGMKFkqt"],
    ["XNwfbTItsTFouCeSVsClrjYmpdekntRrawareUhatNpbdQVwhiPKZWWLgiftcook"],
    ["bdevawYYjorshoeHYuyeciwthkmtspIVOtlpisibZUaoNmlgjetpfoiMYAKHwWJl"],
    ["nrubtbAaKAdfpNanUOielmkdsgEieouyAsmlofujTiecibBOtHGrXfKFUgradetL"],
    ["mrawPtQeTPPttiLodnaffmAhhqiFCiJstguBJllsatwiceuFpboyeiQVMbuyttQX"],
    ["atiusUVenFeJFCTodtwicefhehoQuoHsntlTlqSjyrekSyuJWobKumUMVwMbpyob"],
    ["gipmJTKGQQSrAGpjbroadaetdTcwttofaFQhgGhiblowiislYawarefJXWVQDYft"],
    ["tsKCIANkaOsFZfMlcRFebeQodawaresfebadodubngLCaUioyoEFdMtnFdjumpSe"],
    ["QVZpmujlfUtdbOeiUefieatfCRiEmedtBVghPifkMtwiceloEJgodAToVFnrubZc"],
    ["wQbtfosQfoCoEWudosltnOialwseietbkaZebmHPOvGHrIiUSegradelGdnabuyY"],
    ["UVtgODsTWXieguJHWftwiceltbatpuiFLecOfmqfylDQioDoooZtIFslbwboneLk"],
    ["dRGLBbBSOrtfiloTYgeciwtybitsGoiDupiwslmgrSuateiinDsrablfHJQmcRFt"],
    ["EXVBsoftUTpohsJdpMVtkdaVawareoaOttWFriobhfdbRHucWinnrubqXgacatQA"],
    ["pathburnbuyQjumpCBXtwgipawareiDQshopJinVEkoocHueFdaorbZqYLPZdeny"],
    ["ktZcyubdliTwhJDnouBoOibafsgradeYAYbtOQlfUoFhHBoJypmujZwLynedshoe"],
    ["tNsXsAQUceYsmhNFoPjreboFoNawarepkwdonodPgOelraGboQneudaPdOybbdHS"],
    ["VMpNshopJIkmtCKiUFocufCgbEoOhjiHuEcXVifgrEgradejnVeniwefworthtdH"],
    ["evawIIGwgeohsYasGisUPrbuJUpsmFrishopeXotLQbadraGcatgradeZdeefTGH"],
    ["suitpohsUbevawbDqHuMENeEduOrGElZaFiQndogbPXerawatfostcatbroadKJC"],
    ["ARjRkooctetIJYHptiserawadtmoiYFtsefifuDhyhniltqBWooyldnaYQbeBEPH"],
    ["ddaorbIterawaXftgyeEKiipboosluPmeudbsMHuoPyfeedjhFynedUVsMWFAVPO"],
    ["eUOmburnDvHrbpBMQBaariOftfTwogVefyedargeioOidNtdlbZWheYYwolbjcFZ"],
    ["eciwtHcbhlhIAoudtiTioyatafnkeoUfptwrrfCoiLabuKWsgGvGZbGYJWeNyobB"],
    ["SHbqsuitIurNuOAdyXoGVifntBawareafndwsMetiFrUahdVgMHuZroVyobFbZmp"],
    ["ZCfbtiusbMaedarguRnliNYpybdoFhtoJoewCfchynnToYGsoeysGSYVbZMdaorb"],
    ["tEliftfGqaZYQEeJUucYLwewtwiceadoIosenrVlPrhdtmLbMtowaveWWhewineO"],
    ["worthdTFeciwtabbeNhWMbluPvaifMorNjaneownFVewdflTZpathSHkGmrawVKI"],
    ["godhtrowCVptburngradeOTMjGtNsidAuXhuBeuymOiAntoqptVyWbaTTliftEBc"],
    ["YMdwineJyubaPBPRfolkoSFZtwicerQhdenyhPbtkoocTiOaGCjumpepgodenobf"],
    ["SdbBXJbdderawaoatnoeGJnbfJaUsTetosdEFsaQsuBVhcBUSiTofeedVtpdenyZ"],
    ["wtfosJKbdoWfolkuZnrQbcIrQsatelandSsvhfotHaaeCeHwIwbNreXJMLgradeI"],
    ["bRswWHbBoOasLLuYnvLdeAyTehawarehcHttpbdtOofrdoNaKooIoohpsRQkLwgs"],
    ["dhtfiltJnLtPwfTbaNUaiauMtDGgpyrdnedargamAriBkoocFMuurEHVEREbqbad"],
    ["tmrawSygiAjetnKouKbqeyTdsCrduVoXshoeSifbZFawareYSFdBVUetshopMSdV"],
    ["YYhhNLKeFJttmXRvIaHcrryapITFhoawlwolbiwwyigradeEIufandOfRZbtenob"],
    ["wavewTGWTXCopmujNJlbuywMdbelowoSfrandVrsoHeciwthlIAsIwhokHSQsVYe"],
    ["warmdnaZQPJtNKyIXwSFiuMyFopfbunygradeesoWttVdiUbZhhReohsCEklofGc"],
    ["tbXWshopMedargOgeliTKwikjoPuapobuwhvqorjmMescoCepQJPaHMtZSRddabT"],
    ["tiusDOJAandVshoewaveJecZIPGedargVDRptXIdtfosaboytimiltIVDWshophR"],
    ["SdoghRQneciwtejrIUhCaCDuKCDipOwbcMeteoRfIofvrfobGootalTasZhkkwBd"],
    ["PMpathdwUpmujnobQtejalHueCelbTlrntwiceiniVJmuMfCwtfigqtZMNVtFZPX"],
    ["AdZBwolbeerawasMsvfeWXhppoaosGoacifwlsetaNgtdkMhtJbroadVNMBJSNbV"],
    ["WOjtKbYQPefNtroItitfIoHylWoedargbswfidHyoHoeJungnQleNeqieIbddBUp"],
    ["evawXCXQTBjumpXFPwRNenobMoptRnDQgradepiajttPoinwehhhMduRtCstiusq"],
    ["ctCGNmEycaedargneotibadeynoruwndAookYqaJHabbAFFDdJGpathStfilDYOW"],
    ["yIFWMpetnLqkmtnieLouBaomdojpicbicgradeOlbGGtWBtSToThgipNTZyfolkL"],
    ["URsoftwXgGffTNoVigZedargfAoeiTtUtXWdjhhJbklofecIMaburntYAMdkoocE"],
    ["RshoeJfOIlimitoQZRWtaclOsbNdwfkFoawareLCfdvdBeVNteNJodsVSkoocgJs"],
    ["dVbqjVVTnJrLueTgaIoRNitiXFawarefwEdoQUDtoRSlburnlAHeshopboybjump"],
    ["EybonelQGuseNiTHSbvsfwfGIagteaedwoawareadwolbmdoMLZLOFJrWbadIFIb"],
    ["sXYtfostDsMFyAaXbDeXnchslXMrebthograderowVGQblopEdnaQowXYeohswyE"],
    ["CFdEmrawhAPrfEAdtwiceeXnrYJbsseaoAohtcsdwnofbauQepioVtiXXgyQOLtY"],
    ["TNGtyJXJEdpffuUdgradeobedDtoNisntohBrkhyfbgLobSciWoobonelJcyQZBX"],
    ["dMworthNXrenobCWfCesuittfegradefEoeEstWiWLldabagZPDkTnactfosBDdd"],
    ["shoeQNCOlURYmrawqievawdYOufdnaaResitLpoAbnuedargTuiittbJQJywthBB"],
    ["tfigipGDpmujtiusYwolebwLsLYDjEobfsyoberoVoeciwtnZJlrYEheUGBkdOQB"],
    ["timilcHQLSglCoUbSYisyobosffZskZntotpLePeAVfawareHETtEgodtejhLATX"],
    ["bBcERhNeowfaMtBoyaottaKhRrlNepEsZmktwicedaorbSuPQdogJFXqsuitgift"],
    ["yubtfFUdawareWHatoEteibbflOidJuBobgmdPrqsJPiAenJMSIlpInAYklofOTy"],
    ["hcatpmujRtEEfUAdMbrfCiofIoJoeggekystwiceIlhDTPhdMGoGkoocSVefRMAW"],
    ["shopsuitGBpLstIQHNmqehHRbCujuloMeejtwiceUvlUgmeADPaoBiXtbadwwtpO"],
    ["LXcdenyJYOwhWUjbcookifeuTgradetrfXtMJefnJohandabIIlwarmZDIZkJZVO"],
    ["HLNtfSlAUTbietiYsCoueamwTsnsdciafgeciwtrgoirIQGmRolfdPJMbadktPLQ"],
    ["LEbAgipIyLlVwaveowoliftybowffOupgradebAmZtRLeiIuDhTUdPhjQXenobHc"],
    ["sCAgtfilPsSifKMQOCepecatawareZAssoFydRobhrZAnfSaotLZteUdehblowdU"],
    ["wFLytwRpsaQubiLiPsrbrnugdYemoeEseEUrafIFngradePNyfolkeJPburnIdTG"],
    ["dEEenobsdrfdgodoaIeciwtfbnesSRityNdBsOmeNHMXMQijklofOSlJFNAblowF"],
    ["evawpmujlimitdGeUCtbCnQtXQbedargloXlibHkyiYoVuVoZFfwKrqoGZItWnXc"],
    ["spmujHRYMsXwaveEESeMshoeawareTAlyoCHdDAiulBHboyfbecookgtHbroadNN"],
    ["ssMSYQsXwhsAGfuYotoeUeicrfFeretatigradethgHMeniwBoRfolkTXdIKjump"],
    ["badfolkGAdTGZandbqeQshoerBuntiusoDpiyVEjawareCeWdCtRDtLVJKhCmraw"],
    ["CBtgKNGGQKieHWEsNftwiceutkToPudiildlXnqtmoaeaWbWifbbpmujlKboneyA"],
    ["yVjumpAToMYsliftbOTwsFUQGMapXebnkvGawareeojtnuodAeohbdaTtWIcIBdD"],
    ["BRNDmNDVGdIdDrECyawareaUlonPdeFwirbdVesLfbpathnstYboneZytiusjetD"],
    ["DUpUHbTtllsmEayesiiuudnjOsfmijeXpVetitdHawaretdHtQGQdInUhOnrubaY"],
    ["ItJcwURfdabohKBoBcrsuitlEtawarekhdKoDRFfQeglenobKniewarmZypbIGYP"],
    ["QjqeniwAKewuIaSLLtoOibnEfgradeOdottewlttlihnaoRfkuIovwRoVsHbeXKs"],
    ["HqnrubFMSyubpmujBtwicewZTkopeVoJtblZitrcfoeoWgtoiybBfRhogIIZGLTk"],
    ["ZedEhHdKpantFGeLborogCeVVohqbifYwPNsuJpswaveLiLuAIgradeijetwarmt"],
    ["gKtbYLACitMerawapflliVEsCoioPuHuwsfwQZqiaMtburntvCewortheGjyobGH"],
    ["yscookUJoOsfKDJJbVheciwtsPoerVOihRedWdLmodenydSipjumpDolTFYKjetg"],
    ["kfYTpPJAQledargCYUoitCbJyEwfhuIbdnQorcoktnenrySoaWadCtPocjumpUhc"],
    ["CFbgyCMVKbaciuWbtodwhfblfnYopitoiegradewlGdttRFfLXnhhTDPDGaLjump"],
    ["IQEGJIDbsuitCAWaVflimitdwberawaGaotidgGSrnefheiDmejCicepdenyKlHf"],
    ["QTPVfOIOdOKfeyobawareLNNowbfdiyZraltouhnbrofblrcKmwiPukYTXXgbpig"],
    ["koocApcRPOXcoZapCCOhhTtmessbYifuvhgradejaopoyJefweiaoNdSZHgdbUFR"],
    ["enobSsEJBdWpmujMcDaYViAwcaboytOaPhtArZAvtwicebOegipedeefshopfTZD"],
    ["jetimilytGFVQFiogedargfbXoiHtZtwECduPiaVtfigqruGdeefmOWsFboneIAO"],
    ["NAMFsuitgodZbSwYtBfafolkbfderHQwototiUYonfhsJhFleiZtwiceRgDtejUb"],
    ["eAHkyCFgQooHDnEiAohhtSepcGBstfZdpmujsaiKtacCCeplyobedargWVbroadd"],
    ["FjetcMPbSQGoOwSoCfoZpoHnskedargehpAittDModmfhhBbpoiuQcaEHgEQjdIL"],
    ["gIdeohsciLbaRGojftrBboOuteockDwmWjaThVopHddOVilWFnawareXCapohsbf"],
    ["dabcQVlEfolkabiBsVNyotmARsnnGJihHeeciwttdWErDgPablowdVipKBEsoftp"],
    ["QRwfgipKbyaCeJXFrovtwiceobepoZhKaGmslJncduuLeBrBjiDObyubtfolkXbU"],
    ["QGIsPbOpEshGUlJmtosFHoAuepLebwgjjawareikdtbSodflnhMaaKtoaJUIdLWf"],
    ["sYEbbpTVOsXoomwBCOeynuoIawarejldCoHWdfbaNlPHoKJojetlpigrQbkgiftb"],
    ["psynedKTbiosVJFOYogfutDwlNnqtiMoNibeumtlJoftwiceyFAtKlebGNtacCWt"],
    ["nFtfigOCrOYwiStRuMapZfLXbrbciEwbmMrlhJolbXotJiloPaawarewSMdILcbf"],
    ["sHBybtacwhlenlBRaJoioeoGrdspmhdwmXesKispbadeeItiFVEPfrVgIMAgrade"],
    ["giftGDULawareEQWnrubpiCRPwfkwmuAboWelouqurYyeoljytFoJdfbUhHbVdog"],
    ["shoepCLgwarmUaoCYOKttdtKtJFieVGhMemtwiceZijyobuNlASwaveqpohsblow"],
    ["IDBghpDPKBYtiMSCDDrgtfilMosZjKtdwILsfuaOtwicebmtwolberepnrubdjdU"],
    ["NTtejtpYynediMmGODtmeYuZAFienKjCkltwiceeldogwuQnotiusGqofWdeefNb"],
    ["ypfynedQNomenobIajbuiGKMneELjhVbdtMtwicelimitQVlPKOfolkoAcookHMw"],
    ["yobFtFgFfLWipohsMemOdwYZEiicookElZLhAlteXtwicePotfosjbAhZJdenyXs"],
    ["BKmrawQNMBebNwwsdRWvoLohsrWlayroyueciwtpubisBBhEbGEtsDSCgodJeohs"],
    ["pbZdsKssoCauaohghSidfoWostCteLrdUsTQewDbJCeOdaTQawarevJGbuyFdeWT"],
    ["jJYkKCyRdubelowloKmDboIigsEpZTfmswsdenyihEoeciwtoDYlrWGFejetbdMC"],
    ["boneNQbjHwTTJauZkoIydmwEolfnpZoBoeEedargcbYdiGtpHshophhicatYRYcg"],
    ["BbFfbIgggradeTiibonelipfBaRHoHhtsdbjwWtcJhbluEeKRSoWomjEUVypBwpP"],
    ["EkJtfosIKTodeohsboyorfNEdtwiceMGCebpdesFCunnodSsyHayThYKEtimilsU"],
    ["htapVbuyUsoftSwlgbKdFGoioawarelfddobUebteVrNoAsUnGtOTnYsyJhACLeL"],
    ["gradeKGbbCVArYColIXptejnodaorbsewtmdogVshTSrdenydabRaQFMpohsLwSA"],
    ["gsXdogUbiBsbadEufpSeKoNrtawarernPtHpldHbMhFmitejJECufNZRXNIjtius"],
    ["kApbpmujwlliRhDGBooSgtIBwsrfwaveWWstwpZMcatehiXDWawarenNburnJdHe"],
    ["dYburnkyqoWrBooXLugRobIytwiceaQnCODeftdepmujtoedHBfeedljRYKKCOAk"],
    ["MUKAgipkhbevawCoteciwtcorlthNPacoofJiYtpwwiUdeSmMIlYaOfuburnbYHj"],
    ["tfoswFdPpNsoCQeVTorseVnwcthneIyohaisHrOlAwtgradeAPshoeNbdogHtius"],
    ["PdUckMHXAaYphoALTbobpioLRhgradecsttottbfNafahfuTZcidSorLdogGMsnW"],
    ["limitOTEqGGgshoeSuWWiMOptwicefiVbGEedgtplJnetWHooiejumphwfZFyubs"],
    ["mrawwolbdDDfHeTTeLcpenZKnFatwiceyttsowhNhYhErWpcHoLOtViEpKeohsgY"],
    ["ZNdaorbgBNSynediBbAXZKGpweciwtKAolnhtfilloZoiaRbbwTJbecoLPtfosfy"],
    ["CIeLmLWDQJHvrtejXBeMaYGpYGnswwdaklofsaatPDbJbeohandawareVIkoocbd"],
    ["sEburnpXCsTyubaObQeciwtSplOrwChlCmoldaiFEduwimvIboyjifMeMgNtVStN"],
    ["EPqBImkBUQIurJoCapNaiYobnawarecodtopdwtnThroeibeYOthnnuKTHhsyeyV"],
    ["wfIOeFLLaOeotPOTvMhitiusesmQhNTpkitwiceallwarmbtWHotejahVFJfandZ"],
    ["DFdsenobFTohhGLyMSgctoCnbOXihrpeaEuNpioddsgradewBsoftTKfbuyEhWDK"],
    ["ItfosboynrubtlOfwaveifeNfTQmBeiWDeiAdEblMtiAtglZZRKhaGoDRtwicewd"],
    ["JGXdenyFdtdNsuitawareEdFolwceHnpreiiWsaaboGfnNstShBTteGhXsBLpmuj"],
    ["gradeNMODOeLrPHeAepKdeDofbOmkeshtUrsulnsaVuodjoyciNPanUftKboydaM"],
    ["tApmujIXfOboneGJiOKIyIgwlbqDowiacrUubopvooScilNeoawareVLkdWtYbtK"],
    ["JekoocdEtvKdJfaCeawarebCjwDSVeJTlburndsQlimitoZsOOfZfandHADtBCCI"],
    ["NLVKwTYytfZJoXFnWedargBeUeiTtIYdAdMuhfnZblowqaobCZshoeusfolkSyob"],
    ["IJsAfADthXFseNabtwicecVortBcdrknoZfjoldewGuiooKHBmVfgVkHpdabpigC"],
    ["ZJdGblowWMayneddFdomraweWerawaSesZbetpVfhSTHseiZotfilsjgeGVAVboy"],
    ["GNypRFtRNRnabWfsOBetrgohOtdhoTsostedargehbiidWtXoHauuZeSpTOdsqjI"],
    ["AevawyubFwytfiltdaVoKMCiprfFbNKmimeciwtigHeshoelCGdLsALJsuitAUZX"],
    ["OAEKSUODXRSlMNbtyubfiMafawaremdidnanJiilUmrawChtMuMfeedcbgiftius"],
    ["PCRSkZhpqctfostowuaAoCrhboitcLosMolerawaMIyetFPgHnrubIiTIdenypJD"],
    ["dOYUNUVbetlimitunRedargryAGieYHnsdbkueDRunulAqfUiayotfostONfwine"],
    ["BdFCEBKynerawapnMrtejEmeAbuZsOudkGrbGsjaJlwolebnXLoCaoUddabfCdwY"],
    ["TdLtimilynQpohsYnatbburneGterawademliZAwjMroKuobAJawKlqoWVwXbZCy"],
    ["McookSPppKXfZZoEawareheVtbdjsioHhnrKuIhNaWMobmscHbadaupRgiftBdyM"],
    ["bBWFjumplfolkdZUotgodahEwWeCFbtJbtwicerhoDWYuGotndenyqwaeSTMjetp"],
    ["OeXgjetUboyNiAQLXhTVwfhIqsMYoUtNpuldlCrKmdiebRoWuoferawajgtftOYL"],
    ["dQdFBDApawareyoKopmSehuZrJarssQbbsBtaCsBdhIYhwPdnotiusWaaeLtfigb"],
    ["buydenyCDpohsOAARFAYblowwtbboneCoMedargwrdlidNDatYoTuaZrhTwgRqbm"],
    ["ZZevawCjWZtejCupFwkRZmiXbolspgdHalofsSaHdbfeCeoSshoedargWKFdDHbd"],
    ["dwFboyECVopohsySKrgMsuVBytYcbhwTnhQthCoKePfADiledoawareHsBblowbf"],
    ["CbSfbOGDgradeFNdwolbliOnFaenobhakdVPwYRclcsoftDyoTatfigofEEtPOKb"],
    ["JwaveRlSQhtrowimNUbsKMfrAaunsQtadirpjetwtupawarebiHtEGWdgDGhIRPS"],
    ["kBLtfospQoCbuyaIGqoDXtJQOnuchXJweJpigJowgraderXatfilttQvCHShyobe"],
    ["yDAUgwTWuZKoifOBbwdnXomeToefflrvgradekaaLtMoeiwwFhhZdJhNMsWkoocc"],
    ["cDXgipCbFhOpohsrXkiUEpOoNoderawaboesfteducnoUhobyYyfRQhaAYXtTFsd"],
    ["ZWRfLQXObuyebadXLbNegiftgradegfEcookrioYFaUKleHdFdshoesANQmrawOs"],
    ["UJWpmujpRIdZtFZoawarealhyonGeicsnldnmsJweeMirBsidbtWVuVnsuitRIbe"],
    ["XkDwbyHNRlKsaluFeohssrobbfBpWemwrRQawareodQtAPndaVnhXiZKdevawMGY"],
    ["WBwJINMwQypohswasgodlPorFsVbFbrmsheciwtOhttrPEhOoaaDdWYLepcSwave"],
    ["RJlACyhpTspisotoPisumbahgOieMipsjtBIrJtmePgradertDeohsFaBPKdenyw"],
    ["GeklofOjHGnevawutimilLJmPtfTwgiptDerawabiGeiFyuSuHdAuruQsNKTnqKb"],
    ["abUkoocEbnapohsYerddjtejwnosGuESeooasNmZIvlbdeJpFAaedargWMLwbOXd"],
    ["bZkpmujaeuXlXNnSvcrtodYwaLhnifAowdDifmClgradeNibBRJbefIlHjetdXMO"],
    ["IsjumpNdMCsDLNaUHpceObJctawareeoftKetdvoihNYoMaklMdoghwKLbroadsV"],
    ["UyobbKVCRUFlryubKfowoPEMwwedargJoZYidvTwlgodhQeaeliftcGrbPshoeRm"],
    ["bAMpohsjoCIUtCGenwtrdogtetoedargswfliFVdFuFoeuaPPTiGsbqVYYBtyned"],
    ["daorbYwXRbdenyaYWeciwtrZQlbhHymIBolOieosDwodoehbOJwhoofuXIsEpgKy"],
    ["jumpggipeCAwfiYFDnocbofAHlorhYltbOobpiUkTagradeddtejtNafXGUHhbRY"],
    ["lOnwaveSiTDrTMfGmBsOuFoJiPAsfblOtwiceZkbYanderaVtiusdddRtacCtfos"],
    ["HCcbonepkVWoandmcldaorbueaocMkwjvOtfhFoBaCHBRilNwGgradeJTXZboybf"],
    ["eedKpRYYCvoamaDGQBahortPadTwsrahnerawabwdBnecookSYYisyubshopwsRI"],
    ["effLIWdDneerawaEiveiblowwadIhSrKfwdFecbtMoSotofGFJlegohAOXjksAQs"],
    ["pTseXyubiFnskoocgoUpeJGkbGawarelYyMoJtdoKnLrJVhfBeJtjumpDdKhJdab"],
    ["bsshopEEdesEOgipealeciwtBvborMSiXsatwdbmjCowiuLieIYfruVltBXntIsH"],
    ["badqMEtIdnahuAaFpwVtwiceaotrbHemtlfoUurthbiwKarXSGlOwGXnCLtfigVR"],
    ["bsofteEAAoWHndnacSyotiusthbroadQasifynedchZerawaJoJefJNTHpSdILFD"],
    ["dstQYbhXcoofPatFshgfidrEhRiftloOoZLerawaeRvefcoABaXdQalDwZELWtbX"],
    ["EedargDEIAarburnLCobepTewarmosYvVHbhfysaLWsReHywtiuseQuQHgipdEbN"],
    ["boyStQNRUpohsfQpfRburniiWerawabgyRihGcrmWuthKoorBabUcoaapGKEGkdw"],
    ["IliftYhCwTbaNDtNYocaDnascOredrpuPhvtmuXigairhbAtwiaedargDwpRfCUF"],
    ["UHRKpESbJKdnaZaFeciwtdlcjPhshiUoeuhimYgotomieDikpFtpOffQYenobNtK"],
    ["btejgHedeJQiOobalYfBhCrbotssshopwPfsESaPdogoeBdPtiussrOENAYgrade"],
    ["TtWWgyobmOeiQEhOrYfjdOtKatqsowrWwZuugoosXiSUilwhtgradeJoklofAbte"],
    ["FCboyBJDWcookUISdRFmrawesrboneovhWeNPTlaoMgradewpgodsCbSdaorbjet"],
    ["FNqXCAeeJUNuTnJvcftwiceaoewwjeZwoeHosutQkdLhrtmHklofRtapIeVgodhc"],
    ["gSfyubTsigZedXuSpiCaiiGXffbSthXfotWtwicelPsoftYekPHnrubdIhtrowCB"],
    ["blowFRLegodjedEntwicevToJIsehtabJRfhtiDwyobAofeFKPBXKpofMworthAs"],
    ["byobhtapquBlEfQbeuyoLoPrEniwNsAoBloerawaIiGbtTFdUfHTMandGtMItfig"],
    ["dPddabZjawareTeGoJbdetACrBeeUsCmbntplDsryLgiooUaOoQUuhwwdburnssR"],
    ["jumpcookHFQMevawtboyVFHFAedaorbZtwiceeGJyubufolkandDqhGYIpathsBR"],
    ["eohsoftEKbdDfNRRawarevawbgOdeJHluiNsdsTiyphuZVsmZoZiKDRipEQtXNJt"],
    ["htrowdogKlMSwCRstFiaBwPhftrfEoWoimeDtlwegtwiceoWtacVublUeniwKqbD"],
    ["mlftfigQrioIwolbamlsshoewikJsfVGWtwiceMAtejUQergCBbaddidOKDTDpWA"],
    ["OdaorbYRSbPDUDQatodenynbfnApOdcoiedargoylLitXIotITMhYWkamrawcKPc"],
    ["ZwaveSbbbroadeokXVSKlylNbDsoDoIdcuwsfEnjoMyDeaMuoQawaremkshoeKdp"],
    ["HbUJwaveCEltpigZbpboebadometwicenuliHsuMejomyhHqOFwiuoPJLRBlbpKO"],
    ["warmblowZtbYHJVEyRedargXoFliUNwRbKoeuZaTTUwynqvgfolkuoeohtrowbbd"],
    ["bUPDdeefodabWwKOnfBXSoXBesedargwboDiftTalfaohhSvotlnUcWewkXZdyub"],
    ["tejOlwdYbMoiMaeFaJmhMrnwdipfsmyotPoBeXplRXhtwiceSKsKgIhbJcookGXc"],
    ["YGOdenyUpwineZYNsibroadXopgdfolkfawareBtttCVneaFIhOoKcsKFLbkoocs"],
    ["eohslyFChtapiuULSPGyfbQtqjJotsfbZuDbuiRrCmiigipoVpterawaKACYtLLd"],
    ["yOFbfwFZnNQoooXAeqtyllmbdCuikerudnaimbarawareiwnREtejtlUFVtiusGE"],
    ["eEGeptdOvNLWnaeHaZWdbotjwawarebhaYotweNPrMrfoJsUmBtilZFsTWhlbdna"],
    ["EYCwPTPgeQjpohsibnNuSrXfJlocmVttwpobhpJhiiMwtiFVnggradePejetpQVf"],
    ["HjweByobNGeavZKUQWdtraNwawaremwoposseXUrolhausXtheonZishsbedDDtH"],
    ["GFenobwREKUMVroHttiusolUAerawaeRtkiGndbyfFluVdotoZGoqbOasLRtfigc"],
    ["evawSKbdIXwolbonDbptsYnagradeoeTPotGwifSTahiyOutDdnWOuCqTeliftbH"],
    ["ZgtJnrubSoRerawaYdMdiHJteCtaAuisvLeotuqhabjrsfEowoHbZNopLydeefZs"],
    ["JqQsbonePQuMoKTepAXiHftvawareitatoGfutawhrBsoSnyMtbuyldoIhDGSRkb"],
    ["BqtejfpRNSuXPemdVtwiceuoAiyKedjgQmbnRtkWdilIelUIaloWodZUbRwfnrub"],
    ["ZDpigDPQdICftejsawareNPhoebphiQorvamtnhpbaduarHcPwVjpuQOStiusbJO"],
    ["wbEMONUWeaedsboydovlahMQErheoooXOCesWwrpTIgradebwolbstacdKQtfosS"],
    ["boneAPwKdQtfosoeZrfeedrnZeeciwtiKsvsEthwUtuasfPpEeZiwiZiGjBWtlBg"],
    ["wHhgiftXwodtNFmtbolarUrffuleboaiDerbbtwlFZingYaHBZBhYiWcTtwicepR"],
    ["bcCPkooceKaWKbGdlWUtRrDaotfiloJbwWfedargGJooidWaQhORshnZsevawdcD"],
    ["tiustfilppatheSEiwKSeQjOgittwicepnfiVZuemeimFKnquJgiXoOHjQClbRPX"],
    ["nQTWlGlQrJAiLiOyusmUfADobistiusbtejeXSdIwaverneHRTgradeAmrawOTfC"],
    ["gipQfolkQtLYeohsePeyubIBvtwicewTaiwDuaTpwmoHrqabFilmJtoDRlbJhyGG"],
    ["fLKptfigtedargEXiaitUdsnuPchaZorsRKocpfuFVrNogtbVbQhiMPaNWspSAId"],
    ["wNMbCBptaCoKfwmevnDeiwujefenMojttdedargifJLidtXuiLHohhAslBgROcIA"],
    ["IDtenobplOFerawaitejiZStmtTwwuZhiLiaglqgtnruiiiGemHfspfAMTtFDRDt"],
    ["ddenybuyetfGeohseKiedargfFtmiVYiSIUiihIptfosulcbCUpohsQoWFDBTOZy"],
    ["wInrubjbBandGerFGTvHtoRDsfbeamAGusedargIihliRabMtooEhwaTFpwIScdG"],
    ["KHjARDOwteFegipatePDvyFrtwiceaomcoeupJwbornJqoAJotoYVPhKkhbhtaps"],
    ["bXCdnGOlpoMeOriINiyegmujtsgfiiebsfstStfHuoieciwtiHflrERRtHOtQdUZ"],
    ["pOMkBMwTiklFtaMbgofevdoefojeaynwjcXoioXoQurGbhDlQbmtwiceVWZpSBIb"],
    ["PynedbuySHLZlTBLtwiceiWIiWbQhdfImjAleibtiuGeoaeTlmfXdwnfLpUenobd"],
    ["wyjumpBUoFuXkooclCBbdabCedargBrZbVreZbokIRveoIalMaRnsndowWeJdsAf"],
    ["dfolkHwpcnsuitiaZhaYDAnttwicetehZGceiHUwNaHmfSRatTidenyrXleohsEm"],
    ["tliftkjMQaPMouhKcDcomOtBnhcphNrNrHitVToPuWaerawabpXPfbadynedandU"],
    ["giftIybjEgipobubDWNblmyrnKfoppHofrwerawaXouEitLdRWlbUhGIAQPkRDcV"],
    ["DsoftbXdAwtiusfnEopyRRoagradeRlZEttGrekeIhhRnevoDHUiUashMXwLwERs"],
    ["wNGyfbWMoTFoolelltIbloviesaVkwambjscYMwiToueciwtIInmrMEFdnaepdPV"],
    ["XEdaorbdsPboneUeYsftNdCnQDeciwtyLEerbuVpXPdSdusosoftYDyhFyobHMBs"],
    ["MdWANKGsderawaIuabdeQJkibbeasKltHQulosomdnayorfrynedRwbaVeohsZRw"],
    ["AAIFhdwtEgZJtaafcookrbriddIdoBmgeerawaJsenReyubhfBoXsAWoFNAbNsMp"],
    ["WlshopbwAiMZtaEoPmqRdfAldiKuKCobettwicesnbuyTeIIypathKtAenobgodW"],
    ["ZbQTlbgKIauHiuiLbqnyfrfVrHudtntBoZLifNHwawareXRodwinetClsoftdCFb"],
    ["sPApmujyHhOckHoCqYolabdPMuoebtaZtfilLpoIZfoedargIwiottbZUIggYhWZ"],
    ["eIhgVUOkEnittMSotfoTafJotelbNpictwicebslLgmuYuoMLoiPqyfAKdtboytP"],
    ["GbdNevawPlaqeXEGhobouMAOtwhtwiceasKsomeSpnhQrrItIodCtaQHpjethwSK"],
    ["VDFbtfosfWQubandedarglRLearnItobdoYefbowGrYisyuHKblAHsFyLTtfigXT"],
    ["cookgiptcIevawCaFhbelowcsdiOklofoeaerawafWnofPyPtSDoroNDJMYVbbZQ"],
    ["JbbuyMYwtedargLailarXbwvuooNeaoeswrPrsJyRDbmLMsQIGpohsQHdogenobT"],
    ["QdIdCjPVpawareeemoAsQenturghhissjboowousOEdpAieEfeedtOFUAHOXdeny"],
    ["godbZNQbeohsrYlbIdenyoeVAXqswlaKUAhuoTQdEotwicetptfoseeQyobBAjtX"],
    ["KSIMmcYDlIQrUaeGLiaBHtvwXwftZiaosiUtemwlhnPtwiceoedoglubeEblowMq"],
    ["yMeHmrawnEokloffeUhqAKebdGsKueRakoocdiMdWCgradecdaorbEatRZgodtAP"],
    ["mrawliftsDUNMFIAHseniwVetweciwtveoSrboiajlPudlmwEbrMJeiKBndnablS"],
    ["RjfIeohsteeFandNfteZLEhpiedargtmgfVrwDrubAooeCojaIllMswLdbHBkHsP"],
    ["yYcAboneLoGhTNKQtpbDiZOwiawareHoutlBwdfrshyinaXtMuTafAvhbtfostVe"],
    ["bwStKFKfnaZReRGerrdtwiceumDitwudblOmeaHqAiZijvnRSfSlCeLdNtNMkooc"],
    ["ZWXcattpdaorbfitRgUbigfBSiclloVHbfZhsoTbotUtiDwonawareZyeIZpJLfX"],
    ["limitROtItfigAeJXtgdMjLtJoerawafdWfiLbtoeGCouRisenoblquDfVFREksF"],
    ["bHCjetNtLrKRfSCftcodenyifofaeGFlooGedargskdaiLDIDnbHKhBMaburnYcK"],
    ["ClVGaKdNkiOneeGblmdsnnBaoiXysfodftwiceEbmrawUerZbuyNDdXdHGwolbDC"],
    ["emrawMTdYvnliftoLKarOQhgcXewubtJDhnVlbrhjDioIGoteEwerawatERHfLRp"],
    ["EUUdenyBsuitTDyMMEsoftosQbcLQFbhUrghtCRoSoctifKedawareiJtdTpTYfl"],
    ["ccANklofawhOgBSstoDifiPogradeUffYtWkefetXhoLdnVbQoTMoXaCcOKbXdna"],
    ["OWbhshopKdutgipOCarrgiftdbnoBwXXerawaotpXTeGLlemCCYsLejuwolbsbSj"],
    ["tmrawDMEIedargPQMdiworthFnWuwolbbadwqtlIoPeXaiaynDeJfvoceJftZbeT"],
    ["SwavetacUtPGPLCLTNejumpfXtwiceeFsiykueAthmModqfdoiXobinPelAclaYJ"],
    ["hYfeedJUtwQnrubRroqtejPpolOuFEHmwbtwiceuUwaveeMjBClifttCpigRbadN"],
    ["yobmkandVsYDroLQXJsGpaoYnpOebowcrawarehXutacodUsbhCEaDRVyneddIAZ"],
    ["andboneZgradeWvKbhfFrQaNlwtoVewKodoalTsswIarpkosQIFbtfHDjetDthHZ"],
    ["djumpBwVBoUcZJincFgwhHnrodBopieuoegradebknQttTjfVyVhhGeCIIshoptC"],
    ["dpsJwolbnmWsOCHbaupZeKuyKjawarenlGtWnNdeichwinedfatimilUttGTYDKI"],
    ["fRHsoftJGoqOwGNEBRluTaXThnMkibvFtgradeXeryIuyltdooSuboFowbblowMg"],
    ["SbVfbAGIgradeIALpotYliBMmafUoZhQudiswdtcjSgWhfnbcookioaabuylXdeX"],
    ["eKUdogwBKnwaveaWbroadTrNCtcbJwmlkeQhGobiojBPilafoawaredtcJWWDbfM"],
    ["badblowMfGDgwcateFCaoXSHefrbbdkydmeurlRnNYriooSeKnXfhDadMJtwiced"],
    ["ZEtblowtynednFbfSYjrLwrimquMDoolrbuwDladatwicedowUKnebBgFKCeJtIS"],
    ["SVHSNNkWedUDPposoerawaoohlDewtcfsiBoshdtYfrMbseaUtDoTunnhIyQKTyd"],
    ["OVgXyubUZFifolkHeFfdaorbnCtbwyoboHLedargbCPliSrgEcookuimDIYwDpqP"],
    ["ZRLdAfZyQZPWrenXBtwicePUHittddsGsmDiejlshiSnujipolimIsfiewpIXMtg"],
    ["boneOCBGwolbZlItwineFiYfedargfhodSrKPtgsDeperaiXUieoscfHgEwfDstO"],
    ["bHGqwIVglOVoudVooKrBPiadwtawarebhlsosIGtXihlXofKNfoeUifGDtebgjet"],
    ["eshopRNtenobbVagPNiErceidDKwohvperawatajDWeWdawuRRAsTpMmsuitsJAp"],
    ["AMHbblowgBErwQNWtoGoWaBBOedargrYfeidbUemovRuwinelayDqOoMkwwolebZ"],
    ["tNFburnXftbEtPFgiUerawaigClicDlpsCoYuiYloIwQmqiDfsuitfSTtXtXtdab"],
    ["qYQKfbJFYuEOeuQPtwicerbwidfednaameootJdrintglRNmlyaWYkRYPIckoocI"],
    ["pIVUKSLUmllIhtapuOiikoocjysmfMYbenCsitKuneGtetEridawarenwandUcdA"],
    ["VpigiftHUcfolkkYSwaPGCoGRoHtbEongradeDcrAtAyliBuNhCPoPubtfoswbQq"],
    ["JIRFtfilSUnQjumpeworthBZVnqwuDbHGIiuobuwpigwilyoVgradeelXQtfigtb"],
    ["dXAcookGedbIdogReerawaCMfyoemrawCnansANFOedoWsOYLdHbRbadfolkYtej"],
    ["ODMVgodtpYworthioedargguhPIrGKissTdeeffTtSCHTstHeeohsMsPjmrawine"],
    ["ywYenobRoaqhtapMbrHutiusQmNwiXGwVawareoGLFYvZrtAyubetpigCHWhfolk"],
    ["NWPjetZlynedRbFibyobHrefedargontlSrjCaoToXAeudbawHAPsmInsuitVspd"],
    ["qJNEQUGkXubelowotwicedaoiJweGencmniOtndVirnbuyUJluetfosHIbVUklof"],
    ["fjpmujGVZerawaYWltidbGQpXiehtooPbemfchycfoiisGIoKgnMtAVoDXMegipk"],
    ["XXMqjgodTXBDuuPYgiftpimSDRawarepbybotbLtuulrhfaJrbotTFidnWwhKAOl"],
    ["OwFMeBIIdoWstvURorOOsfaQgtwiceiwmheWOerlQrboydbdHOaChuNOblowysTN"],
    ["dablyTYXWUWbinDEKwGClfeFQoZtbotdgradeowaItMSlinbZhHQoduetfoswyYq"],
    ["HwKtiusJtimilZCtanBsFFfDceOlsibfHpiQgeueVfmawaretWLuYQndHWASjdog"],
    ["lbbpIMAQiegomNWwmldoyuNaioKrdujvtwicekbeQoTZlsYBClEoBQsIAbfRshoe"],
    ["EMDynedYklofbdogGOOKrNIhdQFboneterawarmaBEetdRRptiuseniwFNSLsjDU"],
    ["dDshoeeEDnqISnWUTZauiFPgbttwiceieiiOjetflumBKCttosiZpohswSlCwarm"],
    ["PbptdZObgradenQlbotEtiaoaahQAauwddDMwscqsoftahILSOSZvoORpohseeUX"],
    ["KIbRboneWadblowsdBWrMUbhtwiceeZoiZVBlsgpmtfosisNiQwZfdoglOJtYcat"],
    ["MFcAenobdCwhtfosnRopiXQeagradeAvlIttVbfaOihhlVywJCfoWoDMDPwtbbuy"],
    ["QPtfilbBEWaLLMawtDctQUdofqTiJfwliPumJeabgtwiceroWTZledmngipEVtRe"],
    ["XpGdJEGdPawareOaetoFTeEbohrUttsZhGtIXfAssehIMiiXjMMwolbggippmujC"],
    ["denymrawCbcHLgHNRrChoQFUtoddibZTkawareDpodcGblfooburnoRhcGGCNwOs"],
    ["KfBaIIsCReLsnNufdenyodioedargftlworthStkboneGtdWHLDJsaaWCSPMbsWc"],
    ["NtfilgTCTDbciQNNRBrphQQBUWoSVifsteawareofndbonefiiSbuydtgwCkoocT"],
    ["qshoetacOuXIMTTYEWifdenytNberawawfretVsnoKodDDhdlOasXQoObRdboypQ"],
    ["burnpgipGOcoPBbGtRhhGPltfstCiboiiawarewmgAHRclfitfosUoSlBdabYwZP"],
    ["dXbcPTUFeTrBhXPbnXoZIiuZytawareHyfdonbmfuiglRarLbloeKdaNBUdblowQ"],
    ["nVpigSQQrqYQwaveuwutfilAbopiVQsmgradePurBttTytiaUhhuYZtwDWbdabMN"],
    ["wavetdCOboneiowFdyobugoGTrfZsDrtCQeciwtfRGesOEhiMLdPsQPlwarmRtej"],
    ["MOmrawjRMGHDIBebCVStEwtultBiyobriUemdlRnftwicedGtTFlubnFXwolbqay"],
    ["ygOIZscHooMphtapbdoowAtwfheToAyasedargnrQUiStVemYKXhhIdLblowcXGA"],
    ["IdnawarmtbenobXBserawaWchlibroadoocuLtyZpwoBqnyXRHoZeEoGSDkdCTbZ"],
    ["hgiftLTWtLtbbonertXerawaoeblibZHwjloMuoPTKowpTqyASwPliftASwarmgF"],
    ["DslJJOWpFhifCVifTomVegMeteitwicefktstchdiGoChfacgXHoEooteniwcQps"],
    ["jetwhGsHandotkhWkVJlrooWslReooeXbsobwctMBaefsoftAMdrRLiYCgradegL"],
    ["RJeohsBdtfdenynpberawamVreiisuYlodnujIibaeiDqfHudtFNtYQyGRTOVWWO"],
    ["GQfTUyYwKGosOoHadelSsbGvwnkjIebeaoaedargrbltYTodmNQeTQaNsuitbBdN"],
    ["LBwOpBBwLenobiabgdCJlrgriefSmbNofeYerawatfbbiSIdHuDDahTFyliftdcN"],
    ["GPenobKEGsEkLeTXbGhoMlwMsuDoCoojXsycpwruVFeciwtmbadrYZhpgiftdnaT"],
    ["NVsQcookWwJsMENBXapSeNWJevawareXoetosjdthIhrehfysWVtAooNdnahsbWp"],
    ["PWenobwWwmrawoWwasTBlTUovLsebadrefbeciwtbAoMrQUhuwolbdHLyPZMkgip"],
    ["gHIsoftboOJddfUodawareJnMcookeNecrIyfdsUbaYGoWHsSDtBlbAVdenykRDL"],
    ["KfliftBsbkedargheoWihFsoloSthoFeocrUfcdwwoctNeipwUaRnniIVZtyegWX"],
    ["bfSUQwEIguesuitYOiriEnfBjhpnheetyutwicefSumrQTdiLUbpoVPlSgiftwUD"],
    ["VskoocXARoSMbaNRWfCRrtOLdtVpoanderawaveeVteydYTohSUsoXWhliftsbKs"],
    ["GfdaorbCwooIcatdgaDlpAaDMqvmkbsSOJuedohDPjHieJoWgradeHecWXDKftRB"],
    ["PyZDtejkyCnlSbPoociedeUobfhodlbctTgiNooMawarewnYhtrowfeVECwarmTV"],
    ["gipKNCDbbHUmrawloKpohsOoyltAyZfwsiUeSneYhmtwiceMoibuyuddetCGCVqY"],
    ["hPkoocJRtwicevawrNSjhyubobQsuiPDwafshmeLXdheJopfDoIQeYeDpQdnadCS"],
    ["HdabwyubVcoUbaUGUVhgtlrUBbpisfomgradehiwWotWCfogQahGAWOpTdVPshoe"],
    ["tRFtfilJadPddbCEcawareaGnoWLHeedrrwarmsfubpBZRLsbiLRsuitgPNAdeny"],
    ["evawWHNbDqandfPlYAuRMenoetwicerwneoIeduVijrNUtbRwKtpohsEWLhNmraw"],
    ["bKggiftAuZHiIVtkydLYppfowerawaioabYewtlcroUishORmnnSEsAVMetimilO"],
    ["QecookCKFvBbbadpwaFluSamowshiynurOEstfdjtwiceatThTINCrpROZenobdL"],
    ["catJttIKAVwffATBMToiHRBtsslaXsDiRsbnfhemNBedeovidabreealUgradewM"],
    ["XbcMWLYKWrRhdabtboneifHfMawareSiTdOdUeflbuyCednaFsuitnZENCsoftyO"],
    ["ZFXssuitEOtbsmPfZauNreWecrIawarendwkobadMeHlrRQWJnLotandFyTfhJRC"],
    ["wWPNeniwaVffMXGdvQKerawaeNGeiUtowefdtharodnoUfcbloPolXoFbgNSbkPs"],
    ["mrawfHbyboneNrYotYegoUpbidfaioTMujdehfdTseKsiotHZtPVghPABXPtwice"],
    ["CynedKJtcCXlwKQfShWKioTotwicemlsFhHeBbibdtPYfjotnaZshoeyapZshopt"],
    ["fZEpburnDedargdMFlitRmaclDihBrboViymcaLoZafniwNkQEntetZFtacdMdLP"],
    ["jPtiusGUusZdnaUpmlsXbadapiZeciwtVmELrBRhgiftSdtCHtfolkeHISshoejJ"],
    ["wpFdenyTaaNFrjJTrtwiceeQmhHLTSstbroadwksboneoldMSWSlooYTRVbfgdab"],
    ["sEeohsNLksgipPhZlweciwtGooMrwarmflGMdTowJeXKyNwoUbbuyoTlQLdenybb"],
    ["YBwineAKdkZatiusalBqvVwZooSeueoprfoKAilibhgradegsFpmujbtyubFQLYD"],
    ["KlOwyHDFtkieohsjflpmbleWiomqiteLgfuTutZbUEjsuitSZVawareZYUCdogXt"],
    ["gLHbeniwohltevawdoteiYVFwAcaomWWMZXhphiOshopijslHawareeQpmujRYft"],
    ["dNcookbQoBpQDSrSgradeyobYTtUrKaSgphbkedPLimyulsBDNfuurosMXJtjbnf"],
    ["QefolkepFnsdyQniRiIseuogtwiceebIiTIsXrfHmRBMoAdXisuitfLVlRJgiftV"],
    ["gipQStkYCImItalygwuOicosiojsubfhfrRKsfQottwicePeRhQVWerFECNQLdVd"],
    ["TsWhJQTUyhKtfolkUoQrpmujdeboptyEerawawnHKMectoeNgodshldHKAIQsbAD"],
    ["bQTkOMVCubroadQGyVwolebsYpfcLRoogdoeyHnfJinhioetYTfashbHFPNtwice"],
    ["gjetDCXwiblowXagfoPVwrXityfomPRpNErerawaHtJFiODthtfilhQhXCenobcU"],
    ["XandynedXpathCVbBMjumpGrsXtKbYKotueerawaFfinitddJJitoueEGEGlMbqj"],
    ["tIfolkcefKRsRXoniRKFsLoogtwicekbPiMtacrdGmpmujedJiwineKTMlVLfdna"],
    ["HdLeohsFEobroadUUgdKfKSmawareCRrtpQZenCaioULdsiwuhStejswsstfigUM"],
    ["PIDTdVDUgradeafAlTRbrobEpiPtlehKjamkfossujtigiwsmeVhtigBptOJQOpP"],
    ["gipsttKYJyobsfaUAtwiceicblimitrlSecpmujdIKloenobATGooESJgiftwkWK"],
    ["ZJevawZKcOTtiusVehdogHwMnsiOklofiobedargwfuNfUtbHtrpathuNBnKWLNy"],
    ["CeohsbZTttfilMaKftFGKYddoBerawaMsPSiGFokpathuKroJagipqbocevawLIc"],
    ["fXUpXdIeoerawanOlPitBoMJkSWhbrNUZkydcbTsDogeOboSboinJfuQTcpytFVy"],
    ["JcookandFZtPsofteWQeeniwnKtwiceLoEiftupTbDmfiaqcJZiPtlaALglhJtZY"],
    ["GevawDlpVbDIYiWiSutIfwPgcyitfomOWhmPelretwicebanJFledawoYVXSfdCb"],
    ["TjumpLStbelowDfbeohsdiupeYsalyikHvosdgoGCraaeoAQbAbwcrHUPUPgrade"],
    ["LFScpohsdTFghjetnWibwifSafgradeJtMZorKefbiOamZdKaEudTYEDdNHsnrub"],
    ["enkWyobbvrlsHJKlauoAsKOowbfpAebwOdnawareMWKtOtodAFZhQaaGUmrawcdK"],
    ["tejFsylgENPhoiisOcobmpNhLphimTCoSMtifrGeawareRaGsuitefXwDFJFdeny"],
    ["cnrubtJfoRUyfHoWoWKoTlZLkcsbkbuyhOhtimiltLViGgodawareEKTpFRGtfig"],
    ["IlnwOVbdObiraPanbeZfurdauldVtbmGyoOrkKVRtwiceoHQtimilsoSFdenyKsc"],
    ["sLwolebUQsRTGUhAMbeciwtUsoBrjlrdunbudioeiemogfwntpToytZyMAdcatEN"],
    ["bqMGESDjrPuEdVVeoKpimeDtawarernYdltbItayIihlbgHwLfeohsiYEtywARIp"],
    ["IBttJBTwYafhtapaciqttUPrlFiuTfVmAuAtimilsgradePgLVbadGtoVburnRYd"],
    ["BbGwAQXUeedargeOnlarQFvHooomepaYbwrLoswHtMbhIAsdaDsMVyobcblowgBG"],
    ["timilABXIVFpathNdLZXMsIterawaufbtneZOiLofposltIyiiCbsoftggWLyubV"],
    ["dnawarmbDKptRFosgradeyuKUGtGjiIKsShgteuWhtimiltqoWMKAfAOpeohsItU"],
    ["OHmOVbbCcaQrtueyehnfaylonSidAwoboleerawabnWUfQLFyOAwolbNKhtrowPC"],
    ["dtelDXjAesiviDePehKuamtpfoEqswitpeOeugftLmntwicePiuGlUeQwIIjRZMt"],
    ["ynedbuybAcCYdtIoRwhoFfDnFogibolegradesikJtVylffoChCToGtoBLALwbCc"],
    ["gradeandcookrcUJtenobeaTfOYKUAstoYbroadssGBtfigyRtfilNoFGwolebZI"],
    ["gUDpmujHiKsuitAKpshopNZQpJsdaorbaCEsjRRotwiceeFnhdabArteAgiftEdE"],
    ["kUgiftewlshoePnooXsOSVirfDjeciwttejurHhhtiusmdtCVSBNApaGMZdogYpT"],
    ["gsjELPdXDiseBfaLRJpetebKpawareHkmgoUOdlSuirAcookjftAfBGIFthenobY"],
    ["pUAVtiusEojumpyBNKheLnhpcHoseJtiDhUdJTrgsbiejSoTGoHerawaPytffSVA"],
    ["tfosdogFXdAwolebberawaPMOoVeXadXtRnssavDLehebsUeEojbroadpXDAtius"],
    ["aqBfOMGYYnubonelpTdiClitawaremkitbXQitXuhobtLRGsNyBumrawtfigyFKX"],
    ["GgipKQdbtgiftJelBerawaeoKwiyobfwbEoufolkuNjrqHQErGIetEAGnsofthNG"],
    ["wDJAwZQYoenobUKBltliftPtbeelOHefbtwicevoRydmuDasGoWiNqwEgbPtjetN"],
    ["bCtliftCuEcigiftrByhuEXAnuZpisLmbgraderyRRdtYafoPoLhwEJbgZtimilM"],
    ["cUSshoeCqoRICMJNyuoSliftdoikVWMpdaberawaFnoytOatXAaruHrhgiftbbmH"],
    ["DVbsPRgGcooksiYZyInIpebVsseedargohKFXCodfopathaWtpOyubdCZPevawQU"],
    ["sETJRTYKtsfeohssfQeciwthoMerQJiosNdFdWmpgynedGibSokoocloFQdtacKy"],
    ["EtPXfDwpTeteNKoikjeedargldsbiytLoGuonuhUfrTefXqynRdELtoGLblowbLD"],
    ["CyobLHlwsuitUieaklofmnbrqVFioOemdutbeOlXRnivQNoZBGaerawaDwjetKUR"],
    ["WHGqyobfcQmPuNSoawrYQifltaawareknvwoLPetreRrILdBuDKtsuitbWNhEpig"],
    ["bVPGtwWlVaZCeoTibsdOjlUmoFsppbKinCoeciwtehYCrQgVswavedZBtfoshtap"],
    ["MMtpNbpnEemdaBirjuJdrfgujtwiceVbsYNIcesODhVoAdMsOFolimitWkKpyned"],
    ["YMpathFIEeohswBlbtKDWoUiRledargfdAoiJtbtNeMwuhuKMeniwqyFgodytfos"],
    ["ILLjumpwRFUtPZPiURtfdnantZiifVteRemlekeetwiceojnZYludoZodenyqcQb"],
    ["UKektejycZlvOKoTBodcabwsfoophwohgVmkBiloKugradeejVZUMLbfCItimilO"],
    ["tfkoocRpeotjumpijlNedargWkAIibGGlimituGdQeniwrqeSAAVLnDnwolebEVy"],
    ["dogqyobVeohsujetZGdtwicecbelowetoNnfpLitoVyQomDWkBUEiluTCORlSAkj"],
    ["DwarmDIbDWliftoKevawDybtSbIffQuagradeXrcMoLBeinTAanddDhTKdcookGc"],
    ["tdbuyEMpefrHIPHavXoeciwtaSEssPWhwdnansZcEGbroadoKVuyobOoZbliftFk"],
    ["sdbEUFYtshorpQFfEsogomciZMepdaugsYRrtadjugradebXiVIhtapZtVeohsDQ"],
    ["FPwavefysYtGZoosmsFilbhOrEekmobYawareiebwYVjdTlOGZBeRooAdogtwTwU"],
    ["NSfMjumpkPdedargoboVihTtoogfthyecnerVncjDeoOeCBUdwUdQboyVYtfilSD"],
    ["shoeIARIpCGtwolbawarelWgtoDsiiRihrDfojupbttTIfeqahRUJJttdDgiftGR"],
    ["kPshoePYolimitQYoqXOytkLcTuoGflKGRbifioLgradegfbmrawetNuWTandQCy"],
    ["pwHjumpbioNtbBSlgradeuQoYtYGlirwIhRGoYunIbadwKAqwavetfilXFTMtacW"],
    ["mMyStdogNrfndaKXesaeeacdoEswedbahsBeSdMosuKVrAQrHigradebFtLfolkY"],
    ["VpynedGtyobsjWiTMhJesuHfhstsseneCtoawareEfrKMUudtOOoAZbKandKwYJC"],
    ["dNworthCetfosLadnfTZkoocyifXWgIFTlYerawabGEFiWVDabonehHXdGhtapcH"],
    ["bsIdttZKeTsUeieKlbLeYnujolubrAyswigradesZfOonNoyLtNaZfoOJgodtbAG"],
    ["BwBycEYVLabqooQAOrrSuboKGmowpiRksSawareWghdXtvNtPioshoeePQppFJVj"],
    ["HKmrawLROEsuitsHHffeedhsYYeHZbohRKtiCapowavehdVecZtwiceZandtimil"],
    ["tddenyBFyarftXLGXoceciwtKlbesEugjnidWsisuIrmBpRhmQVuiHEopCOObtPp"],
    ["pEsFEJZIaWusECXXtwicebuyhytgsreUMnjohndbOeudoRoSLdmbpyNYIIpworth"],
    ["bqsuitPwrHueohsaoNXiyubvawareWmedoAdltrMnlZaiZaWaeDbfEwIEbXDtENY"],
    ["ebbcSSIwnorChLYainoMpiTrweawaremIbdBtQtfHuSIhgfHHytiusiKtfilWAgp"],
    ["tYOGLdDCDerawabWNDicookygoduyruwKpNIqbZaWaliftRvBtVburneRhVmrawN"],
    ["dJFdEwOAafeYpoCLbnedargDyLkittobKwlkhhdoGaoZocMnJrfSLoYeSmcatNcB"],
    ["tfFBenobtedargodfeiVGwwsidGuoJoDgBlrqflAjytitAbCehoGfFJItTVbMtSR"],
    ["timilLNceniwFgQodKNcpiSoerawafJksAepttUeVhmshAogXuoKshoPjQGpsdSV"],
    ["KtpigfbCQLeRUeobdtwicenocatSudeysBotlqRtAufrTifMOiiObofVgQXtsBWt"],
    ["EwinebaSjetHLrnwSdQXDodoWerawaelmfsetdnbJrehsfyNLZaeosiGDPRwdeUl"],
    ["jumpWQVwqkoocDiESuyubnpRtwicedonigMeeWhrmioetBsuiffdQBAbltGLXYBD"],
    ["GdaorbDtqyRTfdOiXunRenbuGXieeausjRUedarguboytZnWmyubDCGVpXtfilWB"],
    ["tfilJgJgpmujibloUZQfeYiddUtlTTmsFrowZSihHweciwtotacsTnBeQtiusGeO"],
    ["YBdRDUbWhUErgPuOtwiceiytrfGwbspfoXibousowJlgLlrsMopohsenwJUeniwb"],
    ["GYywblowBufbagipbCoFNrWwVnlqdOmoeBkeuBZlAVntwiceUyobHWebworthQEt"],
    ["npfHBbYlbroeGoSilsuheyHmoXsbsdXiwmdeciwtQgrerPUbSRianduKOQRpwyDR"],
    ["XqgipflXgLuWGeiZitwicempfDJmediotbWGrtthwolbyaVsYnMHHuwDGeeniwbM"],
    ["NMsjAGDsbefsuRJuaneSemCidoeJErptXbdgradeandPdenyhtrowEPXAliftejP"],
    ["ZVBSNKtLPFboygfFtwiceiiMiVbbhpgtmjluMifXiuorRieJlmwnlQTfIpathtac"],
    ["PbCsWCTaRtrThSJnTecohoRdDjIhatpPsuitidabLawarePpynedMZfQsofteohs"],
    ["tXejumpEwafoFNKPsacehEYwuRvtisSoiJDefhCltKOtwiceQbroadlbBdnabadW"],
    ["gbfXTpRdZiuerawapOfritGoZmHtnhVraYukoocbnXyjTXRGduyobFQXbYMklofJ"],
    ["dkOjetIHalsuitRKooCajumprfMcnLwebAeLhdoobVQvHilhoPawaresyCTWMwbf"],
    ["HdAQbRVwtOalfWaEWeobevBOtwiceBAliXLudnidmFRMqfoDiyubtgTblmrawTAO"],
    ["sbGRFLJJwoutdenykofrfWTFosrtniOPoVstDfldcGReheKaRtacrenbCCgradeZ"],
    ["boyCtSQTUdpigicMBerawauIUUfetRbsKyoCsoftUnlOnsKFUekefeedXdworthV"],
    ["htapbcAdDHTtouaJYNMoebyEsWktwiceopOietuEfoMmofgqthOihiiAYsTlsgpN"],
    ["RCYynedDdUwolebPVryubYNplQetfilmicgradeumKopsanjiJBoiboXtJKVkgbO"],
    ["EHpmujLjdYpfEWyeawareeotoBtsvibGrChagAhsbowolbhcePdEPoWPRYNEpSUU"],
    ["dtejboneWrKwolbtAbebCXVfDagradeisdgosKTgoGoafolkfBddSRHOtLwolebN"],
    ["QTZqlKtjVHXiuaUuQHfZcifmctawarepoQToweetoHbraodNkNatvhoNXFdhesgU"],
    ["WIOGeohsevawgQEwJFklofYoCtRGdVplLaerawabYcNiyYtFtfosuohEhtrowqbN"],
    ["wFUdtdnabimeefBVrAnrveiNoRdeaaflawarewwUdZtRenLNJeHYKsoKjsuitGsb"],
    ["sRTtEEpCLsfbadatJieciwtfgUDrOshidogTdotlworthfaGKburntcAZVGkoocL"],
    ["bMRgkyUCYeAiousAbFlpoboUodsocdffnEaswatoeBTbeoMlACawarekUdenybdC"],
    ["bonetNYwCtfosioUPGsKbludhTOseuastgFbebyhriawareoofOBWTdpwtpigJMK"],
    ["dsQteohseZuZfMTbntwiHiuIyiaqtylfYmrQuQFedimtwicenlFXAGedaPVSboyt"],
    ["EfFEshoeRedargKJQeSrXandDddsebIJOehagsuFAonEoisypsuitrfJwarmwMbt"],
    ["NfolkwjSKbbuyiugtuRKYnmifrqwweppinBuooMTgWMPillOTgradeebTworthtb"],
    ["SVlstfigZXuiXKSReijbmWKgtnceaiopIOohtdtoWRAbieFhKgradeIsYjumpffP"],
    ["pJdBeNSdmskeGvaIuchoebaNjIhoofVwPDWipcobgraderYotacOtfRnZCQhgode"],
    ["JXFFEYdttwiceRofbtbehXgiliweoiVlomatlheLwivLfosfQleOWowOtejyobsK"],
    ["tCdenySNDedargfHtFiLMebUfkFueFuNioOdqsyblobroaduIcJfgiprSAtyobKn"],
    ["NVXDpWEAWbcfbmBPgradeauQDotTlidjZaeWoAhtCdZnwgfckoocoioMevawlbTd"],
    ["dabqsuitYKVduSZJJUetfigCtegradeJffRbuyKtEFiworthFIWlbonednajumpC"],
    ["nrubbNLmkYXIJurVoVwtFaylotXiwfRicQemneSfXtwiceUtgipludXZevawXqPJ"],
    ["cnrubPpbNhtejKirAtiIFpgoRfKerawayiSpftGdogLoUhGUbRGhtiusVUZsmraw"],
    ["fFdaorbtseIPlWTfhEiCPiLooEChMVfsetwiceftyjgodRePoetiuseYbtyneddJ"],
    ["dshopTEsowolbVShgtAiQNpoqAfmKcaesuwiHatAoMitgthCfLnerawatTeHtODQ"],
    ["XTdwnbNYEBCroroXtwiceluyicWltsebmMatifsbiFftLfoHliSMJDtsgandcook"],
    ["FqSFwarmQKuFUgLGDbYibiGCgradefSgGoseltotbahnodiyudoowuToyQpbsIZb"],
    ["DeciwtLWwgthyobAooCfibuyrdMboeXYtpotlsfghnaiiWSieHftTuFfQtCBhFst"],
    ["KsIWWJBGqFhbroadXutoMkwVtwiceliUwpuemonEaisrtfeNvgaOpathewYDYtej"],
    ["BGtsuitKpigedargshoeiJDCbroaduXVFYbwltqpYuaiSfRayrfBXiOtmtyobgAh"],
    ["bEwavedLWuklofoLDcrQtWgAtatniDfKftOemSeLoItwicebsUQMludowolbKZqy"],
    ["BwevawTsEoMpmujhtltQgipofbVelKCeiftwiceHleJbmuSZYeBoiEqHVdQytjet"],
    ["gradenobChCWrvfCTtAEkeaLDrwkeoswGoadldosXwrNooCcQPmgBHfawineBXTt"],
    ["gradeYRFUShLryobcTLtweeCoRkarlsJotrloogskmfwoiwcVJTipfCaeohsgNWt"],
    ["JhtapYVTytejpohsoILmrawEbsgsuitEAislimitpPDeciwttfigrWNPNshoedXO"],
    ["BpohsdnaPBEspathtejPsZNedtwiceoFeisREhrOnmuYsTWdyiiwarmNFltwineD"],
    ["RcGjtdRBWoCFuanIPotfwmcackiboypeHhmZllUvtwiceCkaJNlebSFwenobfJBF"],
    ["mAIKgjetXrdAfiHOawareHfCgQwweGHtinokdsFJprroYPsyCutoshopJbhcDbMQ"],
    ["LGWmrawbICCqEDlCnrubuoBGBPUtwicedtUiAMeNecfmDgnteagiftiYftNllIwp"],
    ["lKburnIGiqFtfigZfNuEwarmtbAibJEtgradeQdiboWOltauuaZdogbsydTFwAVX"],
    ["MRtfosQjtOSsAHeJiYTAstUfmkooceEeiLIawarelyfolkddUoSQenobWbevawgB"],
    ["godFNtIFdtfilesQerawajoesheIShfnutesZttiirnFsaIwtooEVpUUXwbTgift"],
    ["bcYQXbHkaaIVoNlYdtsnMoLHyTesfVftnandeZeiePawaremdUwarmdiQblowBDl"],
    ["FIPtiusHIbpfsASDgradeoQAZotGgiftBahsYKhtMdhItgFcfolkZaoXeOwinecd"],
    ["EnrubMmBwaveWPrNbqfolkaGAuuTwawbZFyinirIgradeonPcookatKeXHJdhtap"],
    ["WOWfolkUebTjetJYvrStboneaowBeAXCwaotwicebdlanduRoHemrawqyJbsuitJ"],
    ["sHNMNFbMYsIIfglpynedeoooawaredwhVobYdPVstrFojumpatDCyOAMcheohsWA"],
    ["WwolbEVehtrowJNnXfgynedoTiocLIVbpFHlhBdZdYZIkietaCgradeXbmrawjff"],
    ["UUbtwgQJByJefioKWsnblondOOserosecQKedowMoawareatoenobdedkliftjPN"],
    ["KshopeTNEAdabvFtsuitXawetLfEUwojfMpedargoHVaiAtgshoethhoVAXIIhcd"],
    ["gbonebHQtiVhMHaWfTfqtgodoACtuaQjshopGipeSCgradetBCPkoocthtrowSTN"],
    ["jdcjbBIJenNhuoGGtaFpimyewawarepnwoGtNMfoaorhEUDbvUltfolkeERbhPLC"],
    ["FburnOwDgOfwRpoJUioedargBlfIittcbpmtThhaVoCrdpctFhKKaaiDNsEPOwbg"],
    ["bmbZEaEWuroCBWnRyanBNtRdwweqkiFfaOWlumWevGotwiceefboyledwolbOLAt"],
    ["LfaWeCRdbNenAEadfloidbSeoboGhUXelMtwicefkhtrowZXOtfigyubAKRmrawO"],
    ["DburnMQAcgodYVRMaawareXytbZaeePoflAvrKsbioaVPmPslwdaorbPXhtapPKX"],
    ["tKBpKWTePfQoTZvssHohPahuqhDswOtiLuodPDrtaMieGYobTnPerawaFMdftejd"],
    ["folktCBFtEPFIfZJNifWyFisbeueJuhgrnpsiobdoimAehMeawutwicedZjgodQf"],
    ["boynedpEIMTfeZiXctIeePgFofftwiceoiciFAhJklamRPQcUWtitfosWFOleohs"],
    ["eniwbmJbVCMeurClLBtoyaPotEihfwewKemseDvptwicegaoRUludiwhJLHWqpGs"],
    ["JIyKfVZUeohsZobWblimitlJUqTCpNokRguddmwLBtoieYuJgradenYjSHPcftyO"],
    ["eVAkVOAJoMNIlXZthsuitoAfsedargfidaorbtNgKwolebVppmujVsiBSyobVgsP"],
    ["PIevawtQDbuyliftWQbcuWwKBwrshGoFsaoLLilQhrawareHomdgipbfeTwineRH"],
    ["bonewgZUycookXiFYulsoftpAebAsAwPbboyHeoTAXOedargliftGEtdSgiftUhQ"],
    ["wMCXmrawKofYQpDVFGredargLFLtitLpcwwnhhioaaordgchtvluPaGsMebbJDbJ"],
    ["yYktCRtduRilKfnRbubcoasJsBrshfhONPowpioKQWawarebIvdVtAafeTRUhdWO"],
    ["gJtVboneibiRgipEfeufolkRtlsLMAQcKoGsFHaetwicetCnEtfosrSilimitTdw"],
    ["ZJKsuitLshoesQGtNtwicefPRrXdyorgZojesoidKweegfbHJWtftiYMHXpohspK"],
    ["qMTkmrawduoBASwGtoiZEGoZcagedargwbchtStNaoFtQShJvyRaeohseNZptfil"],
    ["tejEXOwneciwtHarpIhgwTruXahiiimbyNttepnsnIAhrfheetiusoEBdXJLpDwM"],
    ["VSdsburnpKaUsFwJbmbSIeoOeeuedargtvljdQtdbiaoSohZuPuwwLgIyFXspohs"],
    ["AMHtdjMngradeUPrfbsteiWuWorofUubBQlofJdqQOykatnUkoocTdaFbdenyMNQ"],
    ["swetbonehonsaXgsoriYsciuptwicepiyhopSWrtnDlNmIPdeZeEEuHXdPbFBXjQ"],
    ["PVynedbUBfMtejuZXeciwtrMleYhbQnEidgaimBsmAdoreQhiHWadBfotTwolbAp"],
    ["GjumpBXLhtrowUlgedargZiOLerRVpfbDebeyCtoNfAusnAyNjetrseIwolbCnEd"],
    ["giftXGSCZSdlimittejotfiledargYpehBrsJmenWtueuXnoLiajsBibtBQpTswH"],
    ["LbVwinetUZeBoTKfGjfldrQoseZeoetshtVwiwnhogodUhOyplPtwicebKshoePB"],
    ["ICZQeGVbgipvsPOuWcaIshEyXwhJDhoZOopijboegradeuapDttCKfmdNhhsuitp"],
    ["evawbITstacsGohTdEDmsonfnhrNpeIeaatawarewQBrFCddUBZEoEaQQwolbwbI"],
    ["POJjumpYGRdQfKwwawareNoisandeSlnhBcRdsbeodaorbsReOtfolkBUBQPevaw"],
    ["AdChdekTOntHeolAdaBdnhoSprAaysfjbceotacuXogrademGoybsRPpAkHVABZI"],
    ["warmORHFoNynedChrfenobtOtJebLadZhPlipOneWopohsanwMtwiceibuyLYQNw"],
    ["PfolkaDtRORtnMadgradecSeDWAeAilnRtCeHiuydiSfmEXqauGijumpbstburnP"],
    ["HbtdBMtpBodioBimYyNrugmutwicesijRobsgslVtlIuhisHQeRXrofDRbjFZnpt"],
    ["tcookIwOafhOEZoEcUotyCltJhMsroeftwiceobiKMKeJEwldenyfHZDshoeandL"],
    ["LpJblDblDAmilRaiOsfubodmetsejUwivKleciwtaotXrgLGweYRDdiPjnrubPZp"],
    ["qbonedabKuLBevawsuitRpbOEYbedargZukFttodyIlHNhantfosRHdaZIfXXQUH"],
    ["MApohsRQwjetwaveoYskoocbrONsfZoItwiceyXbhZgXerLoZoOPdSdndsoftEPe"],
    ["qGPtfIbPTufYeYaMdiiweOdOgnoedargWlaDtTIbbpohscIoSwarmaXndaorbtMe"],
    ["AftejwKpOeXVobXmVePlFrSutdbCGodjkerawaebdligOdnuaUouoPyrbXUfqdPn"],
    ["wineEJXRdQdPevawawareDCQoHYjepSkrbubasUlbmltudsopFhoYyofnrubwYPg"],
    ["peciwtBhmHchAatQuMoyianAjKonpebdsUkeIofVYhndycatLooworthbGMpLZPP"],
    ["QKAcatKEbKgwFCZLsuSioyobCsrsfrJEpYenhttdawareoohtiusdgpMhKEpmujL"],
    ["bstyFHEkWosfnTBlsVneoeSouXGersdfiHgradeatjeniwWnLetimildBtEwoleb"],
    ["warmPKSscookGKhtpFcfOoHiawareZMmtTtykiJihMMTolhlLynedbocYVZSgodf"],
    ["dCcIUBtyZnLhGJiuPJawifubtawaressigirJefhminmYdLoifeWTBReltliftEC"],
    ["LqDRdgKtGwuNoiteDopigfijgradetuDNttjststDhhuFhfQboymPioBTSUplYLe"],
    ["ZbtimildHoMNjXegUnKuDnokAemqydwojpWTuGooetfililctTawareGUMGyobbt"],
    ["pAEtcatRawareCXctokyZioMhrlAnounOtomkerqWhfLrudaTHLGbaEnLdabJYwd"],
    ["jetAyneddRAteyLYawarenoToScfpiobrSOopaubbSXloitqIEMkBkghOBRpmujK"],
    ["fbbXVHBYcedargjCaliGduJktoHhmtwoCwApcfooashoeircnPPGDltBdwaveShP"],
    ["TdabJcsHtfigFoEcbcBVfoCarZhtYkltoLIifSisawarePfhdnIIeftodSCFdIQe"],
    ["SYbVwkTKKaHaobACdAroPrghtmcBWoitperawafaogiptdtphXGueohssTAVqOCX"],
    ["RUOthKWPdIdVftXdawareoaMoWaMebsprXHvdsMGbuyPensSIPfolkaSwolbnrub"],
    ["XcyhliftGuhGtAKJbOYiFadXawareepewoADnfotorGyphfNltQisoDNbhgZsbad"],
    ["fpEHhbXbQoiTtlbuNflgrourfeBkowynterawapNfdiLBbmAiYFhaDuXgSFdcWjB"],
    ["blowmrawqMSbdbLMNuZXoeoPtwiceneyWopeddefIrRoteoIHtOAhUngRhtacsVy"],
    ["cwpathFQYaotfilmqBtlJUrbSuCKbaarbeiOwdUooQverawanGMatZJdeUGMwand"],
    ["bfBWpXYAuOedargHytbitdnakoiehCOjylvubcKuPaoZsuXmwSVfLWrpbroadNDn"],
    ["KPPeshoeDJvfSLUfFadZeEVewaktwicebOlsobhdkoocraucXffGtGnytBBOhZTd"],
    ["wSNDenoboUyYwaverUtuYHPtthWebtJfhttwiceobaMuauCsapsSWnqYdXtfildV"],
    ["IcwQgNLsHZhoRiHoHNUirBffawaretLtbotejfhdultiusoKreniwgEEnbRWpohs"],
    ["giftSDJOUsoftsDLKwdoghDtnoJtbojigradepeuWtuXlitsWhVboBuDwinewKDq"],
    ["yUytnrubouLWidKUbMIBymoVBpIdfnigJaPRroelRtwiceldNhStfoskkoocLUVs"],
    ["JMZqNQEfjumpuEleeQjtwicenlJemaedoiZitHntbftiusfdHtyobiEYMUOOgUDU"],
    ["sMADVHKXJsHklofEbdeciwtedlerFoinajondlmobguwyeibGUimSblQtacppTHH"],
    ["wGfolkWHNisYcookRJnsGKdhNNpeentStIawareBaAtQoRdEcThwjumpenobgift"],
    ["GNyYfUCXHMRoZwKbItlVboBubkedargyyebiYtwspnlouhooGieonqlfWOgdwebt"],
    ["hFXliftYJtPNwineLtrpmujepasotEKvacOswiaatwicenuwhZTMdrVsWEenobdJ"],
    ["etmrawOyoihqDXoJhutKubZIssatwiceLwpiWtetgaLmfJativSiJcOYpellDDLV"],
    ["AZpfJdyHgradennbXAtmeiuaSQhdryhebroadancYboyXowTliftbJZMYkoocZEB"],
    ["KRFJpigZwineAwDXbfJPpoQIoUedargsnIeitttoenHFhhefytiuscjtENfolkPM"],
    ["YfolkboycookdHEAaLpGVeFLnedargnBdBNrttYyeohsehaMworthsOcGHRtfosM"],
    ["edargHXXKershoeOOeMeHHbgtfossCloyubhwsodRVoaEZwaDpvdaorbUeBVGEQF"],
    ["UtZYmSGPRQerawagbXaiPIwiewlnuoiflIUirqntoZEtfueawChjetbnDGIkoocd"],
    ["XZQsynedMNGTsUMQwolebemEnwtawareroepobaduljorawgbbBhtdiYUBWshpWH"],
    ["GenobCQAjFItfileehtrowJntdcsGTwitoofsaLwfgoeveYCoVkedargsJNdSVSd"],
    ["EjcUWsewCufayhnoHmCetoorXpJGipbtwaveIhZhPYUtwicewolebXXKkoocdnaA"],
    ["nFwarmKMqrQgiftQfuuwineJDeibYHbXIleedargNiPdtKocWfblowaaTtMgoddt"],
    ["RHyDGYfbtuRCfnolbePIerlotwiceukwibgudbFHmooCqWKHiydYsoftlGgiftNE"],
    ["DAtJwinegodedargbkEDidYOsuotauWDoArofyqYfVrnciuTtbUHDHgbdeeflift"],
    ["tSewOOARfKoEobuyoKhHRlyJsbstfnbfgradeOUoJoDdeiTlLaGRdVukPdabgipq"],
    ["CkddtyobhKleoiEBVtsongubEAasfyrsbuypeoAsVYawarehIWKdOPdoRpmujJJe"],
    ["jetshoeLXdwwarmTZCatOBDfbWvbelWelPetwiceoiBGImudwGfLViMqdogtGtKW"],
    ["bonefdQcwoleboGodKOdBgloRrMaVDykbCeoKPnXTogradebCQybsBdujumpLWMy"],
    ["OBbseohswZoZsOFYtoyQceQOifredarguditVJtdseolhDRWAeCgtfosAfAynedL"],
    ["JyRtPObEdnAqeXasneIwujduadaoHifikrgradetmlRtEDetUSohEGdRIYQfenob"],
    ["DaKsyubHbpnfuAUlooodeiWindyhmetmeQrrsNdiSUaeciwtBwEWsSYWSgiftsHM"],
    ["ncPmDUPAracIrGTsutChYaEhbKbpiCwokgradeepogotDvfyooahaRoQcddwLbYW"],
    ["PZAdenyngipPwarmfolkHuWwVbNfbWXogradeoWlFojAliybDaeBoLhDIdtWwLNc"],
    ["sXgNpohsGsTiKpStSMeNfaRfawaretnoMyobdhrsyubOLMuEIhtrowbQgipkoocT"],
    ["dNTwCCUAbroadnaleleciwtibnJsGjMfNboysNetNSFbsoftApathZJMNCdenyDY"],
    ["cZgpburnJhmoLVGKwuiBdpPKjoterawayVlfftoGuZKbihrHbboyDgtRliftNAhJ"],
    ["ILSliftysLPsbKfuVsuBrFibKieFoFgbtRArafVuRgradegrMRwineonYtfosddH"],
    ["eohstCCbwarmRfNaobqdMaidlrXuetnlboXpinadQawareycJdNtFNtBGPWhAPMR"],
    ["GsNYdETHOSsEafsFwavebehsBawareooAYKJodpfenobatItPAGNdZaPblowandc"],
    ["NZwaveNefOIcpTUnlerawaYowiitWmtboamhSrNhlnNicaPBbdabtwUXHTCCklof"],
    ["jUIYjTEwweOKfuaNogtQevmFrifpeKXptpoedarghhOTiboyscookhAMJYnrubcS"],
    ["DbwCMVFeBooKybavJnloNrnafebpRodwCerawapjELitZdoucathYMhmOXJQcYsp"],
    ["twiceRjblobEhuLoilFumiYnfeUpyOeetbwaveAfYVgbroadblowTRJCAQdAboyY"],
    ["eSwgtyobKnbaoffPqRoevdoOJulblelstwiceokYAYmeMJwPWTiEtbuyBRtcookU"],
    ["dbuypWRXerawamJDbEeHtrTdsrfshaOehbooswPnoEoalAZyeNEydkNTdogcookD"],
    ["wyAsyobeoudfhVForbWreoXhtwiceepshtfossdIGKCKSZsVCdogevawwolbCRHW"],
    ["LwNAjetgVoptfigogradeBbdWttYruLtNhhwreNiNCinUIsuRnshopIsejumpXMJ"],
    ["tpathIbCFibMwBuEqomowarmyulilSnIIbiilgodRJfedargFtactHYNBKtfigEA"],
    ["SZWtfiltyobObYedenobrjCeSfblowSeGAedargfSQeidHdXCnROhWnCyjumpcaU"],
    ["YINCshoesVtejIWGhgfAPpDMowiedargpoefitJkprnVthSoitiSXTcoghwjumpc"],
    ["NMbuyYVkpVwtYVoyawareoDotorUciGbhrmpiguPYtfolkKqIhBwaveIZXeohsQN"],
    ["lBpmujtYieTqCOfBfoHwuKibthRopigawsgradedFoNttactDUlhhnEUVEObAdOM"],
    ["eciwtDXEOfhskoocbLoihyDQuLhleooDyMtwkfebNFadaorbArpHCvFRmgipJCeR"],
    ["SOBZWpALtiusEabBheciwtuSAtyhPhrRypruiJntWoEobeffDhbVwifoLspigHBs"],
    ["XWkUwinesFjleohsqoEeoLtOsufAtfrQwuitVHopVaierawaEZvttCKtMDFegiph"],
    ["evawcookpUKfpigjawareUDutoctHiYmhraBfshpWttRhibcWhBoHolQPTeOyBRW"],
    ["tfigKfdAJeIqoGofLoUluPgeQhktwiceFsbMEiedWusuitntyEsoftMeQhtrowEF"],
    ["pQXtDGVtawareHPitobadisuhrdnahusgtWXoTHqihRefolkfMjumpGOtacJGNXV"],
    ["RXnhHXNFRHrttfighZurILjtdtbobAeferawaJtoUMepdfSstiusiSQKYCYlsand"],
    ["gcatpGnGEiLCoVrDZNfZhwusgfKtsobupiedargimYpiRtZtuyobhhNRjpathcJW"],
    ["qdfolkWMNunshoeVHgiaWFbVsfiedargboeftdoORlfetFaBHZotdVdbJMQwjetO"],
    ["JWqtCdRFOJiuoNVyUubgibnfsgradeAomjoedltlreaoXoykatdhXwoQwSTsWEbJ"],
    ["ZWBOpathdRGfndlQawareindoQuRfiearbRtmnhDbWAyyrKcETSuNBaJwolbbadw"],
    ["KdaorbKyynedcatoGBQdnaDbfburnpTwperawabaMoiKFtlrQZhhDhomYVGscRwS"],
    ["sGtkoocAhIheTPQDobtwicepportLuGisnoCadqgoewGDcaJfXCwolebtJdenyEW"],
    ["epMKshoeviMtfilhagwdXEOtwawareFaSZooreQpHFrblmsBDRtaQbQsZJhdyubZ"],
    ["FAlimitGLwpJPNGlsiakoocigsTvfTOfCOeAebKtawareCudnrubdEayLwarmbXA"],
    ["sEAjumpAGsfLpXZXGyeciwtOKnergAdbsedpdJaouddaorbniXbuyhHetLMUKFsJ"],
    ["kBKHburnofbVgipAoperawaLcmliGbbJJuoBhauVMjwMdcByYKVtimilwavefolk"],
    ["dSQklofbeohsDUteVvgttDilawarePuoRotwjiswDryfPHuDYtoUoRSqMhbVBsOQ"],
    ["ZHBsnrubUSKFsCYZdfolkemCawhawarebatdoDadGvanrDwODepatjetblowhGQH"],
    ["UGIZAlJbgiftimatLBBfrdiJcJtaXupbehwMshirtniPStgoSeoerawaBKjbfpAd"],
    ["tfilgiftYgerawaXjUoisRLWeubdhuFGnXmrhciXiAIpotUtweohsaaQjetLORdp"],
    ["GPenobOWbroadTbOgpohstoYicMAwiyBfBhFouwWtacilsaCgradeTrDdogDbfmJ"],
    ["RcHSdyobJHhlteLApREiifnYawarefoytondBftshlUrntWEQbMQuaaIbroadbYc"],
    ["blowynedVTHapohsbqNrwLbwrZumoPuioBSildrnawareBnedBARbtVacatVVXUR"],
    ["JAFkIhcRtejlwtoVbHWoEromoflfLokryeerawaabaYiKFIwREnshoeNynedHcII"],
    ["MeWlimitbvwineCmlaGfNHrfowpleaCewiitwicegfTAGRhdtODeohscXjetMNGS"],
    ["VdabHPwtNVsnHaePJfrhrjdtIuemoewibNGinpomCpGyhFliKitwicelNgkoocbW"],
    ["GdWmHbUTNnrIwruRwataPoUywovedargeelAidCfnEibCueCoQfRLeqJbNtNdabJ"],
    ["ROUUdenyliftBpigtdNHdDLtierawafTuGoeMoeysrOIsVeubwinesdbOKburnJJ"],
    ["ONKtbVOIGDFfiuSKawaremyPkosRtiiZolyhfahloeoSoEnccbbPseKdshoptfig"],
    ["qboneboyUutiusSYVsishopMYoledargAfhitnywTttLmduaKDaNLibvTFpXESte"],
    ["RpWdyneddabPrdYWMtwicenRshseyhsaEunotuWsToirfQbEbAotEtJZPwpohsFH"],
    ["deciwtZVegEhQjPSnkiLileOylXpiestkoTmphfhofimoItdotueLaaEcjRKpbNL"],
    ["EtfilsLnMcbRuWlrHuhiCbiuyHtibombawareyiwgiftlftaandVoPSrMMZKwOKm"],
    ["sklofMRNDotworthsefMeLpNjsOtnYaMtyeciwtepinrwNhoNiuedAShCJgsdZDs"],
    ["IUOtboyfGPjheYVeMAetwicegItrpoudBiJokmlqARfwdlubEUAtVoojLZshoegf"],
    ["badIblowgtbLMWdBoVerawaSddliMUoeseotuGrohnweIqbhoyEjtfospIYWNTZM"],
    ["RXbboneBIeeytiusZvlqocatgaoAubJIiwwtwicepohsAOeYLjumpRNtQNBbroad"],
    ["XbelowGBCnruboWcJKPBrlHajfMbobVteuedargtVvmiddfdRBaphiEoNYYwlcYg"],
    ["cookdenyboyOetTmtwicenrYiLtjhaopmaKfwiabiQnHiteSlCXdhlLfGXWBFZVL"],
    ["pigemrawQtvTFHpBbaerawaFwreiNPtPiconubhCnKoaoquSeYLodbRytfilkUUI"],
    ["XpmujRNeflimitopJeBBGhtiIpiTsCfgdaXhXRibatwiceglbhIMQCDopohstacw"],
    ["wdYLpigCoatfPNJDloHedargbrVeiwNbCbtdauobKaVrCyqucFmwaverILfolkCn"],
    ["sboyPOJAuGQtmrawiGfabonetiKsnYdHlhtAsdaTNatHWeoDcZZawarewavepNbd"],
    ["UhtfosEgSgtbboyiKNiroHMfBBqponftlVPuFwebiTtwiceufsuitedytDFPUUtT"],
    ["CSsyobwndnasdEorIVweeEluCKnoFrbbmyfgradeBrtoHtZlRFaUlHhoPOcwKkAw"],
    ["htapbZXbdnTqGolCdaCpuonOKFotwiceBhbrmEeYsuYrbICtyLaXTyobTwVtfigW"],
    ["pfSDwVYEioDCdaSJglIyeevHSkccuoeewTdhobhfLaYAioRsbgradekCYlimitfH"],
    ["dogdaorbOXiDdabocGfZWlVnFhttiuseJBifRpJCYZtedargVesoftQHjIUFZhTL"],
    ["eFDynedRofbklofFhsedargtsuliNUiijioMhIpmutwbQcYimSEXoKTlptejPyLK"],
    ["dabcbQXFKURehFOBZLlBgiftpogradetwmliftifnrubMmedLSFjiVnjJwolbaJC"],
    ["fmrawpRWterawaGtfDilJtdfiFFhihoigKyKcmglyoBFOYiJbuZenobtDKbblowP"],
    ["warmcatYTHUworthbVsAsuittoSsXLfdfByPeUeniIawareagVpohsdXboneEDWK"],
    ["qNRKQOMtUudenyfytwiceouWYopesbbZFlinttrOFegofioBTbJbiuaDyobWlsdD"],
    ["KsYpohsJbYueburnadDivUNpdKrwtaKaBgaeciwtXriNsFOhmVEpSsKDlimitjet"],
    ["AEydeeftHotiusAebqpohsDjIAueohseYOSitGwvawareagaBEoVrtiwTwQmCFpX"],
    ["ynedkooctVHnTLFthedargGftRifywFoaBouoZHsplbrqGYOkJteniwOQhenobFI"],
    ["aZLtcatCKnbtfileqNdetonbIuBflosrSGiXboXobgPerawaOoHDtXZdQXytiusQ"],
    ["XqZLTRDKnrubtdabpZtiMfjFawareuiltocOmtighrVpgfRTAtXitPLXMhpOkooc"],
    ["LtfosIPMMOssuittdnNsSFfferUZebeinuawarelybtBdodQZaaYoaDQHdcTgdMD"],
    ["JFynedVIfCIHwLZpyerawaoUoLioRhrObFrhsWbmXtejcdlEhboneHoATAbelowg"],
    ["eKTblLlOnAsiuiFtiGmsfyfwwiwteiHotXaIgrSldJrgradeEomblowbMLgJburn"],
    ["WZtevawBEwwedargKbooiZOHNuplruWBtrpabtqMfncmtohdiOaCuhyolKtJNjHg"],
    ["ascookbLynsSPrFAopdeoSIbbawareAubtdUtdVyohRDZfDNnKgiftoAeliftNGs"],
    ["tejSMsnSXbLDBhrRgradeouVboCerpbglaEemeToodOfLrsdwBSboyaswaveBOMw"],
    ["UPfbHboypNXedargdiEliVJFEagoshHyABowehcuZGZronobynedblopjumpLNbb"],
    ["eQAlimitdvmrawLKerawaLMCVeewwolbtCosoyubdfKhslbSoYiFsaeJgDDldIYb"],
    ["FCDwarmbcatfNIMlawareyDoJoNnniNwblMedKhMuedfolkcrbbroadSnJTSwine"],
    ["KIFtfyobawareFVdDoCLeieWtrPTdnuEitZeyIRquholiftbshRpigMussoftQOy"],
    ["UhtapdwcYBtZXRaStUHeAtvbSitwiceRbsmRfuNaZoSioEqnEfnblowdRtRekPQT"],
    ["jsandUHdQesJCFmeAAtebJrnfawareayoWobodwblHllaMaIkPeoddBDYEbwbone"],
    ["GfeedHETpJwandlXogaWtiKLhirqmiRNsfmiutuKbttRQiasFaawarecZZdnrubt"],
    ["suitaeWtbcYTnnSfrGhoLbdooDbibMasawarekUddjNLlfTROSeooSQIPVftwave"],
    ["fHNXOITXeciwtMlteehBNEifdYoijYfidabheetgwarmsftOandblowFHXworthV"],
    ["KEjdabtBFefYTSfFtbroadondUAOlMsryrftRkHuMneciwtbTJesBuMGanddsMsH"],
    ["gsCRWUZLotsZJIMFdEeeciwtIsSjrZlitJhppdimiJbomafiuQoQeutlsGynedjh"],
    ["fbYQNdtgNerawafoyliZJoodooChYrsSbwkRcbZfNshoeFoWgiftolZEyubHkcQF"],
    ["MHwfolkPAMaburnpMCrbroadsBmBytZCbsgnhGGyEoekoocuddyrATXbPgradeFG"],
    ["jGBkoocVushoeGUOmOTpohsypedarguhdPdrHbtQeaeZerMdennIosaIfdywHbsI"],
    ["WBtJSWJsbqAfGBthrSuVoYfooQpiNsieawareOlgdZtXytdiYRhYoaofkoocbcgt"],
    ["PqANUfbwBIuGWeuaCtwicervtiVUednefmtWptJEoiKitfilslgGubuyVKyobsAQ"],
    ["eynedgodHotXRASVsphaliftLoascRdOBdftsEaZNaOtheoOZbTawaretiusTBbd"],
    ["RRZwarmAEcburnOyqPolUdoSHuioebwdCfiekFootEfedargZtejtItJJFwavehJ"],
    ["YCWejDbtcARevoLfdhtPnahieZieJtwleyDerawafoQofGMgCbwwarmoLtiusXNd"],
    ["UdogtfigNPsWfOpPXFXseQoQtwiceohsikFjdrsLmotyuLdVioeLomWMlcjAJbpZ"],
    ["CMmrawCdbtXcPYdeoaerawaenZdiEtofedsCuYrPDoRuQqbELgDliftQevawZtAZ"],
    ["HybcPdwYlnMohRoBieTAyilgfdawareWtMsuitbfTlimitLtDHYshoeIWwarmjPI"],
    ["sJhtaphSpobonetXoTfCLUrNhbttLEoRsQaerawaLVVdiWnXFwolbuydFUdenyqY"],
    ["buyblowVEPUrYEpMfOwoZEosDedarghhfpidvDsodemhVeVeGaeucCWDLJbdjgip"],
    ["GAdpYJbYhUIroNuYtwicehyKrSTdTssyoVesbmsnweuuraDefiraUTndtnwbadBd"],
    ["geciwtYNboNhBMfVZadBieAnPhdAeesrytJdXhfuurMwolbbboZpwaveFwMmrawI"],
    ["JECWUHbJUandPtoKtwiceaybiFQUhcglmWNfbitoiSeoffewlentiJRfdeCljump"],
    ["ERlSFUDwgipiWJbawarmmBaveBtwZidenToeLJtloltwiceibVbuyuGfpathFEqt"],
    ["KKYBHbmkAwaverrlhdFScoaoterawawfaUoeEdtspdWhsRFuCnFJssOiSaQDyobt"],
    ["cLwarmUEKhFLKHwOkeiDDOoQovtedargoapffAtVcwbaiahXbonetlnIyOtachJd"],
    ["tgiphJBpebadtEPojLHmrawhffPZoKVsXerawaWUUeiFburnEdXhwolbynedcSVT"],
    ["GBtpignKbSSedargHetgiRuTCaljiubkcVKoufqlsuitwmtoTeniwQpfGdaorbUE"],
    ["KliftcegbadgoIoiOKioKUhpffkpIHswterawaotVGitOrBfZTQhtEOojethcMRs"],
    ["dabXbtUKbDZltfilrWoQVoLEowdOfsFdawareKWedboneMMnCoNAdsJyDVgtacsM"],
    ["qOTewbILXuUIoaoLtwicehvyitEehFsemBattandiNacwolblpliftLGXDPwarmO"],
    ["qHZMtAbNyuUfmrawVuifYTdZhlberawaetXetkZRvBrdoFNFaOUoburnwHcLwgip"],
    ["WEVHdYpTlptoUeaOiogfvCtZmhsaoChniswsNsMrtwiceyTuWeniwrubQJblowdb"],
    ["blowLdMQyfburnoCobedarggbulifolkAyoMhZgIXVwFCciZsoftQXfYtimilYtQ"],
    ["tfilBpFMtfosCaUypeciwtPniYthbhdegaBbiaUdcBoAoedUFnYrDJfVeUblowXH"],
    ["wUdFbhBwoPoEotQarNgRnasvtwicepuehNCmhtiLQIrEaitIdabcFLeDwRJkloff"],
    ["GPpohsEtgFSboneeiTFwGwEjfbisaHdTtnlrsnaWeWmoaeoZVUKawarebelowVbd"],
    ["ONgIfdAtbuyoaEwiWBlbdaDuqkFSvEdsmuWeshaQrTihFtoYaVoedargweTCtpbN"],
    ["tfigsuitCWKdEftcWSANrefabtwiceotoiYXodsDymMhZGBsNisYKgipHlshopLC"],
    ["PygodwwntOoJfaarWeJbevrutwiceembRosudlINRrtuqiVRRtOeifPCMhBRjtGB"],
    ["DBcPTORBCJbhTfDseohsieXoygradeJfTbroadftKtfigyubgipwolbROfolkKEG"],
    ["IWjumpyyKwolebonTkooctbelVDfOiGdQijDemgIAeftwicetBVtplhLUWenobGc"],
    ["SVXdnafYltbUUowdiaPelGatmcsklbriiAMsnomutwicerwsKRXFQruJCKyneddb"],
    ["TandklofgiftwCdmtEHAoLerKedargeabBiwtcfwLoouhFaWRlnXqEAtbLPeDyob"],
    ["UpathFGWTwolbsmFgyobhCreoQsocdaodIpsBawhtfigeotsEJawareETJQKBbdF"],
    ["ZdabwKhPeohsoWtPDGJVrYayeciwtypnGthwhudeVJfiobndMZIielaDpmujlfbU"],
    ["gradedHCAandrdabKDOLaeubbelowysASYrtepwsCbifomaUCuXihuvMsCWlsjeE"],
    ["GDXwarmAIffTFtdZnGerawaUrKeipJocuMdohUrgbNhJJcbiHsNdnaBfYboysuit"],
    ["YEwineFbQOJtfWBugradeoSywITesilbsaGeQoukudvfWrfqioHenHAttgtimilH"],
    ["sedargDQhgarshopoXopeDLEeCrdasIwJEbCUtsiBwarmNhnNcatiuseEQdenyOK"],
    ["shoeMwcYdOGVoyobVrklofoSQSebYKkZmbgradegraNosWEiaUnaTEPfwWKdjett"],
    ["MWtwMwdHbroadaeCZlclcrnLbJdhimyDRnMOifMnaawaretrLLNIYefuCwinedLb"],
    ["tBDKnrubRfblowaWtQiUfdtBSeVgeZiAtwiceDmLcatudDiPshopqIlUdogmrawB"],
    ["cIPDalETHhBOinQRcjimPFdDoeierawaotWwfHoekwaveTloIreniwehmfolkWbs"],
    ["bsOwkoocHoPeohsFQfydwrJSBtLcoatNyBTlhgvhuQiStiOebfawareDtSCMpQTf"],
    ["dSKfEALtawareIDfoLXmpiMirHgwrohgbbJoLahcCltldPwsHoaeeohsYwcboyJU"],
    ["KAFIBSdjsdHMDpouquelOagmTuinAtwpbfityhoMtoYedargbuyNtVtIUXbonehT"],
    ["deefNaXbqMBlnwuMKuidoyEMRfilimittLbedargICEotDOTtfosnboydenyKeFM"],
    ["tycWnZSDiuQhErSXubwpiIuGsgradelbpoLtvifbZifhfeaTXPgtEdDLdaorbJKG"],
    ["dNtFKAlQKnUfUFiePbaKiOmvspossliauaGysotwitwicefPtheohsrttejHRYHd"],
    ["twJKHIQKioWsgifturMGsfXtstwiceSephXMZerjdoABEdCdanheohsLbOasjump"],
    ["edVeohsZvgesRIUVaFiesyobwbDpfedMpDledargmbYooEMduuFrwPADjybliftD"],
    ["OkoocbuyUdPLeohsjdrfpigTuayeciwtmbnesWHipTedKsWmJNdSICPiHKAshopl"],
    ["dogshoePtboyfLftQeLQePoftwicewliDmbudokgbrlDqrQZuaoWQtJSywwEShMP"],
    ["tfigjUkGsJKeVlkyMhtsoVogHqofwbobJfueodcrtWBilYPogradeWGaTNMGbtId"],
    ["cookwandtXYOoNSbPedargpuApiYtsorIawuhohnJtiPqfsyHhnDOtPuIRetfigb"],
    ["SWHIGpdetiusmavsbaduoahWsLjrwopnHsbVpLarQXeciwtuBOHraKhbHpigdtLH"],
    ["XtejhtapSdgiftUiterawatgfZBedUiPoFnasIuRsioHCssNwreohsVZbIliftYS"],
    ["WROcHgipYwFSoQPpnoUffoDmgradeDkultuNeiejihKbdvhdftejaPactLDwWbHJ"],
    ["PUtXZbTTkevawrRTjlfIOoITXUoedargdogfidTDdeefJhNGyobkoocQeohstfos"],
    ["BIddjbPRPltaeeoUNZiiontysSpfuryehsdmtsbntneFuYSoawarejVbpBJEdJZP"],
    ["WZBctiuseohshVBGlimitiBZkUawareTlStfosBfoHgtfigbfiKZtacopYdeefHy"],
    ["kjHCsOdVleJuevawotioIVoAfthAXfrPYsePNebgAtwiceyiEEMQudopsoftNqbS"],
    ["dLEZsWLODrfguCPWLyeciwtSluestpCTibdQsRCyfshoebYntbroadaeMDjumpId"],
    ["LYcatUsHtnrubhDXMfdaorbGwdopdogpotrsJFSalyfeciwtboUisFLhNbOJgsZN"],
    ["eCpigLpNKofwSImyfgheoAuuNeiserjbsMiffdtLuLAhtoFhitwicelQtdabTJCk"],
    ["anddOFJyKawarejnfkooceKeeLrFtNsdentQBfysdrhNooWNRuPlbIIODbkSwarm"],
    ["cQWtfilIofbLgiftoJerawawkCliBEotwPoNhraYaDwUtcnQrWWhVPdImwinenob"],
    ["bNjetfCwaEKjoPoMdLwlulIgfbkobmMinedargpfrligPtBtuoPhiAhMbwNEcpID"],
    ["ONasgIOBVdhnliftQorFdIfJewbeciwtwXoosNoiVajlyslmTerRbYeitJVmVSbl"],
    ["ObWdnaZTwedargTlalPrwOdivoAUeaDfewYYosrtnUOrGTsmoZbblowObtaceniw"],
    ["VQtfNyubsObedargGhleiBDIwSodFuNtwowebjqfagraCuRividtNmHlepLUhpPJ"],
    ["jWgOAATCuToFdeefmHdqtfilpyobulHIgiftwiceYsuitmeUburnRiVtMVWjetEP"],
    ["seUsblowEsnbotacEQeiufSYEFbrwrtftgradenefLoJdnaeiSaklofdgSdSPQAR"],
    ["gcITgiftowhFyobfdoPifIbogradeSlsBtloefoCthhidJwOasJMfYSEcOCYUtCK"],
    ["pYTdIJLsodnarNHuhtwiceNisiiwMNstwmnjocEsaieMulaGvlGMRmeteMbonepb"],
    ["enobboyUsThDPJjjCsIttXeupTeGrftmawareoiptXLXdEwlhRRandEFwaveblow"],
    ["XTfolkXTEgQAwarmwiPKsXdsopqhIweurYouOonitejHilythgradeTMboyDQbtV"],
    ["PWRHBkUVBmrawlsLNbMdfouaNCafefingradentdAGDLdiyOXlimithWjetenobc"],
    ["giftLOkLfbSfKQoCeupEeyobermtwicednuLolhUWGjtripcUIUetfiKODBjhtgG"],
    ["KKffdogdbCJerawauEGeieRorkEdvhLrnElaWdcbUXwomrawblowfTZbXXZKLbuy"],
    ["eFNWtJVyVvqCMfoNJhauJbiUVUtwicelsbiaaeWRoomFpntXfnitacdLtelJblow"],
    ["ynedtfilbFNYRcVAafUalaBOdWeintwtMKmiVdoftiushVlotVtwicesKDeohsbX"],
    ["WtcpZgipGeShmSGRdjSpiuQsegradejunJdtfGfiyaKhJoStbVtimilFboneRZXk"],
    ["JMlwFCjksEJioNeoIsCnfrtoUAeepttcawareaKhpmujdQtFVenobDVhEanddeny"],
    ["nVwgYSUUbrhooCwBkuutldaflsybrbreoYsgSomefBieTWwdEfVQrboytIgradeE"],
    ["MKtmSYITGJfCrBGpdVidEaabwrlaStwoogeohseyligradejbpLbsAJFKDWgiftO"],
    ["buySplLZCGMmidRdwZufaLwoajtoMKogvIreKtleebtwicenXGouFuboZYsyBMqb"],
    ["LwmrawbPEoPtbNuIgradeEryKtUQlinuZhkWobubKANowgoqklofoKiyynedScHp"],
    ["BVgiftGXdbHUnrubaetksoftbldilPZDZoOruoHNtwicesfglimitsiFbuyJZpsH"],
    ["ssKUWIHJLshEfptelBeoeifviNTregoamgradeswiwolbZbJtpohsPoXZPtacByB"],
    ["YfsmrawygoMsXMuHilpdebAXpkawareVSLtoObdFLZhrshoeIFQttiusIKVhwave"],
    ["MeohstacGLmrawVIgXAbroadsibdlCGUasfeaoGTLnetlbwNGOdrpohsDgradewZ"],
    ["LGdOfOyTawarenXSGoCFeJLmtrbddspretlenosajhoShaRwUhwsyobLsTXBOOLL"],
    ["SaqSynedtnhuTKKIfdtwiceQoGrbbeNcsfoaWltaDowdAUotPlBbelowVkXReohs"],
    ["andtXRycgradeGoaDplYkibtyaZisouCntpomeoqehfooiGcdtUhhWtLTWsINsHY"],
    ["worthHDAMYicEKdtWuWwhaEfsnMabifiYrgradegjuGmMBefebYSTIdHtXshopig"],
    ["XkoocKLXtWVkYFUlsalpigWioocdOfemfawareoitZdabehtHFZROdsLSwaveHTs"],
    ["GGGIVkwLAFqtNoiBFWfuLonCPibpiceelgradeoKPiotjhtdJfahseZoPtdsoftg"],
    ["bCbyubeHrOawXLvboUdtaJaoawarerwndoandimeLlXORUuQGewolbGqSbfolkVV"],
    ["EwaveKEtfbOburneKerawadjLlitklofmoXhiUgerwYHcmnBacookiiWwJUNwFNl"],
    ["MDfdMpPSLGeedargFnbUitEtybsushGeergurocjnoIoinfFiaKVdtAtwdklofML"],
    ["bwUOlAFbguaZYioWqiyrsyfVwupumBwtabiQYpoBvtoedargeJVntttKPZNFehhW"],
    ["mFtacRtJredargfPawPriPiIwoXpewgkJrSbostoFtdlofsoIheainKcRbQlbCeS"],
    ["qAbpWfSUUumuoIwACuilyHoCjFkedargsQOMtUtghdynedhioaBsuitpebKUhtap"],
    ["mbpigsKDruqBKhbFarMuQoupwnDTipyaGgradeTtbwolbIthaHtimilWdtfigZDM"],
    ["XMjdeefyDlbeQIoetYirtbKvigqfoZMauEiutaUwsJMpiNdaAawareJrGRbonetm"],
    ["wIbccookaXrJhSZXvUoBpiLDeHawareAnpdptSjfroXihuybuhPgmuaBbsQpbdEV"],
    ["RQPfAgCcSVogoboyYlidEoXpkfbckCwmtIrahDouFFotSiljYMawareTAKdnrubf"],
    ["ADYLXZRmXteniwOryberawaacnriaJOwoteounCfofjdaqdekieRYdOeUltenobd"],
    ["dfenobDYeeciwtFWneOhOJcIydlpiWakbGiJietllpmujgfooGiRMWEfwCtNwine"],
    ["ABJMjLHwBYtfeedaptQePMtvmitwiceeuuJoeuRsjsyrndqhWoWtooIobQXhbgJp"],
    ["YwaveGNRbuyksJsRWPVoluLybcfHioJorthtdGfboCJieNpoawarePindSPOffge"],
    ["ENyWKewjtGoWfnauPebZeovmtwicebepJotudTNBariMqFKVntuCtfildhsUjetW"],
    ["bDJwolbnNashopNrdqdOJfXueVulZeMbntwicetUyPWmedfJVugiptoEQFbtBQsL"],
    ["HEblowlhsPStGiJtQhfsfCdaWootsEapsydeSeoZyonawaregoGeyubdLDbUdGHX"],
    ["pmblowJJAorlimitqGhaaDXPtuJswnDEbfiJtKdpoZierawayAjgtTZtVnrubXKh"],
    ["RKgipLFFUKbroadPAbelowKKtfigMUtDtedargftioiPbjifuhLuealossNtqHds"],
    ["nrubCJtVEgodVciZEjumpombfJkdEoiotejleklytfigoeKNXTThNffZGtwiceOV"],
    ["WSZtiusYdHworthpHrnrubXmdweciwtutoasQoIjbfgvslJtoIiHeeCeyWGlNbOj"],
    ["EStiusSXKwgiftBBStaandGkbherawaleWtimbeolMOruSofoLAGoqhywTjetwsB"],
    ["tboyEdXsJerawaAuTliFUoKijoNusrBtewMoqbeWtLfdognZLtdenyoRfolkYSbD"],
    ["cooktHXtGbVFfeCfgradeojoSoAerKlsdaDeeeDkodnfyvsBgoZZoXasbCMFbCSw"],
    ["eniwlNkQHDTiNNldXqmfnWoeTiuPerfnttwiceuypToFeRdbiAlAVtacgSbwarmW"],
    ["gradenpVBAQHroFVyhMuhecUotbshasbbaDttOlsGprgToTIToJowarmwMDdtfig"],
    ["JDYdPAIwtburndyaLerawaovcliZmobeJokuKrMQRwolqbaEcatkoVWwIBQHPfIS"],
    ["dLsuitNMCrJwynedCAeoJcbnAHgraderloPtsLludiVhoyobJGfBfXwJWVWttDKJ"],
    ["CXkoochCWKevawtJtfosKdrybsenoboDtesJVbwgfAleciwtiLUorATSlbuywdLQ"],
    ["psswPFkXiKshaoXBgIOeorJhdGJcremtedgraderncepohsoyJaeUNYwyobtfBBF"],
    ["QTTtfosTdDdZliftawareEPeobtVeKVorcefQsYhbHaliysspigtogBQwolbBwCT"],
    ["pEdIdVTwawareoaGtpcCevgbhoBoesrPFhLQoosTtsdCakRZaVadmrawcHbMenob"],
    ["LgiftdFZOKsWfbnLNVPseuJatwiceyEniboydrwrmfolkoduiVCWlTXblTCbsoft"],
    ["tYLVlRXEewolbiNLjsGUybfZLwsOorwtWapeboodEriVraleWmgradenTJshoeby"],
    ["shoekoocshopTXwZAstNBGoVwIoedargwoFfiBtTdalctuhbPnveaIqaFRaebtFd"],
    ["giftfolkkUwolebyJoLCOPuJJsoOdbeVCNscaRnjboyeoRouNawarebmgipZbdSp"],
    ["CtiusCZtbctfigaCrRhBecUtoFPibnfYawareiigdVWHlfowburnodPBtfoswVZG"],
    ["tacyobMHpohsPGpgkoocBaobfjRttdogBeuhinIiPRimemEfPWThpMitXtwiceSl"],
    ["feedjVHteciwtefVwDhIIotboaFisAutrnNkertitdlbnffuhoCHoIisfNPKHygW"],
    ["LJswGXJNGKOsaKLTlLTcevLLeioCbrebbofgradekohtoXtlBFysadeosoftdDjw"],
    ["qHGtfoscTuenobMawsidenytNiherawaBOnotToFVOJepAladaorbDenIMsuitbd"],
    ["lgPgiftXWiicookYsCmpshoehKqiXwDXomXutoDypCrXilJuVgradeFbdabGwbtL"],
    ["UqtpathZKeuRtiusjtwiceOYbdpMeUGdoeipltabnngimoRaeyfLruKdKtNbHWjL"],
    ["wyDwolebVoswaveyCblsHPuMbALbebPmkrawarerlboneQdaoEGagodwfCPYdDIW"],
    ["HwckeBGhqaonlwDttuiloowaKwirbafpUaterawaWhnmtPAKTWXdnrubACevawIJ"],
    ["HCGmTXtdUbMrLaaDweTacbpeolswMMonroPsbMhotwicelsbhLpigroZgiftVFdw"],
    ["NHdQdabwawarePaUHobIerRwYlocmsbaFenPousvpbeEyoNetimilIkROTgLfolk"],
    ["ZJbONLHPsoftXAseyandKYhvRawareoasuitBepwKdaorbsMChtapYFstacburnY"],
    ["JtGNshoebsatsuitahwceROGdootwicedpldomuWeAeorrMqnMbgtaJJyWAThwKC"],
    ["yobRANbptimilbuaeciwtuytMYhpLrRhGcmidnkWIuoeeTldjRnoRfoPFyKUkgfT"],
    ["tfigbuyBYAHrIYdYNboyjfeTbasuOoeEdlmsAlfbdpoNekuJJnawareNKAaYnLdE"],
    ["RKcGQbadRSwhpmujUQoNifZHWgradeOKtatjwefefnhaedKoidvXFtChleDwolbs"],
    ["UPMsNMLpqNQuyIHmnuKinIwutritepojbeuedargoMjbtttdyfolkhhoQBSSEZNg"],
    ["MdenyPflPPTNsjeisCsuedefysioondtotegfWoDbUWrVtZbGgradeEWYCVworth"],
    ["MFUtLNjnawareuprNodCmiHutlepgbubienfrRtqubyoTNeVsXalVUjCBdPkGdab"],
    ["catApohsdogPnrubwrChtrowdoeciwtDLalsDoDFEObbslKLevawWeOEQsoftbHJ"],
    ["XtXAfPXKQSeoshoeEfljmKplOkerawaiYtaioPtmdwflhdhiYabincFtRGbagDNH"],
    ["yeTbJQCPAnnwrtJUYTeoaoaEtdYdbracierawamduWbelowdspohsKMobadEXsWg"],
    ["dfolkHSIJrDwaveOwYeoLXbKoTgradeblBHtsjlobPbhudonuoWmnZweyOpaNQGI"],
    ["PbBwolebjaSbRLCgedQrtfigtkoocpZIsedargkthHidNlBfoDKuoAUoeCTfqUQs"],
    ["psJEcookoOsjumpdhQWeUKaesKIbrbbntHgradeofOjoKGlbiIeadSoLgZtdFQwV"],
    ["PtfdaorbJPedargOtLeieYLJNidgunJYXNueiqytJdosMpWfOhawarmisVYbuyPl"],
    ["ERpohsTNImwolbhdqbrdAEteTuaaoOrebTidwgofboeerawaunnLtDKFyXYeGVWP"],
    ["mynedyubrbRZXlTKaenobigwwldOtmoiWolrAidntwicetueWYfWLsOsBPtUVGsR"],
    ["pAboykPZiIUFoYeKgbroadvEqKcVfsaIDuZDeowTtwicefDtbonedteKshoptjBU"],
    ["KgodRdJIfwolebabjeKtGPobReiXfnAsCutheiXhstwicegoLtimilFpUpmujCDW"],
    ["FtfosRUGXMbuybCtdyneduwiArbwJrouGoeoInlsyRgradeNEiMtsFbZpHGhlift"],
    ["KWhtrowkjPGtCYooetfPAtlotoeRfOecstwicebSpWgDuVySiburnqoEgMpohsbO"],
    ["tdyDtfilpfenWRwGsioeeAoIbsgsfdrIQueciwtZbUrrBEhAouWndVTHyVyYwolb"],
    ["dGWfdKPyawareNIooCICeiEbrDbpfghlbcmoiYicCuafnfIdjUttteoHKcookgEG"],
    ["dnaIIwJwskoocoDaMhtacrBvGcoIwtLeSGhpohetEGLilGofawareFhoeniwbfss"],
    ["yBBsjpDtuOhuidfWbomgaiwsppqogGohwZruTXloibtwiceenRBAOebKeQsuittU"],
    ["lZLenobUZiJdeefmRwfWbadrtastsdKaivRseuowmeOQejigiDXKSrVtlOKgrade"],
    ["andgiftbSHNTQPupeSbcEywonNrchAohoVowXilsboawareWkYdQOrbfeniwGOmQ"],
    ["VMashopMOOnJtfosUDdFfObHawareRoybloweYnuboyLdsebynedKSsPSRtimilX"],
    ["nTEtfigarqpmujnZuwuDbdQBboZiflNNgradeXokItGVetlwShePdoYUGNJjfboy"],
    ["dHMKjumpoedargttgIerKIafdReJeIcibafeyscloMonoosQyAerohTDBdIkbBsJ"],
    ["KAVNcookPfGWpHYtUOerawaemtZitZtjrbiphCfbapomYciowhiyiHgnsGDgClIe"],
    ["TGEIenobTqdenywXAKuYIDiVlimitZngawareLeitfosYtAptacdeefPliftsuit"],
    ["bsaPTZlHoNonMbiRnMCfdrfSeYfktotCMhoedargUottidPicEOaehKfDdabpjct"],
    ["bVLQMFFOutbSsuitrWedargtnwliOyseMWoiuoojXIwrfqabSHAtttnXtfigPhdX"],
    ["suittfosNWbcNgPLSWrQhBoIPcoURibdsdawareIhedtUOlfonZbadoNeyliftwQ"],
    ["EFddGGjHOweoluUbHaegmilOtvfpBoftSerawaitGniWbmStMoEuiaAeKbJlqTdj"],
    ["GspmujGLVVsRYMgPBCWebFibPawarefakaosodtdonlhabuyodeodJCVcEbefolk"],
    ["catOLQShboneOXBttbRsoftreedargBonliJstWwioBufgodwwiiqVRLZtlWevaw"],
    ["nbroadLCrAswgiftuAAsiJfDbtSMenegBiawareiZupmujdpSsGStfilWyubBNFB"],
    ["QPFwolebtwolbVXVDerawaKQZpiBHbEgemMurtibnuHoqfgoojaTtiiybdtaclpZ"],
    ["CBJfMyublDyboNbWiOnwolebmWesonkXiydwsmeNtoODreDSUbVawareHKwIdogd"],
    ["cDtlGWyECocfiVuPdQohofbWobSkisthgawarettZdASJrfaIGHeohspLTRwtfig"],
    ["DgfolkYUNifbGbFdNpberawaIcllidUopaooShArmtwwFKcbueohsIAZjOPDgift"],
    ["fMEVQpwEyewAgoaPnBioZhrbeQdhlsmodtwiceYyjblowLbGeDMCburntXlimitL"],
    ["dTtfgiftojeeFboygetwicebdtiXPuOuKPmtFkqrCNiXlXBnBuloMDSGsFfjumpF"],
    ["QboywavefRFpoWIOKedargLMBXittZCttwshhYabFfauccauYBiriGnrBRVlmtdn"],
    ["WUdgFNsbBWaiVuuwfGbfiyaKfowtKrnbZelomErrBSiklTuopighXebaXtwicebd"],
    ["QHyULgMkdTEnoJoPseCdeoTblsetcdutiDefarjfmRIrncuiigrademltdabUMpH"],
    ["badbtIkwJNNiulEaPDmforIvRiwfeRneljotwiceVuldoghBRmePcatcRpbPtius"],
    ["LXfpFhkTVMoiWtoGEIlgCrosTfkwQocopQerawafYadiyvLtIatHhueKbeohscbV"],
    ["ZbTpigGsUedargXotlbrWHXfaorbeUQtcwoFHsWgNnaHKLsieRdFdabftiushopt"],
    ["JKStfilaVeciwtnZyDKhIdVjNnltiusupseiAejmyahdmefpIototiKDRUbheTtC"],
    ["OOWddtejCawareISwQopMenDoblFmhsylueTtuSsbrbrPRjXOnoaliftIwIUddna"],
    ["eciwtFjKcyhanduGoFuiGEmCoZLbeKpwktfilfotburnYrbfdeeftBoiKPKhENyg"],
    ["folkBPPAPHVmrawTYtiusfPtdJeOUeNfatwicenioRbgudrgrKuLoquWbNybadbW"],
    ["koocTUTnyworthZrEoSPQsDuUqbWotLbNMufdfyaYRtieiunawarelbdevawftWN"],
    ["pdAYZSeFmerawanHucbeSOoAjaGhsObkdtchtsEleNotdrIonAoaOnofyNkpHXaw"],
    ["GnrubhQHandttDecKFfaDvCoRipsaYdolYDwsAakMOyubeoZboyedargVNtfosbd"],
    ["tyLUQdbwaosdKooocbbhegnrRtesonetKilSspyhKuoGIeDZYswawarejumpMYUd"],
    ["BTNynedEQwGtfosIPoDfbNdcgradeBnoKtMJliaoshoeoLhkYdabwPYctfilDtej"],
    ["bDtpohsHaOdishoedGqomCZOwDfugiWgotHViflilawareYfbtacJettVNJTZdWV"],
    ["IMsGwineLtahRfZtMnePoeYidtwicefujTowudoseAraQqlFtBtvNDkPBXhesoft"],
    ["dgodtiuseNMTFkYenZGslPAoyyKosVwhsoftdeosJbjedargVNeeEYtdMfQYtKhW"],
    ["ssdogsfSVusRHooZVMieEflegiftrtkocbgradehZaohtapsFBtyGHGCHOBdaorb"],
    ["IPyevawbIuIQUPobbbptWywlgradeaXoSotMriDwYahmFOuAXdtfilKqenobJand"],
    ["aQDmWIXKnhryyneddateofUZwqorobwRVhuloQossHkiywluawareueiCPWDStbt"],
    ["OshoeywGscookoodGsbWRbrnpHeciwtaoGlrwLhchVoFdaZasFwWNMvtjumpKXEe"],
    ["QyneddnaNDRYtfosJVwolbFXfbdaorbfeedargoQoliINldchoIhkGaaswPMcQbt"],
    ["yfZTwaveueciwtsAbeEhRuKOtdbliJNbfOotieMrodnaAffosFeniwtaZUBPISSd"],
    ["QbddEjPesanaNuCohdaoUmNhocJrVptspKhbdAigjetieGuigradeMsfYOGYffXt"],
    ["WKLhbadtcBtCXRyidaorbnDupatfeTEssnFdeDJHhdYtwiceoQBEeohspjumpFXc"],
    ["tfosttCSsMIfaURRhsicsbgOogshLroseKoeSodubpKEraeiaEgradetdRKQYWfC"],
    ["badenywEDFffYIoJshoedargFFXeiOtStjSddhhsNfuCoccuRRimgaEiMGElptFt"],
    ["ZXMlldogIQXtiusCdIftfmQHCreatUiRYJeciwttVGdsNbadtfigsGTGpmujeohs"],
    ["KsFLnrubXMsUMfNXHRPebeEEPawareyawineodntjumpadeitacNdLduYXBlifts"],
    ["blowESSFFtswarmjONfstLewtYXietYoWfmGlrQlAiigradelODgnrubbadgipZX"],
    ["LCslkbadQGihDotQIfbXofottubqoefcyHrsuidRLaoYgieBBnawareKRddTUTft"],
    ["NtmrawPElimitJPdYuXIaeeSWssCVnFFbadsyodfhtapebMoHZawarelPtejTWdk"],
    ["shoepohsbNOpBtHWkoLmCiLdocyuwmUeoahjoiGncBnillcygradeHaRMTLMbftI"],
    ["KypPMIVKbnTmliftoetfujetndeeljIceetwiceodCPgmuWoyoboiYqkSOPdtFYH"],
    ["YbWeohsQElHsyNSQpohssoFRhwbTGebWtHuawareaDyDdogdpworthVWynedtfos"],
    ["WqjNVeVSNwueGvBKGopitaFBgradewHbbttsmtlyuhhrhoEorBaCwoGbnwUdnapS"],
    ["pohsZRZIMqpigVCSTQudaorbetwiceauvyowedcraulaBtonwberFJoIRPbmYWkX"],
    ["deohsfttDrdabeafyWebYecinagradelenXosEBJddGaYNCHJEXdLUFEtiustfos"],
    ["ObfbGZOdmoRerawaryVlisXoapEothGrwilwfocbcgiLieYNXafKgAEZRPtcookU"],
    ["yUcwWQbwIuahONaoSrbXibdlmgradeNbtfigglfTVFAshoeBlimitwdVZVshopQQ"],
  ];
  static List<List<int>> all_solutions=[
    [2,0,6,4,3,1,3,5,0,3,4,7,2,1,6,1,4,6,7,6,7,2,7,5,1,3,4,0,0,4,3,7,5,4,5,7,0,5,2,7,4,3,4,5,0,1,2,3,],
    [1,1,5,5,3,1,3,5,3,1,7,1,0,1,0,4,3,6,6,3,7,3,7,6,1,3,1,6,0,7,3,7,2,3,2,6,5,2,7,2,1,0,3,0,4,3,6,5,],
    [1,2,5,6,1,1,1,5,7,1,7,5,0,1,4,1,3,3,6,0,3,7,6,7,4,3,7,6,0,4,0,7,6,1,6,4,2,6,5,3,5,5,7,7,2,0,4,0,],
    [1,0,5,4,2,1,2,5,3,3,7,7,1,1,4,1,3,4,3,7,2,0,5,0,6,1,6,4,1,3,1,6,0,1,0,4,7,0,7,3,4,7,6,7,2,7,4,5,],
    [2,1,6,5,6,2,6,6,2,5,6,5,3,6,7,6,3,7,6,7,2,4,5,1,1,3,4,0,0,1,3,4,7,3,7,6,1,4,1,7,7,0,7,2,0,3,0,5,],
    [1,2,5,6,4,1,4,5,6,3,6,7,2,5,5,5,4,0,7,0,5,1,5,4,0,6,3,6,0,0,3,0,0,7,3,7,1,3,1,5,0,2,0,4,2,2,4,0,],
    [1,0,5,4,2,1,2,5,3,1,7,5,3,3,3,6,4,6,7,6,3,0,6,0,4,1,7,1,0,4,3,7,1,1,1,4,4,1,6,3,0,5,0,7,7,1,7,3,],
    [3,1,7,5,4,2,4,6,1,6,5,6,3,7,6,7,1,2,1,5,0,2,0,5,2,0,5,0,6,0,6,3,2,1,2,4,1,6,3,4,7,2,7,4,5,4,5,6,],
    [2,0,6,4,5,2,5,6,3,3,7,3,1,7,4,7,3,0,6,0,1,2,1,5,0,7,3,4,7,4,7,7,0,0,0,3,5,1,7,1,2,6,4,4,3,5,5,5,],
    [3,0,7,4,5,0,5,4,3,5,7,5,0,4,3,1,4,7,7,7,1,5,4,2,0,7,3,7,0,6,3,6,0,5,3,2,0,7,2,5,5,6,7,6,0,2,2,0,],
    [1,1,5,5,4,1,4,5,0,0,0,4,2,5,5,5,6,2,6,5,5,1,5,4,1,4,1,7,4,0,7,0,3,7,6,7,4,6,6,6,1,4,3,4,1,0,3,0,],
    [3,1,7,5,5,3,5,7,1,7,5,7,0,4,3,4,0,0,0,3,2,3,5,0,7,0,7,3,4,3,4,6,6,0,6,3,3,0,5,2,0,7,2,5,1,0,1,2,],
    [1,2,5,6,3,0,3,4,6,1,6,5,2,7,6,7,1,7,4,4,5,1,5,4,4,0,4,3,7,3,7,6,1,3,1,6,0,1,0,3,5,5,7,7,5,0,7,0,],
    [3,2,7,6,4,3,4,7,1,0,5,0,3,3,6,3,0,1,3,1,1,4,1,7,0,4,3,7,4,2,7,2,3,4,3,7,2,2,2,4,7,3,7,5,5,7,7,7,],
    [2,2,6,6,3,3,3,7,0,5,4,5,1,1,1,4,3,2,6,5,2,0,5,3,4,0,7,3,4,1,7,4,0,2,0,5,5,7,7,7,4,6,6,6,5,0,7,0,],
    [3,0,7,4,7,1,7,5,1,7,5,3,1,1,1,4,3,3,6,0,1,0,4,3,2,7,5,7,0,1,0,4,2,3,5,6,6,5,6,7,0,7,2,5,2,2,4,0,],
    [2,0,6,4,4,0,4,4,2,3,6,7,3,6,6,6,0,2,3,2,0,6,3,3,7,4,7,7,2,7,5,7,6,0,6,3,5,2,7,2,1,7,3,5,0,1,2,1,],
    [1,2,5,6,3,0,3,4,3,0,7,0,1,4,4,4,5,1,5,4,0,4,3,7,4,4,7,7,3,7,6,7,6,2,6,5,0,2,2,0,4,1,4,3,7,4,7,6,],
    [0,0,4,4,1,1,1,5,3,6,7,2,0,1,4,1,1,0,4,0,5,0,5,3,1,6,4,3,2,7,5,7,7,3,7,6,6,5,6,7,4,6,6,4,1,7,3,5,],
    [0,1,4,5,2,3,2,7,1,7,5,7,1,3,4,3,3,0,6,3,4,5,7,5,1,1,4,4,4,2,7,2,0,2,0,5,4,0,7,0,4,6,6,6,1,4,1,6,],
    [3,0,7,4,5,0,5,4,0,0,0,4,1,7,4,4,3,4,6,7,1,0,4,3,4,6,7,3,0,7,3,4,1,3,4,0,2,7,4,7,7,5,7,7,2,4,4,2,],
    [0,0,4,4,1,1,1,5,1,6,5,6,0,1,4,1,4,5,7,2,5,2,5,5,0,2,0,5,6,4,6,7,7,4,7,7,0,7,3,7,2,5,4,3,2,0,4,2,],
    [3,2,7,6,3,1,3,5,3,7,7,7,1,5,4,5,0,3,3,0,4,2,7,5,2,4,2,7,3,6,6,6,4,0,7,0,4,0,6,2,7,2,7,4,0,2,2,0,],
    [2,0,6,4,3,1,3,5,3,6,7,6,2,1,5,1,0,4,0,7,1,1,1,4,3,0,6,0,1,7,4,7,7,1,7,4,0,0,0,3,2,2,2,4,5,2,7,0,],
    [0,2,4,6,1,3,1,7,2,1,6,5,0,3,3,3,4,0,7,0,5,3,5,6,2,7,5,7,7,2,7,5,4,1,7,1,1,0,1,2,2,5,4,5,0,4,0,6,],
    [2,0,6,4,5,3,5,7,3,0,7,4,4,5,7,5,2,4,5,1,1,2,1,5,0,7,3,4,4,0,7,0,1,7,4,4,3,2,5,4,0,0,0,2,2,7,4,7,],
    [0,1,4,5,3,0,3,4,2,7,6,7,2,0,5,0,1,3,1,6,4,3,7,0,2,5,5,5,2,1,2,4,4,6,7,6,5,4,7,2,0,2,0,4,4,4,6,2,],
    [3,1,7,5,6,0,6,4,0,6,4,6,0,0,0,4,2,0,5,0,2,2,5,5,2,5,5,2,1,4,4,1,0,7,3,7,5,4,7,6,5,7,7,5,7,2,7,4,],
    [0,1,4,5,1,2,1,6,0,7,4,7,0,2,3,2,0,3,0,6,3,1,6,4,7,2,7,5,4,4,7,7,4,3,7,6,3,5,5,7,4,0,6,2,5,2,7,0,],
    [1,2,5,6,2,3,2,7,2,0,6,0,3,1,7,1,4,6,7,3,0,1,0,4,1,4,1,7,2,2,5,2,4,7,7,7,3,5,3,7,4,3,6,5,4,4,6,2,],
    [2,1,6,5,3,2,3,6,7,1,7,5,0,1,0,4,0,4,3,7,1,1,1,4,3,1,6,4,0,0,3,0,2,2,2,5,5,0,7,0,4,6,6,6,6,1,6,3,],
    [3,3,7,7,5,3,5,7,0,3,4,7,3,2,7,2,3,7,6,4,3,1,6,1,1,0,4,0,0,2,3,5,1,2,4,5,0,5,0,7,0,4,2,6,7,4,7,6,],
    [3,3,7,7,4,0,4,4,2,1,2,5,3,4,7,4,4,5,7,2,4,7,7,4,5,0,5,3,0,7,3,7,0,4,3,7,3,5,5,7,0,1,0,3,1,0,3,0,],
    [3,3,7,7,6,3,6,7,5,0,5,4,1,3,4,6,1,4,4,1,0,3,3,0,0,7,3,7,7,0,7,3,1,6,4,3,2,2,4,0,0,0,0,2,7,5,7,7,],
    [1,3,5,7,2,0,2,4,1,1,5,1,1,4,5,4,4,3,7,0,3,0,6,0,4,7,7,4,0,7,3,7,0,4,3,7,4,2,7,5,7,1,7,3,0,3,0,5,],
    [2,0,6,4,5,3,5,7,2,7,6,7,7,1,7,4,1,0,4,3,0,3,3,6,6,0,6,3,1,2,4,5,1,7,4,4,0,6,2,4,0,5,2,7,0,4,2,4,],
    [1,3,5,7,4,3,4,7,2,6,6,6,0,2,0,5,7,3,7,6,1,4,1,7,4,0,7,0,1,1,4,1,5,1,5,4,1,2,3,0,6,3,6,5,5,7,7,7,],
    [0,3,4,7,0,0,0,4,4,0,4,4,6,2,6,5,3,2,3,5,5,1,5,4,4,6,7,6,0,7,3,7,7,1,7,4,1,0,1,2,5,0,7,0,0,6,2,6,],
    [2,1,6,5,5,0,5,4,0,1,4,5,3,6,6,6,0,0,3,3,2,3,2,6,5,4,5,7,7,4,7,7,0,3,0,6,1,7,3,7,4,1,6,3,6,0,6,2,],
    [2,1,6,5,4,1,4,5,1,0,5,0,2,5,5,5,1,3,1,6,7,0,7,3,0,0,0,3,4,7,7,7,0,7,3,7,0,6,2,4,5,1,5,3,1,6,3,6,],
    [1,2,5,6,4,1,4,5,2,2,6,2,3,5,7,5,0,2,0,5,1,7,4,7,0,6,3,3,2,0,5,0,0,1,3,1,5,4,7,4,5,1,7,1,0,7,2,5,],
    [0,0,4,4,3,0,3,4,3,1,7,1,2,0,5,0,5,2,5,5,0,3,0,6,0,7,3,7,1,2,1,5,6,4,6,7,2,6,4,4,7,4,7,6,2,3,2,5,],
    [1,1,5,5,4,0,4,4,0,5,4,1,3,4,6,4,2,4,2,7,7,4,7,7,3,7,6,7,7,0,7,3,0,3,3,0,0,0,0,2,1,5,1,7,4,2,6,0,],
    [0,2,4,6,1,3,1,7,5,2,5,6,0,3,4,3,4,0,7,3,0,7,3,7,6,0,6,3,0,1,3,1,0,0,3,0,5,7,7,5,0,4,0,6,6,3,6,5,],
    [3,0,7,4,6,3,6,7,3,7,7,7,4,3,7,3,1,4,1,7,3,2,3,5,4,2,7,2,0,1,3,1,0,3,0,6,3,6,6,6,2,2,2,4,5,1,7,1,],
    [0,1,4,5,3,0,3,4,0,0,4,0,3,1,7,1,1,6,4,6,3,7,6,7,4,2,7,5,1,7,4,4,4,3,7,6,5,2,7,4,0,4,2,2,0,3,2,5,],
    [3,3,7,7,6,2,6,6,2,5,6,1,0,4,3,7,1,3,4,6,2,0,5,0,0,1,3,1,2,7,5,4,7,1,7,4,0,5,0,7,1,2,3,2,4,7,6,7,],
    [1,3,5,7,3,1,3,5,3,0,7,4,4,2,7,5,4,0,7,3,0,3,3,6,4,3,7,6,0,0,3,0,0,4,3,7,7,0,7,2,2,1,2,3,4,4,6,6,],
    [3,0,7,4,5,0,5,4,0,4,4,0,4,4,4,7,4,4,7,7,3,3,3,6,1,4,4,1,4,3,7,0,0,7,3,7,1,0,1,2,0,4,0,6,7,1,7,3,],
    [2,3,6,7,2,0,2,4,0,2,0,6,2,1,6,1,7,0,7,3,6,3,6,6,1,7,4,7,3,0,6,0,7,4,7,7,3,3,5,5,1,3,1,5,5,2,5,4,],
    [0,3,4,7,3,2,3,6,7,3,7,7,2,6,6,6,2,0,2,3,4,1,4,4,5,2,5,5,0,4,3,1,6,1,6,4,1,5,1,7,5,0,7,0,1,0,1,2,],
    [1,3,5,7,2,0,2,4,0,1,4,1,1,4,5,4,4,3,7,0,3,3,6,0,2,7,5,4,6,2,6,5,7,3,7,6,0,4,0,6,5,5,7,7,1,5,1,7,],
    [3,0,7,4,6,3,6,7,0,1,4,5,4,3,7,3,1,3,4,6,0,6,3,6,2,2,5,5,0,4,3,7,4,0,7,0,0,3,2,5,5,1,7,1,0,0,2,0,],
    [2,0,6,4,5,3,5,7,3,6,7,6,2,2,2,5,0,2,0,5,1,7,4,7,4,1,7,1,3,0,6,0,1,0,4,3,1,0,1,3,0,6,2,6,7,2,7,4,],
    [0,2,4,6,4,3,4,7,2,1,6,1,2,7,5,7,2,3,2,6,1,4,1,7,7,4,7,7,0,4,0,7,1,3,4,0,5,4,7,4,3,2,5,2,6,3,6,5,],
    [0,3,4,7,0,0,0,4,0,0,4,0,3,3,6,0,4,1,7,4,4,4,7,1,4,6,7,3,4,3,7,6,1,2,4,5,2,4,2,7,1,5,1,7,5,7,7,7,],
    [3,0,7,4,4,1,4,5,1,3,5,3,6,4,6,7,1,6,4,6,2,7,5,7,4,0,7,0,0,1,3,1,0,4,3,4,1,2,3,2,1,0,3,0,4,0,6,2,],
    [1,0,5,4,4,3,4,7,1,7,5,7,4,0,7,0,0,6,3,3,4,1,7,4,0,0,0,3,4,2,7,5,1,1,1,4,7,1,7,3,1,6,3,6,5,6,7,6,],
    [2,2,6,6,3,3,3,7,2,0,6,4,0,5,3,2,4,1,7,4,2,4,2,7,7,0,7,3,0,3,3,0,4,3,7,6,4,5,6,7,7,5,7,7,1,5,1,7,],
    [2,0,6,4,5,0,5,4,0,1,4,5,4,0,7,0,0,3,3,6,1,0,4,3,7,1,7,4,1,3,1,6,4,4,7,7,0,0,3,3,3,7,5,7,0,6,2,4,],
    [2,0,6,4,3,1,3,5,0,3,4,3,0,3,4,7,7,1,7,4,6,0,6,3,5,4,5,7,0,4,0,7,0,1,3,1,4,5,6,7,3,0,5,0,1,7,3,7,],
    [0,3,4,7,3,2,3,6,3,7,7,3,2,4,5,4,4,1,7,1,1,0,4,0,4,2,7,2,4,6,7,6,0,4,3,1,0,1,2,3,1,5,1,7,6,3,6,5,],
    [2,2,6,6,4,2,4,6,3,1,7,1,2,6,5,6,1,7,4,7,0,3,3,0,0,4,0,7,4,0,7,3,0,2,3,5,1,6,3,4,5,4,7,4,1,4,3,2,],
    [0,1,4,5,1,2,1,6,0,3,0,7,0,2,4,2,2,4,2,7,3,7,6,4,6,0,6,3,5,0,5,3,7,2,7,5,0,0,3,0,4,3,6,5,1,1,3,1,],
    [1,1,5,5,2,2,2,6,1,6,5,6,1,2,4,2,4,1,7,4,4,3,7,6,1,7,4,7,3,0,6,0,0,1,0,4,5,7,7,5,5,1,7,1,1,3,1,5,],
    [2,3,6,7,4,3,4,7,7,0,7,4,0,0,3,3,2,0,5,0,6,2,6,5,2,4,5,1,0,5,3,5,1,4,1,7,2,2,5,2,5,7,7,5,0,0,0,2,],
    [0,0,4,4,2,0,2,4,1,0,5,0,0,4,3,4,4,2,7,5,3,6,6,3,2,7,5,7,7,1,7,4,4,3,7,0,0,1,0,3,0,7,2,5,5,6,7,6,],
    [3,1,7,5,4,2,4,6,0,5,4,5,4,0,7,3,0,1,3,4,3,6,6,6,0,7,3,7,4,1,7,4,4,7,7,7,2,0,2,2,0,6,2,6,5,0,7,2,],
    [0,0,4,4,3,3,3,7,1,6,5,6,7,1,7,5,5,0,5,3,1,0,4,3,2,5,5,5,4,0,4,3,6,2,6,5,0,5,2,3,0,1,0,3,5,7,7,7,],
    [2,3,6,7,4,3,4,7,3,5,7,5,0,3,0,7,5,0,5,3,1,5,4,2,1,1,1,4,0,0,3,0,7,1,7,4,1,7,4,7,1,4,3,6,6,0,6,2,],
    [1,1,5,5,2,1,2,5,1,6,5,6,1,5,4,5,4,3,7,0,0,4,0,7,4,2,7,5,0,0,0,3,4,0,7,3,1,7,3,7,6,5,6,7,7,5,7,7,],
    [2,3,6,7,3,0,3,4,1,1,5,1,2,4,6,4,4,2,7,2,0,4,3,7,3,3,3,6,4,3,7,3,7,4,7,7,0,0,0,2,0,3,2,5,0,7,2,7,],
    [0,3,4,7,1,0,1,4,2,0,2,4,7,4,7,7,0,7,3,7,5,2,5,5,3,3,6,0,6,2,6,5,7,0,7,3,3,0,5,0,4,1,4,3,5,7,7,5,],
    [0,3,4,7,1,0,1,4,5,3,5,7,0,4,4,4,4,1,7,4,0,1,3,1,0,7,3,7,3,3,6,0,1,6,4,6,6,4,6,6,7,5,7,7,2,0,4,0,],
    [1,3,5,7,1,0,1,4,0,7,4,7,1,1,5,1,7,1,7,4,4,3,7,6,0,7,3,4,2,0,2,3,0,2,0,5,4,4,7,7,6,2,6,4,3,2,5,2,],
    [1,2,5,6,3,0,3,4,3,0,7,0,2,4,6,4,0,0,0,3,4,3,7,3,0,7,3,7,0,6,3,6,7,4,7,7,4,1,6,1,0,5,2,5,3,5,5,7,],
    [0,2,4,6,4,3,4,7,3,4,7,4,1,6,4,6,4,1,7,1,1,0,1,3,1,0,4,3,2,0,5,3,2,0,5,0,5,5,5,7,0,3,2,5,1,7,3,7,],
    [3,3,7,7,6,2,6,6,3,2,7,2,4,4,7,4,1,6,4,3,3,1,6,1,1,4,4,7,0,0,3,0,0,2,0,5,1,2,3,0,1,5,3,7,5,0,7,0,],
    [0,1,4,5,1,2,1,6,0,6,4,6,0,2,4,2,7,1,7,4,5,2,5,5,4,7,7,7,2,0,5,0,3,1,6,1,6,3,6,6,0,3,0,5,1,7,3,7,],
    [2,1,6,5,5,0,5,4,1,1,5,5,3,6,6,6,0,3,0,6,0,7,3,4,1,0,4,0,1,7,4,7,1,2,1,5,0,0,0,2,7,1,7,3,5,7,7,7,],
    [0,3,4,7,1,0,1,4,3,1,7,5,1,1,5,1,0,4,3,7,5,4,5,7,7,1,7,4,6,0,6,3,3,2,3,5,6,5,6,7,0,0,0,2,0,5,2,7,],
    [3,0,7,4,4,1,4,5,1,5,5,5,2,6,5,6,2,1,2,4,0,1,0,4,1,7,4,7,0,0,3,0,4,0,7,3,3,1,3,4,5,3,7,5,5,0,7,0,],
    [0,1,4,5,1,2,1,6,2,1,6,5,2,0,5,0,4,4,7,1,0,3,0,6,3,7,6,4,7,4,7,7,0,0,3,3,1,3,3,5,5,7,7,7,5,2,7,0,],
    [1,0,5,4,2,0,2,4,3,5,7,1,4,7,7,4,0,4,3,7,0,0,3,3,0,3,3,6,4,2,7,2,4,0,7,0,5,5,7,7,6,3,6,5,0,5,2,7,],
    [3,0,7,4,4,0,4,4,1,4,5,4,1,0,1,3,3,7,6,4,4,7,7,4,2,0,2,3,0,7,3,7,0,4,0,7,3,5,5,3,5,7,7,7,5,1,7,3,],
    [0,1,4,5,2,3,2,7,2,7,6,7,1,3,4,3,4,1,7,1,5,2,5,5,0,4,3,1,1,4,1,7,4,6,7,6,0,0,3,0,6,2,6,4,7,2,7,4,],
    [3,3,7,7,6,3,6,7,3,6,7,6,0,4,3,7,3,0,6,0,4,3,7,0,0,0,0,3,1,1,4,1,7,3,7,6,0,7,2,5,2,0,2,2,3,6,5,4,],
    [3,3,7,7,5,3,5,7,0,7,4,3,2,7,6,7,3,1,6,1,1,0,4,0,0,3,0,6,1,2,4,2,1,3,4,6,6,2,6,4,7,0,7,2,0,1,2,1,],
    [1,3,5,7,3,1,3,5,3,1,7,1,1,5,4,5,4,2,7,2,6,3,6,6,1,7,4,7,0,1,3,1,3,0,6,0,2,0,2,3,3,4,5,4,0,2,0,4,],
    [0,2,4,6,3,1,3,5,3,4,7,0,2,5,6,5,4,4,7,1,2,3,5,0,7,2,7,5,1,0,4,0,1,4,1,7,4,7,6,7,0,4,2,2,0,7,2,7,],
    [1,1,5,5,3,1,3,5,3,2,7,2,6,3,6,7,1,2,1,5,2,6,5,6,0,0,0,3,1,0,4,0,7,3,7,6,3,7,5,7,1,6,3,4,0,4,0,6,],
    [3,2,7,6,4,3,4,7,3,2,3,6,3,7,6,7,0,4,0,7,1,3,4,0,3,0,6,3,4,2,7,5,0,0,0,3,2,4,2,6,5,5,7,7,6,0,6,2,],
    [1,0,5,4,4,0,4,4,0,2,4,6,3,0,6,0,0,3,3,3,2,7,5,7,7,0,7,3,7,4,7,7,0,4,3,4,3,1,5,3,0,7,2,5,5,2,7,0,],
    [0,1,4,5,2,3,2,7,3,3,7,7,3,0,6,3,3,1,6,4,1,0,4,3,0,2,0,5,4,7,7,4,1,3,1,6,0,0,2,2,6,0,6,2,3,5,5,7,],
    [3,0,7,4,7,1,7,5,2,4,6,0,1,2,4,5,4,3,7,6,1,4,4,7,0,4,3,1,2,6,5,3,0,0,0,3,0,5,2,7,3,7,5,5,0,7,2,7,],
    [3,1,7,5,5,1,5,5,0,5,4,5,3,0,6,0,1,3,4,6,0,0,0,3,1,4,4,1,4,7,7,4,0,7,3,7,6,1,6,3,7,1,7,3,2,0,2,2,],
    [0,1,4,5,2,1,2,5,3,1,7,1,2,2,6,2,2,6,5,3,4,7,7,4,2,0,5,0,0,1,0,4,0,7,3,7,7,5,7,7,5,5,7,3,0,0,2,0,],
    [3,2,7,6,6,1,6,5,2,0,2,4,1,6,4,3,2,7,5,7,0,3,3,3,4,4,7,7,5,0,5,3,2,6,5,6,3,0,5,0,1,7,3,5,0,0,0,2,],
    [0,1,4,5,3,1,3,5,2,4,6,4,1,5,4,5,0,7,3,7,7,2,7,5,3,0,6,0,3,6,6,6,4,7,7,7,4,1,4,3,0,0,2,0,5,1,7,1,],
    [1,0,5,4,5,1,5,5,1,2,5,6,1,3,4,6,0,7,3,7,0,3,0,6,1,2,4,2,4,7,7,7,7,2,7,5,1,4,3,6,0,6,2,6,6,2,6,4,],
    [2,1,6,5,6,2,6,6,2,3,6,7,0,0,4,4,1,0,4,0,0,3,0,6,3,1,6,1,0,6,3,6,0,2,3,5,1,7,3,7,7,4,7,6,7,1,7,3,],
    [0,2,4,6,2,2,2,6,2,7,6,3,3,1,7,1,4,7,7,7,3,3,6,6,0,3,3,0,0,6,3,3,7,2,7,5,5,0,7,0,2,2,4,2,1,4,3,4,],
    [0,0,4,4,2,2,2,6,2,6,6,6,2,5,6,5,1,2,1,5,4,3,7,3,4,7,7,7,3,2,6,2,3,0,6,0,0,5,2,7,5,4,7,4,2,1,4,1,],
    [2,3,6,7,3,0,3,4,1,7,5,3,2,0,5,0,1,2,1,5,0,4,0,7,4,1,7,1,2,4,5,7,6,3,6,6,2,5,4,7,7,3,7,5,5,2,7,2,],
    [2,3,6,7,3,0,3,4,6,1,6,5,0,0,0,3,4,0,4,3,1,4,1,7,7,4,7,7,5,1,5,4,0,4,0,7,2,4,5,7,1,0,1,2,2,5,2,7,],
    [0,3,4,7,3,2,3,6,1,3,5,3,2,6,6,6,0,0,3,0,6,1,6,4,7,0,7,3,0,1,3,1,7,4,7,7,4,2,6,0,0,4,0,6,0,7,2,7,],
    [0,2,4,6,3,2,3,6,2,5,6,5,3,3,7,3,0,4,3,7,1,4,4,1,4,2,7,2,1,0,4,0,4,4,7,4,5,7,7,5,0,0,2,2,5,0,7,0,],
    [2,3,6,7,5,2,5,6,7,0,7,4,4,6,7,6,0,4,0,7,0,2,3,5,1,4,4,7,1,2,4,2,3,0,6,0,6,2,6,5,5,7,7,5,0,7,2,7,],
    [2,2,6,6,6,3,6,7,2,6,6,6,7,1,7,4,4,0,4,3,0,7,3,4,0,0,0,3,1,7,4,7,1,1,1,4,5,2,5,4,6,0,6,2,1,0,3,2,],
    [2,0,6,4,5,3,5,7,7,0,7,4,1,6,5,6,0,4,0,7,6,0,6,3,1,2,1,5,0,0,0,3,1,1,4,4,3,0,5,0,6,5,6,7,4,5,4,7,],
    [1,2,5,6,2,3,2,7,1,0,5,4,1,7,4,7,3,1,6,4,2,2,5,5,3,0,6,3,0,4,0,7,4,0,7,3,5,0,7,2,0,2,2,0,6,5,6,7,],
    [0,0,4,4,1,0,1,4,0,1,0,5,5,3,5,6,0,7,3,4,2,7,5,7,6,2,6,5,1,7,4,4,4,0,7,0,2,1,4,3,3,0,5,2,2,0,4,2,],
    [3,1,7,5,4,2,4,6,1,4,5,4,2,7,5,7,3,0,6,0,0,3,3,3,0,0,3,3,7,0,7,3,0,4,0,7,4,1,6,1,5,6,7,4,1,5,3,5,],
    [0,1,4,5,0,0,0,4,1,7,5,3,1,0,4,0,1,1,4,1,2,7,5,7,4,2,7,2,0,6,3,3,3,2,6,5,7,4,7,6,0,7,2,5,4,0,6,0,],
    [0,3,4,7,3,2,3,6,0,2,4,2,2,6,5,6,4,4,7,7,4,3,7,6,3,0,6,0,0,4,0,7,4,1,7,4,7,0,7,2,0,2,2,0,1,7,3,7,],
    [0,2,4,6,1,3,1,7,7,3,7,7,0,3,4,3,2,7,5,7,3,6,6,3,3,2,6,2,0,4,0,7,3,1,6,1,5,0,7,0,1,0,3,0,1,2,3,2,],
    [1,0,5,4,3,0,3,4,3,1,7,1,0,6,3,6,0,2,0,5,2,5,5,5,6,3,6,6,2,7,5,7,4,2,7,2,7,3,7,6,0,0,2,2,3,5,5,3,],
    [1,1,5,5,1,0,1,4,0,0,0,4,6,1,6,4,3,4,6,7,7,1,7,4,2,0,5,3,1,6,4,6,1,7,4,7,0,5,2,5,4,1,6,3,3,2,5,4,],
    [1,3,5,7,2,0,2,4,0,3,0,7,1,2,4,2,7,1,7,4,3,0,6,0,3,6,6,3,3,4,6,1,1,4,1,7,4,7,6,5,5,5,7,7,0,0,0,2,],
    [3,3,7,7,3,0,3,4,0,2,4,6,3,7,6,7,2,0,2,3,6,2,6,5,4,0,4,3,5,0,5,3,7,3,7,6,0,3,0,6,1,0,1,2,7,0,7,2,],
    [0,1,4,5,1,1,1,5,0,2,4,2,6,4,6,7,4,5,7,2,2,0,5,0,7,3,7,6,4,1,7,1,0,6,3,6,0,7,2,7,3,7,5,5,1,0,3,2,],
    [3,1,7,5,7,2,7,6,0,0,4,4,4,5,7,5,1,3,1,6,0,1,0,4,3,4,6,1,2,4,5,7,0,7,3,7,4,0,6,2,2,5,4,7,1,0,3,2,],
    [0,2,4,6,3,2,3,6,3,1,7,5,3,7,6,7,4,4,7,7,4,3,7,0,0,3,3,0,4,0,7,3,0,0,3,0,2,3,4,5,0,6,2,6,5,4,7,6,],
    [3,0,7,4,4,1,4,5,3,7,7,3,0,1,3,4,0,2,0,5,1,4,4,7,0,6,3,3,5,4,5,7,4,0,7,3,7,5,7,7,1,7,3,5,0,0,2,0,],
    [2,3,6,7,5,2,5,6,2,2,6,2,4,6,7,6,7,0,7,3,0,1,0,4,0,6,3,3,0,0,3,0,4,0,4,3,2,5,4,7,1,2,1,4,0,7,2,7,],
    [2,3,6,7,5,2,5,6,0,2,4,6,0,3,3,0,4,0,7,3,1,4,4,7,0,7,3,7,4,1,4,4,7,4,7,7,2,6,4,4,5,0,7,2,6,3,6,5,],
    [3,0,7,4,5,2,5,6,2,6,6,6,3,1,3,5,4,0,7,0,1,4,1,7,0,0,0,3,0,4,3,1,4,7,7,7,3,2,6,5,2,3,2,5,4,2,4,4,],
    [3,3,7,7,4,0,4,4,2,1,6,1,3,2,6,2,7,2,7,5,0,0,0,3,2,7,5,4,1,3,4,6,6,4,6,7,3,7,5,7,1,6,3,4,0,4,0,6,],
    [0,0,4,4,1,1,1,5,3,7,7,3,0,1,4,1,0,4,0,7,3,0,6,0,2,5,5,2,2,7,5,4,2,0,5,3,7,4,7,6,4,7,6,7,1,7,3,5,],
    [0,3,4,7,3,3,3,7,6,0,6,4,4,3,7,6,7,2,7,5,5,0,5,3,2,0,2,3,0,0,0,3,1,4,1,7,5,5,5,7,2,6,4,4,1,0,1,2,],
    [1,1,5,5,1,0,1,4,3,6,7,2,0,4,3,4,4,7,7,4,4,3,7,0,4,2,7,5,4,0,7,3,0,7,3,7,5,7,7,7,1,4,1,6,0,1,0,3,],
    [2,1,6,5,4,1,4,5,3,3,7,3,0,2,0,5,3,6,6,6,1,1,1,4,6,1,6,4,0,7,3,4,1,7,4,7,3,0,6,0,2,1,2,3,0,6,2,4,],
    [0,1,4,5,1,1,1,5,6,2,6,6,2,7,5,7,2,2,5,5,2,0,5,3,1,0,4,3,0,4,0,7,1,6,4,6,5,4,7,6,4,0,6,0,3,0,5,2,],
    [2,2,6,6,3,3,3,7,0,5,4,5,4,3,7,3,0,3,3,0,1,4,4,1,4,7,7,4,4,2,7,2,4,0,7,0,0,5,2,7,0,2,2,0,5,7,7,7,],
    [3,3,7,7,4,0,4,4,2,1,6,1,3,2,6,2,4,5,7,2,1,2,1,5,0,0,0,3,7,3,7,6,2,4,2,7,2,4,5,7,5,0,7,0,4,7,6,5,],
    [0,1,4,5,1,2,1,6,2,4,6,0,6,3,6,6,7,0,7,3,0,5,3,5,0,7,3,7,1,0,4,3,2,0,5,3,3,0,5,2,0,0,2,2,2,6,4,6,],
    [1,2,5,6,4,1,4,5,0,7,4,7,3,3,6,3,7,3,7,6,0,5,3,2,0,0,3,0,1,3,4,0,0,6,3,6,5,0,7,2,1,5,3,5,6,4,6,6,],
    [1,2,5,6,2,3,2,7,0,6,4,6,1,3,4,3,5,1,5,4,0,2,0,5,1,0,4,0,7,3,7,6,6,2,6,5,5,0,7,2,4,4,6,6,2,1,4,3,],
    [3,3,7,7,4,1,4,5,1,1,1,5,3,5,6,5,0,6,3,6,3,0,6,0,3,4,6,1,7,1,7,4,0,1,0,4,3,1,5,1,2,3,2,5,5,3,7,5,],
    [0,3,4,7,3,2,3,6,0,2,4,2,3,3,7,3,6,4,6,7,7,4,7,7,1,7,4,7,4,0,7,0,5,4,5,7,7,0,7,2,0,4,2,6,0,0,2,0,],
    [1,2,5,6,4,2,4,6,3,7,7,7,2,6,5,6,0,6,3,3,2,5,5,5,1,3,4,0,5,1,5,4,0,2,0,5,7,1,7,3,0,1,2,1,3,2,5,0,],
    [0,0,4,4,4,1,4,5,2,6,6,6,3,5,7,5,2,7,5,7,0,3,0,6,1,4,4,4,2,0,5,0,7,1,7,4,5,4,7,6,0,7,2,5,6,1,6,3,],
    [0,2,4,6,2,0,2,4,1,0,5,0,1,4,4,7,3,4,6,1,0,4,0,7,4,4,7,1,4,6,7,6,3,3,6,0,5,4,7,2,4,5,6,5,1,7,3,7,],
    [1,3,5,7,2,0,2,4,1,1,5,5,1,2,4,2,4,0,7,0,0,3,3,6,1,7,4,7,4,5,7,2,6,4,6,7,5,1,7,3,0,4,2,6,3,0,5,2,],
    [0,0,4,4,3,2,3,6,0,2,0,6,2,0,5,3,3,0,6,3,7,0,7,3,2,7,5,7,2,3,2,6,1,2,1,5,5,5,7,7,4,5,6,7,5,4,7,6,],
    [2,0,6,4,5,3,5,7,2,6,6,6,4,5,7,5,1,0,4,3,1,4,1,7,2,2,2,5,4,1,7,4,0,0,0,3,4,0,7,3,5,0,7,2,3,3,3,5,],
    [3,0,7,4,5,2,5,6,2,6,6,6,2,1,2,5,4,0,7,3,1,0,1,3,0,0,0,3,1,4,1,7,3,7,6,7,4,2,4,4,3,4,5,6,0,3,0,5,],
    [2,3,6,7,5,3,5,7,0,0,0,4,4,3,7,3,1,3,4,0,3,0,6,3,1,2,4,2,0,5,3,5,1,7,4,7,2,4,2,6,7,0,7,2,6,5,6,7,],
    [2,3,6,7,4,3,4,7,5,0,5,4,0,5,3,5,1,2,4,2,1,1,4,1,7,4,7,7,7,0,7,3,0,7,3,7,0,0,2,0,0,2,2,4,6,1,6,3,],
    [0,3,4,7,1,0,1,4,2,3,6,3,0,4,3,4,7,1,7,4,2,0,5,0,4,4,7,7,1,1,4,1,2,6,5,6,0,7,2,7,0,0,0,2,4,2,6,4,],
    [2,3,6,7,4,3,4,7,0,0,4,4,2,7,5,7,4,0,7,3,0,4,0,7,0,3,3,6,6,4,6,7,4,2,7,2,2,1,4,1,0,1,0,3,1,7,3,5,],
    [2,3,6,7,4,3,4,7,3,5,7,5,3,0,7,4,0,0,0,3,1,2,4,2,4,0,7,3,0,4,0,7,1,4,4,7,7,0,7,2,1,5,3,3,5,4,7,6,],
    [0,2,4,6,3,1,3,5,1,2,5,2,2,5,5,5,4,0,7,3,6,3,6,6,0,3,0,6,2,0,2,3,1,7,4,7,5,5,5,7,1,6,3,6,5,3,5,5,],
    [2,0,6,4,4,2,4,6,0,6,4,6,0,4,3,4,4,0,7,3,2,7,5,7,4,1,7,4,0,3,3,3,1,2,4,2,7,0,7,2,1,5,3,5,5,0,7,2,],
    [3,3,7,7,4,0,4,4,2,1,6,1,3,4,6,4,2,3,2,6,3,7,6,7,1,4,1,7,0,2,3,2,7,2,7,5,1,0,3,0,2,7,4,5,0,4,0,6,],
    [0,0,4,4,3,0,3,4,3,1,7,1,1,4,4,4,0,4,0,7,3,7,6,4,4,3,7,6,7,2,7,5,4,0,7,0,4,7,6,7,2,5,2,7,0,3,2,3,],
    [1,0,5,4,5,1,5,5,1,4,5,4,4,5,7,5,6,1,6,4,0,0,3,3,3,0,6,0,0,4,3,7,7,0,7,3,0,5,3,5,0,3,2,3,0,7,2,7,],
    [0,0,4,4,2,2,2,6,2,6,6,6,1,2,4,2,6,0,6,3,0,7,3,7,1,3,4,0,7,3,7,6,0,3,0,6,1,0,3,0,3,7,5,7,1,4,1,6,],
    [2,2,6,6,3,3,3,7,1,0,1,4,2,3,6,3,4,0,7,3,0,4,0,7,0,0,0,3,4,7,7,7,4,5,7,5,3,2,5,0,0,7,2,7,1,5,3,5,],
    [0,0,4,4,3,0,3,4,7,1,7,5,3,1,7,1,3,7,6,7,0,1,0,4,1,3,1,6,6,2,6,5,2,4,2,7,5,4,5,6,4,0,6,0,4,4,6,6,],
    [0,1,4,5,4,2,4,6,1,0,5,0,1,5,4,5,6,3,6,6,7,4,7,7,2,1,5,1,0,6,3,6,0,0,3,3,5,4,5,7,2,7,4,7,5,1,7,1,],
    [2,1,6,5,5,0,5,4,2,0,6,0,4,2,7,2,0,3,0,6,7,4,7,7,1,1,4,4,3,4,3,7,2,4,2,7,0,0,0,2,4,7,6,5,1,5,1,7,],
    [0,2,4,6,2,2,2,6,3,0,7,0,2,3,6,3,3,1,6,1,6,4,6,7,0,3,3,0,1,7,4,7,7,2,7,5,4,2,6,2,5,6,7,6,3,6,5,4,],
    [1,3,5,7,4,3,4,7,3,6,7,6,3,3,6,3,1,4,1,7,0,2,0,5,2,3,5,0,4,0,7,3,3,7,6,4,0,0,2,0,5,2,7,0,4,3,6,5,],
    [1,3,5,7,2,1,2,5,1,1,5,1,5,2,5,5,3,0,6,0,0,4,3,7,3,4,6,7,7,0,7,3,6,2,6,5,2,0,4,2,7,4,7,6,2,1,4,3,],
    [2,0,6,4,5,0,5,4,1,1,5,5,4,0,7,0,1,0,4,3,0,2,3,5,1,6,4,6,1,2,4,5,7,2,7,5,0,5,2,5,0,7,2,7,5,6,7,6,],
    [0,3,4,7,3,2,3,6,0,4,4,0,3,3,7,3,0,7,3,7,6,4,6,7,4,1,7,1,2,3,2,6,5,4,5,7,1,0,1,2,0,1,2,1,5,2,7,2,],
    [0,2,4,6,3,1,3,5,1,2,5,2,2,5,6,5,3,0,6,0,4,7,7,7,4,4,7,4,4,1,7,1,4,3,7,3,0,3,0,6,0,1,2,1,1,5,3,7,],
    [0,1,4,5,2,1,2,5,2,6,6,6,2,2,6,2,3,1,6,4,1,4,1,7,4,0,7,0,4,7,7,7,0,2,0,5,4,1,6,1,1,1,1,3,3,3,5,5,],
    [3,3,7,7,6,2,6,6,0,4,4,0,0,6,3,6,1,0,4,3,7,3,7,6,5,0,5,3,4,7,7,7,0,1,3,4,0,2,2,0,7,0,7,2,2,4,4,6,],
    [0,2,4,6,1,3,1,7,6,3,6,7,0,3,4,3,2,2,5,2,1,1,4,1,4,0,7,0,2,7,5,7,5,3,5,6,7,3,7,5,5,2,7,2,0,0,2,0,],
    [0,1,4,5,2,3,2,7,2,7,6,7,1,3,4,3,3,0,6,0,6,1,6,4,5,1,5,4,0,2,0,5,1,2,4,2,0,0,2,0,7,4,7,6,5,5,7,7,],
    [0,1,4,5,1,2,1,6,3,2,7,6,0,4,3,4,0,0,3,3,7,1,7,4,3,0,6,3,4,7,7,7,2,6,5,3,3,7,5,5,5,0,7,0,4,0,6,2,],
    [1,3,5,7,4,2,4,6,2,3,6,3,3,4,6,4,2,0,5,0,7,4,7,7,0,3,3,6,1,7,4,7,1,1,4,1,0,2,2,2,0,4,2,6,5,2,7,2,],
    [2,1,6,5,3,2,3,6,2,2,2,6,4,4,7,7,4,2,7,5,3,0,6,0,7,0,7,3,1,0,1,3,3,1,6,1,0,7,2,7,4,2,6,2,4,5,6,7,],
    [1,3,5,7,2,0,2,4,1,0,5,0,0,4,3,4,3,3,6,6,3,1,6,1,4,3,7,3,3,2,6,2,4,7,7,4,1,5,1,7,3,6,5,4,7,5,7,7,],
    [1,3,5,7,4,2,4,6,3,3,7,3,3,6,6,6,0,5,3,2,1,7,4,7,3,0,6,0,0,0,0,3,3,1,6,1,5,4,7,4,0,6,2,6,5,2,7,2,],
    [3,0,7,4,5,0,5,4,1,1,5,5,6,4,6,7,7,0,7,3,1,3,1,6,2,7,5,7,0,5,3,5,0,0,0,3,3,2,3,4,2,0,4,2,6,0,6,2,],
    [1,0,5,4,2,1,2,5,0,2,0,6,6,0,6,3,0,6,3,6,3,7,6,4,5,0,5,3,3,4,6,7,7,1,7,4,0,7,2,7,0,0,0,2,2,0,4,2,],
    [2,2,6,6,6,3,6,7,1,6,5,2,3,7,7,7,2,4,2,7,2,0,5,3,4,1,7,1,0,4,0,7,3,0,6,0,1,4,3,2,7,3,7,5,1,0,1,2,],
    [3,3,7,7,6,3,6,7,7,2,7,6,2,3,5,6,2,4,5,7,4,0,4,3,0,4,3,7,0,3,3,0,0,0,3,3,6,0,6,2,5,0,5,2,0,7,2,7,],
    [2,1,6,5,3,2,3,6,1,5,5,5,2,4,5,4,3,0,6,0,4,1,7,4,4,4,7,1,0,4,3,1,0,7,3,7,5,7,7,5,0,1,0,3,5,1,7,1,],
    [3,3,7,7,6,2,6,6,1,2,5,2,3,6,7,6,7,2,7,5,1,7,4,7,0,0,3,0,0,7,3,4,0,3,0,6,0,2,2,4,2,1,4,1,5,1,7,1,],
    [2,0,6,4,4,2,4,6,0,6,4,6,3,7,6,7,1,0,1,3,7,3,7,6,2,3,5,0,6,0,6,3,1,5,4,2,0,0,0,2,0,3,2,5,5,5,7,7,],
    [0,3,4,7,2,3,2,7,1,0,5,0,2,4,6,4,7,1,7,4,3,3,6,0,0,2,3,2,4,3,7,0,4,6,7,6,1,1,3,1,6,5,6,7,0,4,0,6,],
    [1,1,5,5,4,1,4,5,3,4,7,4,3,1,6,1,4,7,7,7,0,7,3,7,3,6,6,6,0,5,3,5,0,3,3,0,5,2,7,4,2,0,4,0,5,0,7,0,],
    [0,0,4,4,3,0,3,4,3,7,7,7,3,1,7,1,4,5,7,2,0,5,3,5,7,3,7,6,1,6,4,6,0,4,3,4,0,3,2,3,6,0,6,2,6,4,6,6,],
    [3,3,7,7,5,3,5,7,2,5,6,5,2,7,6,7,3,0,6,3,0,1,3,4,0,2,0,5,1,3,4,6,1,0,4,3,4,2,6,0,7,2,7,4,0,0,2,2,],
    [3,3,7,7,6,2,6,6,3,2,7,2,3,6,7,6,1,6,4,3,1,3,4,0,0,2,0,5,3,7,6,7,0,0,3,0,5,0,7,2,5,3,7,5,0,5,2,3,],
    [3,2,7,6,7,3,7,7,1,2,5,6,3,1,6,4,0,0,3,3,1,0,4,0,0,3,3,6,0,4,3,7,1,3,4,6,5,0,5,2,0,5,0,7,4,7,6,7,],
    [0,3,4,7,1,0,1,4,3,1,7,1,3,2,6,5,3,3,6,6,2,4,5,7,0,0,0,3,3,4,6,7,2,0,2,3,5,3,7,3,4,0,6,0,7,5,7,7,],
    [2,3,6,7,4,3,4,7,2,4,6,0,0,4,3,7,7,0,7,3,1,0,1,3,6,3,6,6,7,4,7,7,0,0,0,3,5,3,5,5,3,0,5,2,0,7,2,5,],
    [3,2,7,6,5,0,5,4,0,4,4,0,4,4,7,4,2,4,2,7,3,4,6,7,0,3,3,6,6,0,6,3,7,0,7,3,3,7,5,5,5,7,7,5,0,5,2,3,],
    [2,2,6,6,4,2,4,6,0,5,4,1,7,2,7,5,4,0,7,0,0,6,3,6,1,0,1,3,6,1,6,4,4,7,7,7,2,4,5,4,0,2,0,4,5,1,5,3,],
    [0,2,4,6,4,3,4,7,5,0,5,4,3,7,7,7,6,3,6,6,0,1,3,4,0,3,0,6,7,1,7,4,1,3,1,6,0,0,2,2,2,1,4,1,2,0,4,0,],
    [1,0,5,4,5,1,5,5,0,4,4,0,2,5,6,5,1,4,1,7,6,0,6,3,7,2,7,5,3,3,3,6,4,7,7,7,0,0,0,2,4,6,6,4,0,6,2,4,],
    [2,0,6,4,4,2,4,6,1,6,5,6,1,5,5,1,1,7,4,7,0,2,0,5,1,2,4,5,3,0,6,3,7,4,7,7,1,3,3,5,4,0,6,0,7,0,7,2,],
    [3,0,7,4,6,0,6,4,0,3,4,7,2,4,5,4,0,0,3,0,0,6,3,3,4,5,7,5,0,4,3,1,0,7,3,4,0,1,2,3,7,0,7,2,1,7,3,7,],
    [3,1,7,5,5,3,5,7,1,7,5,7,1,2,1,6,0,3,3,6,0,0,3,3,4,3,4,6,4,1,7,4,4,0,7,0,0,6,2,4,7,1,7,3,1,0,3,0,],
    [3,2,7,6,4,3,4,7,2,6,6,6,1,1,5,1,6,1,6,4,0,7,3,4,2,3,5,3,2,0,5,0,0,0,0,3,0,6,2,4,7,0,7,2,5,7,7,7,],
    [0,3,4,7,1,0,1,4,0,1,4,1,0,4,4,4,4,0,7,3,4,3,7,6,0,7,3,7,4,2,7,5,2,0,2,3,5,2,7,2,4,6,6,6,0,6,2,6,],
    [1,3,5,7,3,1,3,5,7,1,7,5,2,5,5,5,4,3,7,6,0,3,0,6,3,0,6,3,0,1,3,4,1,4,1,7,2,0,2,2,4,2,6,0,4,4,6,2,],
    [2,3,6,7,3,1,3,5,3,2,7,2,0,0,0,3,1,7,4,7,1,1,1,4,4,0,7,0,1,6,4,6,4,3,7,6,2,1,4,1,0,5,0,7,2,0,4,0,],
    [0,3,4,7,0,0,0,4,3,1,3,5,2,3,5,0,7,0,7,3,4,2,7,5,5,4,5,7,1,0,4,0,0,7,3,7,6,0,6,2,2,4,2,6,4,3,4,5,],
    [0,1,4,5,3,1,3,5,0,3,4,7,2,1,5,1,4,4,7,4,4,3,7,3,0,0,3,0,7,4,7,7,0,7,3,7,1,3,1,5,5,5,5,7,0,3,0,5,],
    [3,1,7,5,6,1,6,5,1,0,5,4,1,5,4,5,0,0,3,3,0,4,0,7,3,4,3,7,0,3,3,0,7,0,7,3,4,4,7,7,5,0,5,2,0,2,2,4,],
    [1,0,5,4,3,0,3,4,0,2,4,6,6,2,6,5,4,4,7,7,5,0,5,3,2,7,5,7,0,6,3,3,0,2,0,5,0,7,2,5,4,5,6,7,0,0,2,2,],
    [2,2,6,6,2,1,2,5,1,0,5,0,1,1,5,1,3,2,6,2,4,7,7,7,1,2,1,5,0,7,3,7,7,0,7,3,5,4,7,4,2,6,4,6,0,4,0,6,],
    [1,2,5,6,5,3,5,7,0,4,4,0,2,7,6,7,1,0,4,3,0,0,0,3,0,6,3,6,7,4,7,7,6,2,6,5,2,4,5,1,3,0,5,2,7,0,7,2,],
    [0,3,4,7,3,2,3,6,2,3,6,3,2,4,5,4,1,3,4,0,4,5,7,5,4,2,7,2,0,4,3,7,4,6,7,6,0,1,2,1,4,1,6,1,7,0,7,2,],
    [1,0,5,4,3,0,3,4,0,0,0,4,4,4,7,1,4,7,7,7,6,3,6,6,1,3,4,6,4,0,7,0,1,4,1,7,4,3,7,0,7,4,7,6,2,7,4,5,],
    [1,3,5,7,3,3,3,7,3,4,7,4,2,3,5,0,4,3,7,0,0,0,0,3,1,0,4,0,0,4,0,7,7,2,7,5,1,5,4,5,2,2,4,2,5,6,7,6,],
    [3,2,7,6,3,1,3,5,0,2,0,6,2,1,6,1,4,4,4,7,7,2,7,5,1,3,1,6,3,0,6,0,3,1,6,4,5,7,7,7,4,4,6,6,0,7,2,7,],
    [3,3,7,7,6,3,6,7,3,6,7,6,2,7,5,7,4,0,4,3,0,4,3,4,0,2,3,5,7,2,7,5,2,2,5,2,3,6,5,4,1,5,1,7,6,0,6,2,],
    [0,0,4,4,2,2,2,6,3,7,7,3,0,6,3,6,4,3,7,6,3,0,6,3,3,4,6,7,2,0,5,3,0,2,0,5,6,0,6,2,1,3,1,5,5,1,7,1,],
    [0,2,4,6,3,1,3,5,3,2,7,2,2,1,5,1,4,3,7,3,0,5,3,2,4,4,7,4,0,6,3,6,2,7,5,7,4,5,7,5,5,6,7,6,2,0,4,0,],
    [0,1,4,5,4,2,4,6,1,4,5,0,3,7,6,7,4,0,7,3,5,2,5,5,0,0,3,0,2,4,2,7,0,4,3,1,5,6,7,6,6,3,6,5,7,4,7,6,],
    [2,3,6,7,5,2,5,6,1,3,5,7,4,4,7,4,0,3,3,6,6,1,6,4,1,7,4,7,2,4,5,1,0,4,0,7,3,0,5,0,7,0,7,2,0,2,2,2,],
    [3,0,7,4,7,1,7,5,1,5,5,1,1,7,4,4,1,4,4,7,0,1,0,4,2,0,2,3,4,6,7,6,1,0,1,3,0,5,0,7,5,4,7,4,5,5,7,7,],
    [1,2,5,6,2,0,2,4,1,0,5,0,3,7,6,7,3,1,6,4,7,4,7,7,0,3,0,6,1,4,1,7,4,1,7,1,3,2,6,5,1,1,3,3,2,6,4,6,],
    [0,3,4,7,0,0,0,4,3,1,7,5,0,3,3,0,3,4,6,7,2,2,5,5,2,4,5,7,4,3,7,0,1,7,4,7,7,2,7,4,4,0,6,0,5,4,7,6,],
    [3,2,7,6,6,1,6,5,3,1,7,1,3,5,7,5,0,0,3,0,0,2,0,5,2,7,5,7,4,0,7,0,1,2,1,5,2,4,4,4,5,3,7,3,2,6,4,6,],
    [1,3,5,7,2,1,2,5,5,0,5,4,1,5,4,5,4,0,7,3,4,6,7,3,0,1,3,1,0,2,0,5,4,1,4,4,0,6,2,6,1,0,3,0,6,5,6,7,],
    [1,0,5,4,2,1,2,5,0,4,4,4,1,1,4,1,7,0,7,3,3,4,6,7,0,7,3,7,5,0,5,3,6,2,6,5,7,5,7,7,5,7,7,5,3,7,5,5,],
    [0,2,4,6,2,0,2,4,1,0,5,0,0,4,3,4,3,6,6,3,4,3,7,0,3,1,6,4,3,3,6,6,1,7,4,7,7,1,7,3,0,7,2,5,7,4,7,6,],
    [2,1,6,5,3,1,3,5,0,2,4,2,1,7,4,7,6,1,6,4,2,3,2,6,1,3,1,6,0,4,0,7,4,0,7,0,7,5,7,7,4,4,6,6,4,5,6,7,],
    [3,1,7,5,4,2,4,6,1,4,5,4,0,3,3,3,4,0,7,0,0,6,3,6,0,2,3,2,4,1,7,4,1,7,4,7,5,1,7,3,5,6,7,6,2,5,4,3,],
    [2,0,6,4,4,2,4,6,1,7,5,7,3,2,6,2,1,3,1,6,1,1,4,1,0,1,0,4,7,0,7,3,5,3,5,6,1,2,3,4,0,5,0,7,3,0,5,0,],
    [2,3,6,7,3,0,3,4,1,3,5,7,6,3,6,6,1,7,4,7,5,1,5,4,7,1,7,4,7,4,7,7,4,3,7,0,1,6,3,6,2,0,2,2,4,0,4,2,],
    [1,0,5,4,4,3,4,7,0,6,4,6,2,0,6,4,0,7,3,7,1,2,1,5,7,1,7,4,0,4,3,4,6,1,6,4,3,0,5,2,1,1,3,3,5,7,7,5,],
    [1,1,5,5,2,2,2,6,1,2,1,6,2,3,5,6,4,3,7,3,6,4,6,7,0,0,3,0,4,0,7,0,0,7,3,7,7,4,7,7,4,2,6,2,4,1,6,1,],
    [0,1,4,5,1,1,1,5,3,1,7,5,5,2,5,6,4,0,7,3,1,6,4,6,0,7,3,7,4,3,7,6,1,0,4,3,7,0,7,2,2,2,2,4,4,7,6,7,],
    [2,2,6,6,3,3,3,7,0,3,0,7,2,3,6,3,1,3,1,6,4,2,7,2,1,0,4,0,4,7,7,4,2,4,2,7,5,7,7,7,3,2,5,0,0,1,2,1,],
    [1,3,5,7,2,0,2,4,3,1,7,5,1,0,4,0,0,7,3,4,3,3,6,6,7,0,7,3,0,1,0,4,2,6,5,6,6,1,6,3,5,4,7,6,3,2,5,0,],
    [2,1,6,5,4,1,4,5,2,6,6,6,4,7,7,7,1,1,1,4,0,4,0,7,6,1,6,4,0,0,3,0,4,0,7,0,1,5,3,5,7,4,7,6,2,2,2,4,],
    [3,0,7,4,6,3,6,7,2,6,6,6,4,3,7,3,4,2,7,2,4,0,7,0,0,3,3,6,2,4,5,4,0,1,3,1,1,0,1,2,0,4,0,6,5,1,7,1,],
    [0,2,4,6,1,0,1,4,0,0,4,0,2,1,5,4,0,7,3,4,2,2,5,5,7,3,7,6,6,2,6,5,4,1,7,1,5,7,7,7,1,5,3,7,5,0,7,0,],
    [3,1,7,5,4,2,4,6,3,0,7,0,3,2,7,2,1,1,1,4,4,7,7,7,0,3,0,6,2,4,2,7,3,3,3,6,5,4,7,6,0,0,0,2,5,1,7,3,],
    [3,3,7,7,6,3,6,7,3,6,7,6,4,3,7,3,2,2,5,2,0,7,3,4,0,2,0,5,2,1,5,1,6,0,6,3,3,0,5,0,1,2,1,4,1,7,3,5,],
    [3,3,7,7,6,2,6,6,0,1,4,1,3,6,7,6,1,2,1,5,4,3,7,0,3,0,6,0,7,2,7,5,2,4,5,7,0,3,0,5,1,6,3,4,0,0,2,2,],
    [0,3,4,7,1,0,1,4,0,1,4,1,0,4,4,4,4,0,7,0,5,2,5,5,6,3,6,6,2,0,2,3,3,2,3,5,5,7,7,7,5,1,7,3,1,7,3,7,],
    [2,3,6,7,5,3,5,7,1,1,1,5,4,3,7,3,0,6,3,6,1,7,4,7,0,1,0,4,2,3,5,0,3,3,6,0,2,2,4,0,4,4,4,6,5,2,7,0,],
    [2,1,6,5,5,0,5,4,3,7,7,3,0,7,3,4,6,0,6,3,0,3,0,6,4,7,7,7,0,0,3,3,1,3,4,0,7,4,7,6,1,3,1,5,4,2,4,4,],
    [3,3,7,7,4,0,4,4,2,1,6,1,3,4,6,4,1,5,4,5,2,6,5,6,2,7,5,7,7,3,7,6,4,4,7,1,0,5,3,2,0,0,2,0,0,4,2,2,],
    [0,0,4,4,3,3,3,7,0,7,4,7,2,5,5,5,1,3,1,6,4,3,7,3,3,2,6,2,2,1,5,1,4,6,7,6,5,7,7,7,4,0,6,0,0,3,0,5,],
    [3,3,7,7,3,0,3,4,2,1,6,1,0,3,3,3,2,7,5,4,7,2,7,5,2,4,2,7,4,0,4,3,6,2,6,5,1,4,1,6,1,0,1,2,3,5,5,7,],
    [1,2,5,6,2,0,2,4,2,6,6,2,2,1,6,1,0,7,3,7,0,3,0,6,3,0,6,0,7,0,7,3,4,3,7,6,4,7,7,7,1,4,3,6,2,2,4,2,],
    [1,3,5,7,4,3,4,7,3,0,7,0,3,3,6,3,0,1,3,1,0,3,3,6,7,1,7,4,0,4,3,7,2,0,2,3,4,7,7,4,0,5,2,7,5,1,7,3,],
    [2,0,6,4,4,2,4,6,1,6,5,6,4,1,7,1,1,2,1,5,0,7,3,7,7,4,7,7,0,2,3,5,4,0,7,0,1,1,3,3,5,2,7,2,2,1,2,3,],
    [1,1,5,5,5,2,5,6,0,2,4,6,0,6,3,6,0,7,3,7,4,7,7,7,7,3,7,6,1,4,4,1,6,2,6,5,0,5,2,5,4,0,6,0,1,2,3,0,],
    [3,1,7,5,4,2,4,6,2,0,2,4,3,2,6,2,0,2,0,5,0,7,3,7,1,3,1,6,4,0,7,0,4,7,7,4,0,1,3,4,5,5,7,7,3,5,3,7,],
    [3,3,7,7,6,3,6,7,1,0,5,4,3,0,7,4,1,3,1,6,2,4,5,7,4,0,7,3,0,3,0,6,2,0,5,3,0,1,2,3,2,5,2,7,0,0,2,2,],
    [2,1,6,5,5,0,5,4,2,3,6,7,4,4,7,4,0,2,3,5,0,3,0,6,1,0,4,0,2,7,5,7,0,0,3,3,4,1,6,3,7,1,7,3,0,7,2,5,],
    [0,1,4,5,3,1,3,5,7,1,7,5,2,1,5,1,3,0,6,0,0,2,0,5,3,6,6,6,2,7,5,7,4,3,7,6,0,7,2,5,2,2,4,4,6,2,6,4,],
    [2,1,6,5,3,2,3,6,0,4,4,4,3,0,7,0,6,1,6,4,4,7,7,7,2,3,5,6,0,4,3,1,7,2,7,5,0,1,0,3,1,5,1,7,5,1,5,3,],
    [2,2,6,6,3,3,3,7,0,5,4,1,2,1,6,5,0,3,0,6,3,1,6,4,7,4,7,7,4,0,7,3,0,0,3,0,4,7,6,5,0,7,2,7,2,4,2,6,],
    [2,2,6,6,2,1,2,5,0,0,0,4,1,1,5,1,4,7,7,4,0,6,3,6,1,2,1,5,3,2,6,2,4,5,7,2,3,5,5,7,5,7,7,7,5,3,7,5,],
    [2,3,6,7,5,2,5,6,2,4,6,0,4,4,7,4,1,4,4,7,0,0,0,3,0,4,3,7,1,3,4,0,1,0,4,3,5,7,7,5,6,1,6,3,0,5,0,7,],
    [2,2,6,6,4,0,4,4,0,0,4,0,3,4,6,4,1,6,4,6,7,4,7,7,0,3,0,6,6,0,6,3,0,2,3,5,4,7,6,5,7,0,7,2,5,1,5,3,],
    [3,3,7,7,6,2,6,6,2,2,2,6,3,6,7,6,1,0,4,3,0,7,3,7,3,0,6,0,0,2,3,5,0,3,0,6,7,3,7,5,2,0,4,2,1,4,1,6,],
    [3,1,7,5,4,1,4,5,0,2,4,6,0,4,3,7,7,0,7,3,1,4,4,7,0,0,3,3,5,4,5,7,0,1,3,4,4,1,7,4,6,5,6,7,3,0,5,0,],
    [0,1,4,5,1,2,1,6,0,6,4,6,0,2,3,2,4,0,7,3,4,7,7,4,1,1,4,1,2,4,2,7,4,4,7,7,0,0,3,0,5,4,7,2,4,2,6,4,],
    [0,2,4,6,3,2,3,6,3,3,7,3,2,3,5,6,2,7,5,7,6,4,6,7,4,1,7,1,1,4,1,7,0,3,3,0,7,5,7,7,0,5,0,7,0,0,2,0,],
    [0,1,4,5,2,3,2,7,2,7,6,7,0,0,4,4,0,2,0,5,4,1,7,4,2,0,5,3,4,3,7,6,4,6,7,3,1,0,3,2,5,0,7,0,1,5,1,7,],
    [0,3,4,7,2,3,2,7,1,3,5,3,2,0,5,0,3,2,6,2,3,7,6,4,7,2,7,5,2,1,5,1,3,4,6,7,0,0,0,2,0,6,2,6,1,0,1,2,],
    [2,0,6,4,5,3,5,7,3,2,3,6,4,3,7,3,4,1,7,1,0,1,0,4,4,4,4,7,2,4,2,7,0,5,3,2,0,0,2,2,3,0,5,0,1,5,1,7,],
    [1,0,5,4,4,3,4,7,0,6,4,6,3,3,6,3,0,2,3,5,0,1,3,4,4,3,7,0,4,6,7,6,2,0,5,0,0,5,2,5,5,5,7,5,0,0,2,2,],
    [0,2,4,6,0,1,0,5,0,2,4,2,4,4,7,4,2,5,5,2,3,0,3,3,2,7,5,7,6,0,6,3,1,4,1,7,2,3,4,5,5,6,7,6,7,1,7,3,],
    [2,0,6,4,3,1,3,5,3,6,7,6,4,3,7,0,1,1,1,4,4,7,7,7,0,4,3,7,4,5,7,5,2,2,2,5,0,0,0,2,4,0,6,2,1,7,3,7,],
    [3,0,7,4,6,3,6,7,1,0,5,4,0,6,3,6,0,1,0,4,4,4,7,1,3,3,6,0,2,7,5,7,2,5,5,5,1,2,3,4,0,4,2,2,5,0,7,2,],
    [2,1,6,5,2,0,2,4,2,6,6,2,0,4,3,4,3,3,6,0,3,0,6,3,4,6,7,6,2,7,5,7,7,1,7,4,0,7,2,5,3,0,5,0,1,2,1,4,],
    [3,2,7,6,7,3,7,7,1,6,5,6,0,0,4,0,3,4,3,7,3,1,6,4,0,4,3,1,6,0,6,3,0,6,3,3,0,7,2,7,0,1,0,3,5,0,5,2,],
    [3,2,7,6,6,1,6,5,1,6,5,6,3,5,7,5,7,0,7,3,1,0,4,0,0,4,3,1,3,3,6,0,4,7,7,7,0,5,0,7,0,1,2,3,2,4,4,4,],
    [2,0,6,4,5,2,5,6,7,0,7,4,2,6,6,6,3,0,6,0,2,3,2,6,2,7,5,7,1,1,1,4,3,2,3,5,0,2,0,4,7,5,7,7,6,1,6,3,],
    [0,2,4,6,2,2,2,6,3,2,7,6,2,1,5,1,6,0,6,3,3,4,6,7,0,7,3,7,2,0,5,0,4,4,7,1,0,6,3,3,5,5,7,7,7,3,7,5,],
    [0,2,4,6,4,3,4,7,7,1,7,5,3,7,6,7,3,0,6,0,5,2,5,5,1,1,4,1,0,7,3,4,6,3,6,6,1,4,3,2,0,3,0,5,0,0,2,0,],
    [2,3,6,7,2,0,2,4,7,1,7,5,1,5,4,2,3,2,6,5,4,4,7,7,1,4,4,7,0,0,0,3,0,7,3,7,5,0,5,2,1,3,3,5,1,0,1,2,],
    [1,0,5,4,4,3,4,7,1,7,5,7,0,4,0,7,4,1,7,1,0,5,3,5,7,4,7,7,0,3,3,3,2,0,5,3,0,1,0,3,0,0,2,2,6,5,6,7,],
    [0,2,4,6,1,0,1,4,0,0,4,0,2,2,6,6,4,3,7,6,3,7,6,7,2,3,5,0,4,2,7,5,7,1,7,4,0,3,0,5,0,7,2,5,5,2,7,0,],
    [2,0,6,4,4,0,4,4,3,2,3,6,7,1,7,4,5,4,5,7,0,0,0,3,1,4,1,7,0,4,0,7,4,5,7,5,2,1,2,3,5,0,5,2,6,0,6,2,],
    [1,2,5,6,2,0,2,4,3,7,7,7,1,4,4,4,4,3,7,0,0,3,0,6,2,4,2,7,4,3,7,3,0,0,0,3,1,1,3,3,3,0,5,0,3,1,5,1,],
    [3,1,7,5,5,1,5,5,0,0,0,4,2,5,6,5,1,1,4,4,1,4,4,1,2,0,5,0,4,6,7,6,1,7,4,7,7,0,7,3,6,0,6,2,0,5,0,7,],
    [2,3,6,7,4,1,4,5,0,1,4,1,3,5,6,5,0,2,3,2,0,0,3,0,0,3,0,6,1,4,1,7,2,4,2,7,6,2,6,4,5,0,5,2,5,7,7,5,],
    [3,0,7,4,4,1,4,5,0,1,0,5,3,3,6,3,2,0,5,0,7,0,7,3,2,2,2,5,3,6,6,6,1,1,4,1,2,7,4,7,5,7,7,7,1,7,3,5,],
    [3,2,7,6,6,2,6,6,1,0,1,4,0,6,4,2,1,7,4,4,4,7,7,7,0,1,0,4,4,0,7,0,7,1,7,4,0,7,2,5,3,0,5,2,3,7,5,5,],
    [1,3,5,7,3,3,3,7,3,3,7,3,2,2,6,2,4,5,7,5,2,1,5,1,0,4,0,7,0,1,3,4,2,0,5,0,2,5,2,7,5,4,7,4,1,4,1,6,],
    [1,1,5,5,2,2,2,6,7,0,7,4,1,2,5,2,6,0,6,3,0,0,0,3,3,6,6,6,0,4,0,7,4,3,7,6,2,0,4,0,5,3,7,5,5,7,7,7,],
    [2,1,6,5,3,2,3,6,1,5,5,5,0,4,0,7,4,4,7,1,3,1,6,1,3,7,6,7,4,0,7,0,0,0,3,0,1,1,1,3,7,5,7,7,5,2,7,4,],
    [3,3,7,7,5,3,5,7,0,4,4,0,2,7,6,7,3,2,6,2,0,5,3,5,0,6,3,6,7,1,7,4,0,1,3,4,1,0,3,0,0,0,0,2,4,6,6,4,],
    [3,3,7,7,4,1,4,5,2,2,2,6,3,1,6,1,3,4,3,7,2,0,5,0,0,3,0,6,7,3,7,6,4,5,7,2,1,1,1,4,4,7,6,5,1,0,3,2,],
    [3,0,7,4,6,3,6,7,3,7,7,7,1,0,1,3,0,4,3,4,3,1,6,1,2,7,5,4,3,5,6,2,0,0,0,3,2,3,4,3,0,5,2,5,5,4,5,6,],
    [2,1,6,5,5,0,5,4,2,2,6,6,0,5,4,5,0,4,3,4,2,6,5,6,0,0,3,0,7,2,7,5,2,7,5,7,0,3,2,3,6,2,6,4,4,0,4,2,],
    [2,3,6,7,3,1,3,5,3,2,7,2,0,4,3,7,4,3,7,3,3,0,6,0,0,0,3,0,4,4,7,4,0,3,3,6,0,6,2,4,0,5,2,7,7,5,7,7,],
    [3,3,7,7,6,2,6,6,0,3,4,7,4,4,7,4,1,3,1,6,1,2,4,5,0,7,3,7,2,0,5,3,1,0,4,3,4,0,7,0,7,1,7,3,4,1,6,1,],
    [2,2,6,6,3,0,3,4,2,7,6,7,3,1,7,1,4,0,7,0,0,2,3,5,0,3,3,6,4,3,7,6,4,2,7,2,0,5,0,7,0,1,2,3,5,3,7,3,],
    [2,0,6,4,3,1,3,5,0,5,4,5,0,6,4,6,4,1,7,4,4,0,7,0,7,3,7,6,2,1,2,4,0,2,0,5,4,7,6,5,5,7,7,7,3,3,5,5,],
    [2,3,6,7,3,0,3,4,2,1,6,1,2,2,5,2,7,2,7,5,2,4,5,7,0,0,0,3,1,2,1,5,0,6,3,6,4,4,7,1,5,4,7,6,0,7,2,7,],
    [0,2,4,6,1,3,1,7,2,3,6,3,7,2,7,5,3,7,6,7,4,4,7,7,3,0,6,0,2,7,5,4,0,4,0,7,5,1,7,1,3,2,5,2,0,1,2,1,],
    [0,1,4,5,3,0,3,4,3,1,7,1,2,0,5,0,4,3,7,6,0,3,3,6,1,7,4,7,2,6,5,3,0,4,0,7,5,7,7,7,6,2,6,4,4,6,6,6,],
    [0,1,4,5,2,1,2,5,2,1,6,1,0,5,3,5,4,6,7,3,0,6,3,6,3,2,6,5,4,2,7,2,7,4,7,7,5,0,7,0,0,2,0,4,1,7,3,7,],
    [1,3,5,7,2,0,2,4,1,0,5,0,3,4,6,4,1,7,4,7,3,3,6,3,3,1,6,1,7,1,7,4,4,5,7,5,3,2,5,2,1,4,1,6,0,2,0,4,],
    [2,0,6,4,5,2,5,6,1,3,5,7,0,1,4,5,1,4,4,7,7,3,7,6,0,0,3,3,6,0,6,3,1,0,4,3,1,5,1,7,6,5,6,7,5,2,7,0,],
    [1,0,5,4,3,2,3,6,0,6,4,6,2,2,2,5,4,5,7,5,1,2,1,5,3,1,6,4,4,1,7,4,0,0,0,3,1,7,4,7,5,1,7,1,5,7,7,7,],
    [3,0,7,4,7,1,7,5,0,2,4,6,0,0,4,4,1,7,4,7,1,6,4,6,0,3,0,6,1,0,4,3,2,0,5,3,1,2,3,4,4,5,6,7,5,4,7,6,],
    [3,2,7,6,4,3,4,7,1,5,5,5,0,0,4,0,3,1,3,4,3,1,6,4,7,1,7,4,0,4,0,7,4,3,7,0,1,7,3,7,0,1,2,3,5,7,7,5,],
    [1,3,5,7,3,3,3,7,3,3,7,3,1,1,1,4,0,4,0,7,4,0,7,0,3,2,6,2,0,0,0,3,4,7,7,4,2,1,5,1,0,4,2,6,1,0,3,0,],
    [2,1,6,5,6,2,6,6,0,4,4,0,4,6,7,6,0,6,3,3,7,0,7,3,5,0,5,3,3,3,3,6,0,0,3,0,1,7,3,7,4,0,4,2,4,6,6,4,],
    [1,1,5,5,3,1,3,5,3,1,7,1,4,7,7,4,0,4,0,7,3,6,6,3,2,0,5,0,4,2,7,2,1,4,1,7,5,7,7,5,2,3,2,5,0,0,0,2,],
    [0,0,4,4,1,1,1,5,2,5,6,1,0,3,3,3,4,5,7,2,2,6,5,6,0,4,0,7,1,0,4,0,2,7,5,7,5,7,7,7,1,0,3,2,5,5,7,3,],
    [3,1,7,5,4,2,4,6,2,5,6,5,1,4,4,1,4,0,7,0,0,6,3,6,0,0,3,0,3,7,6,7,0,3,3,0,1,5,4,2,0,7,2,7,5,4,7,2,],
    [0,2,4,6,1,3,1,7,1,0,5,0,0,7,3,7,4,5,7,2,3,4,6,1,4,4,7,7,3,1,6,4,0,3,0,6,3,3,6,0,2,1,2,3,4,7,6,5,],
    [1,2,5,6,2,3,2,7,1,1,5,5,0,0,3,0,6,2,6,5,5,0,5,3,0,1,0,4,3,2,6,5,1,4,1,7,5,7,7,7,0,5,0,7,2,7,4,7,],
    [3,1,7,5,4,2,4,6,0,7,4,3,3,2,7,2,4,1,7,1,3,5,6,5,0,0,3,3,3,0,6,0,0,2,0,5,5,6,7,6,0,6,2,4,1,1,1,3,],
    [1,0,5,4,3,0,3,4,3,1,7,1,7,3,7,6,4,4,7,7,0,7,3,7,1,3,4,6,4,0,7,0,4,2,7,2,2,5,4,7,0,2,2,0,1,4,1,6,],
    [3,1,7,5,5,3,5,7,0,7,4,3,0,3,3,3,3,0,6,3,4,0,7,3,2,4,5,7,4,0,7,0,0,4,3,7,0,0,2,2,2,7,4,5,1,0,3,2,],
    [2,2,6,6,6,3,6,7,2,5,6,1,3,7,7,7,0,3,3,0,4,0,7,3,0,6,3,3,1,1,4,1,2,7,5,4,1,7,3,5,1,4,3,2,0,0,2,0,],
    [2,3,6,7,2,0,2,4,2,0,6,0,3,5,6,2,1,4,4,7,4,1,7,1,0,1,0,4,3,2,6,5,7,3,7,6,4,6,6,4,0,5,0,7,5,5,7,7,],
    [3,1,7,5,3,0,3,4,2,6,6,6,0,0,4,0,4,7,7,7,0,2,0,5,4,3,7,0,1,4,1,7,4,5,7,2,2,4,2,6,0,1,2,3,5,6,7,4,],
    [1,0,5,4,3,0,3,4,3,5,7,1,0,7,3,7,0,1,0,4,4,7,7,7,6,3,6,6,1,2,1,5,7,2,7,5,0,6,3,6,4,2,6,0,0,0,2,2,],
    [2,0,6,4,5,3,5,7,1,6,5,6,3,4,6,1,0,1,0,4,0,6,3,3,7,0,7,3,0,5,3,2,3,0,6,0,6,5,6,7,0,0,2,2,7,4,7,6,],
    [3,2,7,6,4,3,4,7,1,7,5,7,3,5,6,5,4,0,7,3,0,7,3,4,0,0,0,3,1,5,4,2,3,0,6,3,0,5,2,3,0,6,2,6,1,1,1,3,],
    [3,3,7,7,3,0,3,4,1,1,5,1,2,2,5,2,1,6,4,6,0,1,0,4,4,7,7,4,1,2,1,5,4,7,7,7,4,5,7,2,0,5,2,3,0,7,2,7,],
    [3,1,7,5,5,3,5,7,1,7,5,7,0,0,4,0,0,4,3,4,4,1,7,4,1,6,4,6,0,5,3,5,4,0,7,3,0,3,2,3,2,1,4,3,7,0,7,2,],
    [1,0,5,4,3,2,3,6,0,2,0,6,2,2,5,2,4,7,7,7,6,0,6,3,0,7,3,7,2,3,5,6,1,2,1,5,7,1,7,3,4,4,6,6,0,3,2,5,],
    [0,1,4,5,1,1,1,5,2,2,6,6,2,1,6,5,2,6,5,6,4,7,7,7,6,0,6,3,0,7,3,7,7,1,7,4,1,0,3,0,3,1,5,3,5,0,5,2,],
    [3,1,7,5,4,1,4,5,0,4,4,4,3,0,6,0,4,7,7,7,0,6,3,6,0,7,3,7,2,0,2,3,4,0,7,3,0,5,2,5,5,4,5,6,1,1,3,3,],
    [2,2,6,6,4,2,4,6,0,1,4,1,6,1,6,4,0,2,0,5,1,4,4,7,3,0,6,0,0,7,3,7,7,0,7,3,0,6,2,4,5,1,5,3,7,4,7,6,],
    [2,1,6,5,5,0,5,4,2,0,6,0,4,4,7,4,0,4,3,4,7,0,7,3,0,6,3,6,4,7,7,7,0,5,3,5,6,1,6,4,0,1,2,3,1,1,3,3,],
    [2,0,6,4,5,3,5,7,2,6,6,6,4,5,7,5,1,4,4,1,0,3,0,6,4,0,7,3,3,4,6,1,0,0,3,3,0,7,2,5,1,3,3,5,5,4,7,2,],
    [2,0,6,4,4,0,4,4,3,2,7,2,0,2,3,5,1,4,4,7,4,6,7,6,0,3,3,0,0,7,3,7,0,0,3,3,7,3,7,5,4,5,6,5,5,1,7,1,],
    [1,3,5,7,3,3,3,7,3,4,7,4,2,0,5,0,4,3,7,0,4,5,7,5,0,4,0,7,0,1,3,1,1,4,4,1,0,2,2,2,7,1,7,3,4,0,6,2,],
    [2,1,6,5,2,0,2,4,2,1,6,1,1,0,4,0,3,5,6,2,0,4,0,7,7,2,7,5,1,4,4,7,0,3,3,3,3,7,5,5,4,5,6,7,1,5,1,7,],
    [1,0,5,4,4,3,4,7,3,1,7,5,2,2,2,6,3,4,3,7,3,0,6,0,1,2,1,5,0,0,0,3,4,1,7,4,5,6,7,4,0,7,2,7,0,4,0,6,],
    [1,2,5,6,1,1,1,5,1,2,5,2,0,1,4,1,6,2,6,5,2,6,5,3,0,7,3,7,1,0,4,0,7,3,7,6,2,5,4,7,0,2,0,4,7,0,7,2,],
    [0,3,4,7,1,1,1,5,0,1,4,1,6,0,6,3,2,3,5,3,1,0,4,0,7,4,7,7,3,7,6,4,2,3,5,6,1,7,4,4,0,5,2,7,3,2,5,2,],
    [3,2,7,6,5,2,5,6,0,3,4,7,1,7,5,3,3,3,6,0,6,1,6,4,2,1,2,4,0,7,3,4,1,0,1,3,7,0,7,2,5,7,7,5,0,0,0,2,],
    [3,3,7,7,5,3,5,7,2,5,6,5,2,7,6,7,1,0,4,3,0,4,3,1,1,6,4,6,7,2,7,5,4,0,7,0,3,1,6,1,0,5,2,5,6,2,6,4,],
    [2,3,6,7,5,2,5,6,6,0,6,4,1,7,4,4,1,3,1,6,0,4,0,7,0,0,3,0,4,0,4,3,0,2,3,2,2,7,4,7,5,7,7,5,7,2,7,4,],
    [1,0,5,4,3,2,3,6,3,6,7,6,3,5,7,5,0,4,0,7,0,0,0,3,2,7,5,7,3,1,6,1,4,4,7,1,2,2,2,5,3,0,5,0,7,2,7,4,],
    [3,2,7,6,3,1,3,5,2,6,6,6,0,2,3,2,4,1,7,4,2,7,5,7,1,0,4,0,4,4,7,1,0,4,0,7,5,0,7,0,0,1,2,1,1,4,1,6,],
    [0,2,4,6,3,1,3,5,2,7,6,7,2,1,5,1,4,2,7,5,7,1,7,4,4,4,7,7,2,0,5,0,0,4,0,7,0,0,2,2,5,2,7,0,4,5,6,3,],
    [0,3,4,7,2,3,2,7,2,3,6,3,0,7,3,7,4,1,7,1,0,1,3,1,3,5,6,5,7,4,7,7,1,0,4,0,0,0,2,2,3,4,5,4,4,5,6,7,],
    [3,2,7,6,6,1,6,5,1,0,1,4,4,3,7,3,0,6,3,3,1,7,4,4,2,1,5,1,2,3,5,6,4,0,7,0,4,7,6,7,0,3,0,5,0,7,2,5,],
    [2,1,6,5,3,2,3,6,0,0,0,4,4,0,7,0,4,2,7,5,2,7,5,7,1,1,1,4,4,6,7,6,6,0,6,3,2,3,4,5,0,7,2,5,2,2,4,0,],
    [3,2,7,6,4,3,4,7,0,0,4,4,1,4,4,4,0,7,3,7,2,0,5,0,2,3,2,6,2,1,5,1,7,1,7,4,4,4,6,2,0,3,0,5,5,2,7,0,],
    [2,3,6,7,4,1,4,5,0,1,4,1,3,5,6,5,1,0,4,0,5,0,5,3,0,6,3,3,7,2,7,5,1,4,4,7,1,7,3,7,6,0,6,2,0,4,2,2,],
    [3,0,7,4,6,3,6,7,2,6,6,6,4,7,7,7,1,3,1,6,0,1,0,4,0,0,3,3,3,5,6,2,1,2,4,5,3,2,6,2,5,0,7,0,0,7,2,7,],
    [3,2,7,6,6,1,6,5,3,1,7,1,4,3,7,3,4,4,7,7,2,2,2,5,0,3,0,6,1,0,1,3,2,7,5,7,1,6,3,6,5,2,7,0,4,2,6,0,],
    [0,1,4,5,3,0,3,4,1,1,5,1,2,4,5,4,0,4,0,7,1,7,4,7,1,4,4,7,4,3,7,0,4,6,7,3,5,7,7,5,0,0,2,0,7,5,7,7,],
    [3,0,7,4,4,0,4,4,0,3,4,3,3,5,7,5,0,4,0,7,4,7,7,7,2,4,2,7,7,0,7,3,0,2,3,2,1,1,3,1,4,6,6,6,1,4,1,6,],
    [0,0,4,4,1,1,1,5,2,3,2,7,4,2,7,2,4,6,7,3,0,1,0,4,4,3,7,6,3,4,3,7,4,0,7,0,5,7,7,5,4,5,6,7,2,1,4,1,],
    [1,1,5,5,3,1,3,5,3,1,7,1,2,7,5,4,4,7,7,4,2,3,2,6,0,1,0,4,4,3,7,3,4,0,7,0,4,2,6,4,0,5,0,7,5,7,7,5,],
    [2,2,6,6,4,2,4,6,0,0,4,0,0,2,0,5,6,2,6,5,2,7,5,7,5,1,5,4,1,1,4,1,1,3,1,6,7,4,7,6,2,3,2,5,7,0,7,2,],
    [1,1,5,5,4,1,4,5,3,4,7,4,3,1,6,1,2,4,5,7,0,3,3,6,7,0,7,3,0,4,3,7,3,0,6,0,0,0,0,2,5,1,5,3,0,5,0,7,],
    [1,3,5,7,1,0,1,4,3,1,7,5,2,1,5,4,2,2,5,5,4,7,7,4,0,6,3,6,2,0,5,0,0,3,0,6,4,1,6,3,7,0,7,2,0,0,0,2,],
    [1,3,5,7,4,2,4,6,2,3,6,3,3,4,6,4,7,2,7,5,0,1,0,4,3,1,6,1,2,0,5,0,1,7,4,7,0,6,3,6,5,6,7,6,0,0,2,2,],
    [0,2,4,6,3,2,3,6,6,2,6,6,2,2,5,2,4,0,7,0,0,1,3,1,2,7,5,7,0,4,0,7,1,7,4,4,5,3,5,6,5,1,7,1,0,0,2,0,],
    [1,2,5,6,4,1,4,5,3,0,7,0,3,5,7,5,0,0,3,3,0,3,0,6,1,4,4,7,7,2,7,5,3,1,6,4,5,1,7,1,5,4,7,2,5,7,7,7,],
    [0,3,4,7,1,0,1,4,0,1,4,1,0,4,4,4,4,6,7,3,2,0,5,0,2,2,5,2,6,0,6,3,4,3,7,6,5,7,7,5,7,0,7,2,4,5,6,7,],
    [3,2,7,6,6,1,6,5,2,0,2,4,3,5,7,5,3,7,6,7,0,6,3,6,1,2,1,5,4,0,7,0,0,0,3,3,4,6,6,6,3,1,5,1,0,3,0,5,],
    [3,1,7,5,7,2,7,6,3,3,7,7,1,0,4,0,3,6,6,3,1,4,4,1,3,7,6,7,0,3,0,6,3,4,6,1,0,0,0,2,1,5,1,7,1,3,3,5,],
    [3,1,7,5,5,1,5,5,1,6,5,6,2,5,6,5,0,7,3,7,3,0,6,0,1,0,1,3,0,3,0,6,1,4,4,1,4,3,7,3,0,2,2,2,4,7,6,7,],
    [1,1,5,5,2,1,2,5,3,4,7,0,1,5,4,5,3,1,6,1,1,7,4,7,4,6,7,6,0,6,3,6,1,0,4,0,5,4,7,2,5,4,7,6,5,7,7,7,],
    [3,2,7,6,4,3,4,7,2,3,2,7,3,3,7,3,1,3,1,6,3,4,6,7,0,2,3,2,6,1,6,4,2,0,5,0,3,5,3,7,0,4,0,6,5,7,7,5,],
    [0,3,4,7,2,1,2,5,2,1,6,1,0,5,3,5,4,6,7,6,4,5,7,2,0,7,3,4,3,2,6,5,4,0,7,0,4,4,7,1,3,3,5,5,5,7,7,7,],
    [3,1,7,5,3,0,3,4,3,6,7,2,4,0,7,3,1,5,4,5,1,7,4,7,4,6,7,6,1,0,1,3,0,0,0,3,2,0,2,3,4,5,6,5,5,2,7,0,],
    [0,3,4,7,3,2,3,6,0,4,4,0,3,3,7,3,4,1,7,1,4,4,7,7,4,7,7,4,0,0,3,0,4,2,7,2,1,5,3,7,7,5,7,7,0,7,2,7,],
    [3,0,7,4,4,0,4,4,1,4,5,4,3,5,6,5,0,1,0,4,4,7,7,7,2,6,5,6,7,0,7,3,1,0,1,3,0,0,3,3,0,7,2,5,1,7,3,7,],
    [2,0,6,4,3,1,3,5,0,3,4,3,7,2,7,6,4,0,7,0,1,4,4,7,4,1,7,1,0,4,0,7,4,6,7,6,5,4,5,7,4,4,6,2,1,0,3,2,],
    [1,1,5,5,2,2,2,6,3,6,7,2,1,2,5,2,4,7,7,4,4,0,7,0,0,0,3,0,6,1,6,4,0,3,0,6,7,5,7,7,1,4,3,4,1,7,3,7,],
    [0,0,4,4,2,0,2,4,2,0,6,0,0,4,3,4,3,2,6,5,2,7,5,7,3,1,6,1,7,3,7,6,0,5,3,5,2,6,4,6,5,2,7,2,3,1,5,3,],
    [3,2,7,6,6,2,6,6,1,1,5,5,1,4,1,7,1,2,4,5,0,0,3,0,3,1,6,1,2,4,2,7,3,7,6,7,4,0,7,0,5,3,7,5,7,1,7,3,],
    [3,3,7,7,4,0,4,4,2,1,6,1,3,4,7,4,1,2,1,5,7,0,7,3,0,3,0,6,1,6,4,6,3,7,6,7,5,3,7,5,1,1,3,3,0,1,0,3,],
    [3,2,7,6,6,1,6,5,2,1,2,5,3,3,7,7,0,4,0,7,1,4,1,7,7,2,7,5,4,7,7,7,1,2,4,5,2,0,5,3,3,6,5,6,5,0,5,2,],
    [1,1,5,5,2,1,2,5,1,2,5,2,0,0,3,0,7,0,7,3,3,4,3,7,3,1,6,1,0,3,0,6,3,3,6,3,6,5,6,7,7,5,7,7,1,4,1,6,],
    [2,2,6,6,2,1,2,5,1,2,1,6,4,2,4,5,1,0,4,0,7,1,7,4,2,6,5,6,0,7,3,7,6,1,6,4,7,4,7,7,5,0,7,0,0,4,0,6,],
    [1,2,5,6,4,1,4,5,3,7,7,3,1,3,1,6,7,4,7,7,0,1,3,1,3,3,6,3,2,4,2,7,0,3,0,6,0,0,2,0,6,0,6,2,6,5,6,7,],
    [3,1,7,5,3,0,3,4,1,5,5,5,2,0,6,0,0,7,3,7,4,3,7,6,1,0,1,3,7,0,7,3,2,6,5,6,2,1,2,3,0,3,0,5,5,7,7,7,],
    [0,0,4,4,2,0,2,4,2,0,6,0,1,2,1,6,7,4,7,7,6,3,6,6,2,5,5,5,0,7,3,7,4,1,7,1,3,2,6,2,5,3,5,5,2,6,4,6,],
    [0,0,4,4,1,1,1,5,2,0,6,4,2,3,5,0,2,7,5,4,0,2,0,5,3,4,6,1,4,7,7,7,4,0,7,3,2,4,4,6,0,1,2,1,7,4,7,6,],
    [0,3,4,7,3,2,3,6,3,3,7,3,2,4,5,4,4,4,7,7,0,4,3,7,2,0,2,3,4,2,7,2,4,0,7,0,4,5,6,7,4,1,6,1,0,5,0,7,],
    [1,3,5,7,3,1,3,5,0,1,4,1,2,5,5,5,1,4,4,7,4,0,7,3,0,4,3,7,7,0,7,3,4,2,7,5,5,2,5,4,5,6,7,4,1,0,3,0,],
    [3,3,7,7,4,0,4,4,2,1,6,1,3,4,7,4,0,3,3,6,7,0,7,3,0,4,3,7,1,3,4,6,3,4,6,7,0,0,0,2,5,7,7,5,4,7,6,5,],
    [2,3,6,7,5,3,5,7,1,0,1,4,3,7,6,7,3,3,6,0,4,1,7,4,1,7,4,4,0,3,0,6,3,6,6,6,0,1,3,1,1,0,3,0,7,5,7,7,],
    [2,2,6,6,4,0,4,4,0,0,4,0,0,1,4,1,4,5,7,2,0,3,3,6,1,7,4,7,4,1,7,1,7,4,7,7,0,2,2,4,2,4,4,6,1,2,3,4,],
    [3,0,7,4,4,0,4,4,1,4,5,4,2,7,5,7,1,0,1,3,4,3,4,6,0,3,0,6,6,0,6,3,3,3,3,6,6,4,6,7,5,3,7,5,1,5,1,7,],
    [1,2,5,6,3,2,3,6,3,2,7,2,3,0,7,0,6,4,6,7,7,4,7,7,2,7,5,7,3,1,6,1,0,2,0,5,0,6,3,3,4,4,4,6,0,0,2,2,],
    [0,3,4,7,1,0,1,4,0,1,4,1,0,2,3,2,7,0,7,3,5,0,5,3,4,4,7,4,0,7,3,7,4,5,7,5,2,0,4,0,2,4,4,6,0,4,2,6,],
    [1,2,5,6,3,0,3,4,3,0,7,0,2,6,6,2,1,7,4,7,5,1,5,4,4,6,7,3,1,3,1,6,0,4,0,7,0,2,2,0,7,5,7,7,6,5,6,7,],
    [0,2,4,6,3,1,3,5,1,2,5,2,2,3,5,3,4,0,7,3,1,4,1,7,2,7,5,7,4,5,7,2,0,4,0,7,5,6,7,4,7,5,7,7,1,0,3,0,],
    [3,1,7,5,5,1,5,5,2,3,6,3,3,5,6,5,0,2,0,5,3,6,6,6,2,0,5,0,1,7,4,7,4,7,7,7,0,6,2,6,0,2,2,2,7,0,7,2,],
    [0,3,4,7,1,1,1,5,1,2,5,2,0,1,3,1,3,5,6,5,7,3,7,6,3,4,6,7,6,3,6,6,2,0,5,0,0,7,2,7,4,2,6,0,7,0,7,2,],
    [1,2,5,6,4,1,4,5,1,1,5,1,3,5,7,5,4,7,7,7,0,4,0,7,0,0,0,3,4,0,7,0,6,1,6,4,3,2,5,4,3,0,5,2,1,5,3,3,],
    [3,1,7,5,3,0,3,4,4,0,4,4,0,1,3,1,1,7,4,7,1,3,4,6,2,0,2,3,0,6,3,6,5,0,5,3,5,6,7,4,5,5,7,7,0,3,2,5,],
    [1,3,5,7,4,2,4,6,1,2,5,2,3,6,6,6,0,1,0,4,3,7,6,7,4,0,7,0,7,3,7,6,5,3,5,6,4,1,7,1,6,3,6,5,0,5,2,3,],
    [0,0,4,4,3,3,3,7,3,2,7,2,2,3,5,3,4,6,7,6,3,0,6,3,2,4,2,7,4,0,7,0,0,1,0,4,7,3,7,5,0,5,0,7,3,7,5,7,],
    [1,2,5,6,4,1,4,5,2,7,6,7,3,5,7,5,0,4,3,1,6,0,6,3,2,0,5,0,1,6,4,6,0,0,0,3,7,1,7,3,3,2,5,4,0,5,0,7,],
    [0,3,4,7,3,2,3,6,0,2,4,2,3,3,7,3,3,1,6,1,4,6,7,6,0,0,3,0,7,3,7,6,1,7,4,4,4,5,6,5,4,0,6,0,5,2,7,2,],
    [1,1,5,5,4,0,4,4,2,1,6,1,3,2,6,2,2,3,2,6,3,7,6,7,1,4,1,7,3,6,6,6,0,0,3,0,7,3,7,5,5,4,7,2,0,2,0,4,],
    [2,0,6,4,4,2,4,6,1,6,5,6,3,2,6,2,3,7,6,7,7,0,7,3,0,0,0,3,0,4,3,4,1,0,1,3,2,1,2,3,7,5,7,7,0,5,2,5,],
    [3,1,7,5,5,1,5,5,2,3,6,3,2,5,6,5,3,0,6,0,0,2,0,5,4,4,7,7,7,1,7,4,1,7,4,7,3,4,3,6,0,6,2,6,5,6,7,6,],
    [3,0,7,4,4,1,4,5,2,4,6,4,1,4,1,7,1,3,4,0,2,7,5,7,3,6,6,6,7,0,7,3,0,5,3,2,0,0,2,0,0,6,2,6,0,1,2,1,],
    [1,0,5,4,2,1,2,5,3,3,3,7,1,1,5,1,2,0,5,0,0,4,0,7,4,6,7,3,4,2,7,2,1,2,1,5,5,6,7,6,2,7,4,5,0,1,0,3,],
    [1,2,5,6,2,3,2,7,0,0,4,0,1,3,5,3,6,4,6,7,7,2,7,5,0,1,0,4,3,2,6,2,1,4,1,7,3,5,5,7,2,1,4,1,5,4,7,6,],
    [1,3,5,7,3,3,3,7,0,2,4,2,1,7,4,7,4,3,7,6,4,4,7,7,3,0,6,0,4,1,7,4,0,1,3,1,7,0,7,3,4,5,6,7,0,7,2,5,],
    [3,0,7,4,7,1,7,5,0,4,4,4,0,3,4,3,2,0,5,3,5,4,5,7,4,6,7,6,1,5,4,5,0,6,3,6,4,0,6,2,0,0,0,2,1,0,1,2,],
    [1,0,5,4,2,1,2,5,2,0,6,0,1,1,4,1,3,7,6,4,1,7,4,4,1,2,1,5,3,4,6,1,0,2,0,5,2,4,5,1,4,7,6,7,0,7,2,5,],
    [1,3,5,7,4,3,4,7,3,6,7,6,3,0,7,4,0,2,3,2,3,0,6,0,0,7,3,7,7,0,7,3,2,1,5,1,0,5,2,5,3,3,5,3,2,0,4,2,],
    [3,2,7,6,4,3,4,7,1,7,5,7,2,1,5,1,7,1,7,4,0,7,3,4,2,0,5,0,0,2,3,5,1,1,1,4,5,3,7,5,5,2,7,0,0,4,2,6,],
    [3,0,7,4,5,2,5,6,2,6,6,6,0,5,4,5,1,1,4,4,3,7,6,7,7,0,7,3,1,3,4,3,0,2,0,5,6,0,6,2,2,0,4,2,7,4,7,6,],
    [0,2,4,6,3,2,3,6,3,3,7,3,2,2,5,2,4,4,7,7,4,7,7,4,1,1,4,1,0,4,0,7,3,0,6,0,5,7,7,5,4,5,6,3,7,0,7,2,],
    [2,1,6,5,4,3,4,7,1,7,5,7,0,6,4,2,4,1,7,4,1,1,1,4,1,0,4,0,6,1,6,4,0,2,0,5,3,4,3,6,5,0,7,0,7,5,7,7,],
    [1,3,5,7,2,1,2,5,1,4,5,0,1,5,4,5,4,4,7,4,0,3,0,6,7,0,7,3,3,1,3,4,0,7,3,7,4,3,6,5,4,0,6,2,0,0,2,0,],
    [0,1,4,5,1,2,1,6,2,4,6,0,1,0,5,0,0,2,0,5,2,6,5,3,4,6,7,3,1,1,4,1,0,7,3,7,4,7,7,4,5,2,7,2,5,7,7,5,],
    [0,1,4,5,4,2,4,6,3,1,7,5,2,6,5,6,3,7,6,7,3,0,6,3,7,1,7,4,1,3,1,6,0,0,3,3,0,5,3,5,4,0,6,2,1,0,3,2,],
    [3,0,7,4,4,0,4,4,1,4,5,4,3,3,6,0,7,0,7,3,0,1,3,1,4,3,4,6,0,2,0,5,4,7,7,7,5,3,7,5,0,5,2,5,3,5,3,7,],
    [3,1,7,5,6,0,6,4,0,2,0,6,4,4,7,4,0,1,3,4,2,4,5,1,1,0,4,3,3,4,6,7,3,6,6,6,1,7,3,5,1,4,1,6,0,2,2,0,],
    [2,1,6,5,5,0,5,4,6,0,6,4,1,5,5,5,1,3,4,0,7,2,7,5,0,1,3,4,0,7,3,7,3,6,6,6,1,0,3,0,0,4,0,6,2,4,4,2,],
    [3,2,7,6,5,2,5,6,3,1,7,1,3,6,6,6,2,2,2,5,1,3,1,6,3,4,6,7,0,7,3,7,4,0,7,0,1,0,3,0,6,2,6,4,0,0,0,2,],
    [1,3,5,7,1,0,1,4,0,0,4,0,4,2,7,5,4,3,7,0,2,3,5,6,1,4,1,7,0,2,0,5,3,3,6,6,3,1,5,1,2,5,2,7,7,2,7,4,],
    [1,1,5,5,4,0,4,4,3,1,7,1,3,2,6,2,3,4,6,7,0,4,3,7,2,4,5,7,1,4,4,7,7,4,7,7,0,1,0,3,0,5,0,7,0,1,2,3,],
    [1,3,5,7,2,1,2,5,1,1,5,1,1,4,4,7,0,3,0,6,4,2,4,5,7,4,7,7,6,4,6,7,3,0,6,0,1,5,3,7,0,0,2,0,5,2,7,0,],
    [1,1,5,5,3,1,3,5,3,2,7,2,1,5,4,5,6,3,6,6,7,4,7,7,0,0,0,3,0,7,3,7,2,6,5,6,3,0,6,0,3,1,5,1,1,2,1,4,],
    [2,1,6,5,3,1,3,5,7,2,7,6,2,5,5,5,1,6,4,6,3,0,6,0,0,3,0,6,1,7,4,7,4,1,7,1,4,4,7,1,0,0,2,0,0,2,2,4,],
    [3,2,7,6,5,0,5,4,2,0,6,0,3,3,6,6,2,3,5,6,1,7,4,7,0,1,3,1,0,2,0,5,7,2,7,5,1,4,1,6,1,3,3,5,2,6,4,6,],
    [3,0,7,4,7,1,7,5,2,7,6,7,4,4,7,4,0,5,3,2,0,4,3,1,4,6,7,6,1,2,4,2,3,5,6,5,6,0,6,2,0,0,0,2,3,3,5,3,],
    [0,2,4,6,3,1,3,5,0,1,4,1,2,5,5,5,1,7,4,7,7,2,7,5,4,3,7,6,6,1,6,4,2,0,2,3,1,4,1,6,5,0,5,2,5,5,5,7,],
    [0,3,4,7,3,3,3,7,3,4,7,4,1,7,4,7,4,3,7,3,1,5,4,2,4,1,7,1,0,4,0,7,1,3,4,0,4,5,4,7,1,2,3,0,6,5,6,7,],
    [1,2,5,6,2,3,2,7,1,7,5,7,1,3,4,3,4,2,7,5,4,4,7,7,0,0,3,0,4,0,7,0,4,1,7,4,0,4,0,7,3,6,5,6,5,1,7,1,],
    [3,2,7,6,7,3,7,7,0,6,4,2,0,4,3,1,2,6,5,3,0,0,0,3,2,3,5,6,2,0,5,0,1,0,1,3,0,7,2,7,4,1,6,1,4,6,6,4,],
    [1,0,5,4,3,0,3,4,1,3,5,7,4,1,7,1,7,3,7,6,0,7,3,7,0,1,0,4,1,4,4,7,6,3,6,6,4,5,6,7,5,5,7,7,5,0,7,0,],
    [0,0,4,4,1,1,1,5,2,1,6,5,0,3,3,3,3,0,6,3,2,5,5,5,4,2,7,5,2,7,5,7,0,4,0,7,1,6,3,6,7,0,7,2,5,1,7,3,],
    [1,1,5,5,3,3,3,7,2,1,6,1,1,7,4,7,6,2,6,5,0,0,3,0,5,0,5,3,0,2,0,5,7,2,7,5,2,4,2,6,5,6,7,6,1,3,1,5,],
    [0,3,4,7,2,1,2,5,4,0,4,4,0,1,3,1,4,6,7,3,0,0,3,0,0,3,0,6,4,5,7,2,5,0,5,3,7,5,7,7,1,5,3,7,5,6,7,4,],
    [0,0,4,4,2,2,2,6,1,6,5,6,2,1,6,1,1,0,4,0,3,4,3,7,7,2,7,5,4,7,7,7,0,2,0,5,5,4,7,6,6,2,6,4,1,2,1,4,],
    [2,3,6,7,5,2,5,6,1,0,5,0,2,6,6,6,1,1,4,1,6,2,6,5,0,2,3,5,1,4,1,7,3,3,6,0,0,2,0,5,7,0,7,2,3,7,5,7,],
    [3,3,7,7,6,2,6,6,0,1,4,5,0,3,4,7,1,1,4,1,2,2,5,2,1,0,4,0,5,3,5,6,1,3,1,6,0,4,2,4,1,7,3,5,7,3,7,5,],
    [3,2,7,6,6,1,6,5,1,3,5,7,1,1,4,4,5,0,5,3,7,0,7,3,1,4,1,7,0,3,3,0,2,3,5,6,0,4,0,7,5,5,7,7,0,0,2,0,],
    [2,3,6,7,2,0,2,4,0,6,4,6,1,2,4,2,4,4,7,7,4,1,7,4,4,0,7,3,0,2,0,5,4,3,7,6,2,5,2,7,5,3,7,5,0,0,2,0,],
    [1,2,5,6,3,0,3,4,3,0,7,0,1,3,4,6,0,2,0,5,4,3,7,6,7,3,7,6,6,1,6,4,0,6,3,6,0,1,3,1,1,4,3,6,0,7,2,7,],
    [3,3,7,7,5,1,5,5,2,1,6,1,4,5,7,5,0,6,3,6,0,2,3,2,2,0,5,0,1,4,4,4,2,7,5,7,1,7,3,5,0,5,2,5,0,0,0,2,],
    [3,0,7,4,4,0,4,4,0,3,4,3,3,4,6,4,1,4,1,7,2,4,2,7,3,6,6,6,4,5,7,5,0,1,3,1,1,0,3,2,3,5,5,3,6,0,6,2,],
    [3,2,7,6,7,3,7,7,1,1,1,5,2,2,2,6,3,1,6,4,2,7,5,7,4,0,7,3,0,3,3,3,2,6,5,6,4,4,6,6,0,0,2,0,4,1,6,3,],
    [3,2,7,6,4,3,4,7,2,4,6,0,3,7,6,7,6,1,6,4,0,7,3,4,0,0,3,0,1,1,1,4,7,2,7,5,1,1,3,1,0,1,0,3,1,7,3,7,],
    [3,2,7,6,4,3,4,7,1,7,5,7,1,1,1,4,4,0,7,3,2,2,2,5,0,4,0,7,3,0,6,3,4,2,7,5,3,4,5,6,5,5,7,7,0,1,0,3,],
    [1,3,5,7,3,1,3,5,3,1,7,1,4,7,7,4,0,2,0,5,5,2,5,5,0,0,3,0,0,6,3,6,0,7,3,7,6,2,6,5,4,3,4,5,7,5,7,7,],
    [2,2,6,6,3,0,3,4,1,2,1,6,2,4,5,4,4,1,7,1,2,7,5,7,7,2,7,5,4,0,7,0,0,3,0,6,3,4,6,7,6,3,6,5,0,1,2,1,],
    [1,3,5,7,1,0,1,4,2,0,6,4,3,0,6,3,1,6,4,3,4,0,7,0,3,3,6,6,2,3,5,6,1,4,4,7,0,4,2,6,5,1,7,1,5,4,7,6,],
    [0,3,4,7,2,1,2,5,3,1,3,5,3,0,7,4,0,4,3,7,4,3,4,6,7,0,7,3,4,2,7,5,5,4,5,7,1,1,1,3,0,5,2,7,0,0,0,2,],
    [1,0,5,4,4,3,4,7,2,6,6,6,6,3,6,6,3,4,3,7,3,1,6,1,0,2,0,5,1,3,1,6,4,2,7,2,2,0,5,0,5,7,7,7,2,2,2,4,],
    [2,1,6,5,3,2,3,6,2,6,6,6,5,0,5,3,1,1,1,4,1,0,4,0,7,1,7,4,4,7,7,7,0,1,0,4,0,5,2,7,5,2,7,0,6,2,6,4,],
    [0,0,4,4,1,1,1,5,0,5,4,5,0,3,3,3,0,0,3,0,4,7,7,4,4,3,7,3,4,1,7,1,0,7,3,4,4,2,6,0,5,5,7,7,5,2,7,2,],
    [1,2,5,6,3,2,3,6,3,2,7,2,4,6,7,3,3,2,6,5,1,4,1,7,4,4,7,1,0,1,0,4,2,0,5,0,2,4,2,7,5,7,7,5,0,5,0,7,],
    [3,0,7,4,5,0,5,4,2,2,6,2,3,4,6,4,0,6,3,3,3,6,6,6,0,1,0,4,2,5,5,5,4,7,7,7,5,5,7,5,1,1,3,1,0,7,2,7,],
    [3,2,7,6,7,3,7,7,2,4,6,0,1,0,1,4,0,7,3,4,0,1,0,4,3,0,6,3,3,7,6,4,2,0,2,3,4,4,6,2,1,7,3,5,2,7,4,5,],
    [0,3,4,7,3,2,3,6,2,3,6,3,2,6,5,6,0,4,0,7,2,4,5,4,1,3,4,0,4,0,7,3,7,4,7,7,5,0,7,0,1,5,1,7,1,0,3,0,],
    [1,3,5,7,4,3,4,7,3,6,7,6,3,3,6,3,0,2,3,2,7,1,7,4,0,0,3,0,0,7,3,7,0,1,3,1,0,4,0,6,5,5,7,5,4,1,4,3,],
    [2,1,6,5,5,0,5,4,0,6,4,2,4,4,7,4,0,4,3,1,3,4,6,7,7,4,7,7,6,0,6,3,1,7,4,7,0,5,2,3,0,0,0,2,0,7,2,5,],
    [3,1,7,5,6,0,6,4,4,3,4,7,4,0,7,0,0,7,3,4,0,5,3,2,7,4,7,7,0,0,3,0,0,1,0,4,1,3,3,3,3,5,3,7,5,5,5,7,],
    [3,2,7,6,5,0,5,4,6,0,6,4,1,1,5,1,0,1,3,4,0,3,3,6,7,1,7,4,4,4,7,7,0,2,3,5,0,6,2,6,2,0,4,0,0,7,2,7,],
    [0,0,4,4,2,2,2,6,1,6,5,6,0,2,0,6,3,5,6,5,3,4,6,1,3,7,6,7,3,0,6,0,2,1,5,1,4,2,6,4,7,3,7,5,5,4,7,2,],
    [0,1,4,5,3,0,3,4,0,0,4,0,2,2,5,2,4,1,7,1,2,4,5,7,1,4,4,7,4,3,7,3,6,2,6,5,5,4,7,2,0,7,2,7,5,5,7,7,],
    [2,2,6,6,5,1,5,5,4,3,4,7,1,3,1,6,0,3,3,0,0,7,3,7,2,4,5,7,2,3,5,0,7,1,7,4,6,2,6,4,0,2,2,0,5,7,7,7,],
    [1,2,5,6,1,1,1,5,1,2,5,2,0,1,4,1,3,5,6,2,0,3,3,3,1,6,4,6,7,1,7,4,1,0,4,0,6,5,6,7,5,0,7,0,5,7,7,5,],
    [2,0,6,4,3,0,3,4,0,0,0,4,1,3,1,6,2,7,5,4,6,4,6,7,4,0,7,0,2,5,5,5,3,0,6,3,3,7,5,7,7,4,7,6,5,1,7,1,],
    [1,3,5,7,2,0,2,4,5,1,5,5,1,2,4,2,4,0,7,0,0,3,0,6,4,3,7,6,1,7,4,4,7,1,7,4,0,7,2,5,3,4,5,6,0,0,0,2,],
    [1,0,5,4,4,3,4,7,7,1,7,5,0,6,4,6,1,4,4,1,0,2,3,5,3,3,6,0,6,3,6,6,2,0,5,0,1,7,3,7,0,5,2,5,1,1,3,3,],
    [3,3,7,7,5,3,5,7,0,3,4,7,0,0,3,0,3,7,6,4,4,0,7,3,0,2,3,5,0,1,3,4,1,1,4,1,4,3,7,0,0,6,2,6,2,7,4,5,],
    [1,1,5,5,4,0,4,4,2,1,6,1,3,4,7,4,3,6,6,6,1,5,4,5,0,0,0,3,4,7,7,7,0,7,3,7,5,3,7,5,0,4,0,6,1,4,3,2,],
    [0,3,4,7,0,0,0,4,4,2,4,6,7,1,7,5,6,1,6,4,2,0,5,0,5,3,5,6,1,0,1,3,2,1,2,4,5,7,7,5,1,5,3,7,0,5,0,7,],
    [3,2,7,6,5,0,5,4,3,3,3,7,3,0,6,0,2,1,2,4,0,3,0,6,7,1,7,4,1,2,1,5,3,7,6,7,6,1,6,3,4,4,6,6,0,0,2,0,],
    [1,1,5,5,3,3,3,7,0,7,4,7,4,6,7,6,0,0,3,0,3,2,6,5,0,2,0,5,5,0,5,3,1,1,1,4,0,6,3,6,4,0,4,2,7,2,7,4,],
    [0,1,4,5,3,1,3,5,3,2,7,2,1,5,4,5,3,7,6,4,3,0,6,0,4,1,7,1,5,4,5,7,7,3,7,6,0,6,2,6,0,2,2,4,0,0,2,2,],
    [3,0,7,4,6,3,6,7,2,6,6,6,4,3,7,3,0,0,3,3,1,2,1,5,1,6,4,3,0,4,0,7,2,3,5,0,5,1,7,1,5,4,7,2,2,7,4,7,],
    [1,1,5,5,2,1,2,5,6,3,6,7,1,3,1,7,4,3,7,0,0,0,0,3,2,4,5,7,7,4,7,7,2,0,5,3,3,6,5,4,4,0,6,2,0,4,0,6,],
    [0,1,4,5,3,0,3,4,1,7,5,3,2,0,5,0,0,3,3,6,6,4,6,7,7,0,7,3,2,7,5,7,1,3,1,6,4,1,6,1,5,2,7,4,0,0,2,2,],
    [1,0,5,4,2,1,2,5,3,1,7,5,0,6,3,6,4,4,4,7,7,1,7,4,1,1,1,4,0,7,3,7,4,0,7,0,3,3,3,5,5,2,7,4,0,1,0,3,],
    [2,1,6,5,4,1,4,5,3,3,7,3,0,4,4,0,2,2,2,5,2,7,5,7,3,6,6,6,0,0,3,0,1,1,1,4,5,1,7,1,7,4,7,6,5,2,7,0,],
    [1,2,5,6,4,1,4,5,7,2,7,6,3,3,6,3,0,3,0,6,3,7,6,4,1,4,1,7,0,2,3,5,0,0,3,0,4,7,6,7,2,2,4,0,5,2,7,0,],
    [1,0,5,4,4,3,4,7,3,0,7,4,3,7,6,7,2,4,2,7,4,6,7,6,7,0,7,3,0,0,3,3,0,3,0,6,2,0,4,2,5,3,7,5,4,0,6,2,],
    [0,3,4,7,3,3,3,7,2,6,6,6,5,2,5,5,3,1,6,1,3,0,6,0,7,2,7,5,1,0,1,3,0,2,3,2,0,2,2,0,6,3,6,5,0,6,2,4,],
    [0,0,4,4,2,2,2,6,2,6,6,6,1,2,4,2,1,7,4,7,1,0,4,0,5,1,5,4,6,2,6,5,1,3,1,6,5,7,7,7,7,3,7,5,5,0,7,2,],
    [1,2,5,6,2,3,2,7,0,6,4,6,0,4,3,1,2,0,5,0,3,2,6,5,3,5,6,2,7,1,7,4,3,3,6,0,5,7,7,5,0,1,2,1,0,7,2,7,],
    [3,0,7,4,6,3,6,7,0,6,4,2,2,6,6,6,2,0,2,3,0,7,3,7,4,4,7,1,1,0,1,3,1,6,4,3,0,1,0,3,7,2,7,4,4,0,6,2,],
    [0,3,4,7,3,2,3,6,3,3,7,3,2,6,5,6,0,7,3,7,1,2,4,2,2,1,5,1,6,4,6,7,4,0,7,0,0,4,0,6,1,0,3,0,7,5,7,7,],
    [2,1,6,5,4,3,4,7,0,7,4,7,7,4,7,7,3,3,6,0,7,0,7,3,6,1,6,4,0,5,3,5,2,0,5,0,0,0,2,2,0,4,2,4,3,4,5,6,],
    [1,3,5,7,3,1,3,5,6,3,6,7,2,5,5,5,4,0,7,3,0,3,3,0,7,4,7,7,4,4,7,1,0,7,3,7,0,5,2,3,0,2,2,0,0,6,2,6,],
    [2,1,6,5,3,2,3,6,1,5,5,5,0,2,0,5,1,7,4,7,7,4,7,7,4,0,7,3,2,0,5,3,1,1,1,4,6,1,6,4,4,6,6,6,7,0,7,2,],
    [3,0,7,4,5,0,5,4,2,2,6,2,3,4,6,4,1,3,4,3,0,3,0,6,7,0,7,3,4,5,7,5,4,7,7,7,0,7,3,7,3,6,5,6,2,4,2,6,],
    [2,3,6,7,5,2,5,6,7,2,7,6,2,6,6,6,0,3,3,0,3,3,6,0,0,2,3,5,1,0,4,3,2,7,5,7,0,7,2,5,0,4,0,6,2,2,4,0,],
    [1,2,5,6,2,3,2,7,4,0,4,4,7,0,7,4,0,1,3,1,1,3,1,6,4,7,7,7,0,2,0,5,3,5,6,5,5,1,5,4,0,0,2,0,0,7,2,7,],
    [0,3,4,7,2,3,2,7,3,7,7,3,3,1,3,5,4,3,7,6,4,4,7,7,2,2,5,2,3,0,6,0,1,0,1,3,0,4,0,6,1,5,1,7,0,0,0,2,],
    [3,3,7,7,4,0,4,4,3,1,7,1,3,4,6,4,1,2,1,5,0,1,0,4,2,0,2,3,7,2,7,5,2,6,5,6,0,7,2,5,2,7,4,7,6,1,6,3,],
    [0,1,4,5,2,3,2,7,5,2,5,6,0,7,3,7,7,2,7,5,0,0,3,3,1,0,4,0,4,7,7,7,4,4,7,1,6,3,6,5,0,2,0,4,4,1,4,3,],
    [1,0,5,4,5,1,5,5,0,2,4,6,6,3,6,6,0,0,3,3,1,4,4,7,0,7,3,7,4,0,7,0,7,2,7,5,3,4,5,6,2,6,4,4,0,1,2,3,],
    [1,0,5,4,4,0,4,4,1,2,5,6,3,6,7,6,0,6,3,3,2,0,5,0,0,2,0,5,4,7,7,4,1,7,4,4,0,7,2,5,5,3,7,3,7,0,7,2,],
    [0,2,4,6,1,3,1,7,2,5,6,1,3,3,6,0,7,2,7,5,0,4,0,7,3,6,6,3,1,0,4,0,2,1,5,1,6,5,6,7,2,7,4,7,1,2,3,2,],
    [1,3,5,7,2,0,2,4,2,1,6,1,1,0,4,0,2,5,5,2,3,3,6,6,7,2,7,5,1,4,1,7,0,0,0,3,5,0,7,0,4,5,6,7,2,7,4,7,],
    [2,1,6,5,5,0,5,4,1,1,1,5,4,4,7,4,2,6,5,6,6,0,6,3,2,5,5,5,0,0,3,0,0,2,0,5,2,4,4,2,5,7,7,7,7,2,7,4,],
    [1,3,5,7,2,0,2,4,0,1,4,1,1,4,5,4,6,4,6,7,0,3,0,6,6,0,6,3,0,7,3,7,1,4,4,7,5,1,5,3,7,4,7,6,0,0,2,0,],
    [2,1,6,5,6,2,6,6,2,7,6,7,1,2,4,5,7,3,7,6,0,0,3,3,0,2,3,5,4,1,7,1,2,0,5,0,1,4,3,6,0,4,2,6,0,5,0,7,],
    [1,3,5,7,4,3,4,7,3,0,7,4,2,7,5,7,0,1,3,1,3,3,6,0,0,2,0,5,0,7,3,4,3,6,6,6,1,0,1,2,1,4,3,2,7,0,7,2,],
    [3,2,7,6,4,3,4,7,0,2,0,6,7,2,7,5,1,1,4,1,1,1,1,4,0,0,3,0,2,4,2,7,6,1,6,4,5,0,7,0,0,5,2,7,1,7,3,5,],
    [0,1,4,5,4,2,4,6,3,3,7,3,0,0,4,0,3,1,6,1,4,7,7,4,0,3,3,6,0,4,3,7,2,1,5,4,5,7,7,5,0,5,2,7,7,1,7,3,],
    [1,3,5,7,4,2,4,6,1,2,5,2,3,4,6,4,4,0,7,3,0,1,3,1,3,3,6,6,0,4,3,7,6,3,6,6,0,3,2,5,5,7,7,7,5,0,7,2,],
    [2,1,6,5,6,2,6,6,7,3,7,7,2,2,2,5,1,6,4,6,0,2,0,5,5,0,5,3,1,2,1,5,2,7,5,7,3,5,5,5,4,2,6,0,7,0,7,2,],
    [0,1,4,5,2,3,2,7,3,1,7,5,1,3,4,3,4,7,7,7,4,0,7,0,0,2,0,5,1,4,4,7,4,1,7,4,1,0,3,2,0,0,2,2,3,7,5,5,],
    [0,2,4,6,2,0,2,4,7,3,7,7,0,0,3,0,3,4,6,4,4,2,7,2,3,1,6,1,0,2,3,2,3,6,6,3,4,7,6,5,2,5,2,7,3,3,5,3,],
    [0,1,4,5,3,0,3,4,0,0,4,0,3,1,7,1,4,4,7,4,3,6,6,6,0,7,3,7,0,2,0,5,1,3,1,6,4,3,6,3,2,4,2,6,4,0,6,0,],
    [0,3,4,7,3,2,3,6,0,2,4,2,2,4,5,4,7,0,7,3,0,7,3,7,4,6,7,6,6,2,6,5,0,1,3,1,0,0,3,0,4,1,6,1,5,5,7,7,],
    [0,0,4,4,1,1,1,5,0,5,4,5,4,1,7,1,5,2,5,5,7,3,7,6,3,7,6,7,2,3,2,6,6,3,6,6,1,6,3,4,2,7,4,5,3,0,3,2,],
    [1,1,5,5,2,2,2,6,0,5,4,5,1,4,4,4,3,2,6,2,4,1,7,1,0,3,3,0,4,3,7,6,3,7,6,7,0,0,2,0,7,2,7,4,2,6,4,6,],
    [0,0,4,4,1,1,1,5,2,5,6,1,0,1,3,1,4,2,7,5,2,7,5,4,1,0,4,0,2,6,5,6,0,4,0,7,5,1,7,3,5,0,7,0,1,5,1,7,],
    [2,0,6,4,3,0,3,4,0,0,0,4,2,4,5,4,4,0,7,3,4,3,7,0,1,5,4,5,0,7,3,7,4,7,7,4,1,0,1,3,2,3,4,5,5,7,7,5,],
    [0,1,4,5,2,1,2,5,2,0,6,4,0,5,3,5,4,4,7,7,4,7,7,4,4,3,7,0,4,0,7,3,0,6,3,6,1,7,3,7,3,0,3,2,0,2,0,4,],
    [2,1,6,5,3,1,3,5,0,5,4,5,4,1,7,4,4,4,7,7,4,0,7,3,2,6,5,6,1,7,4,7,4,2,7,5,0,1,0,4,1,0,1,2,0,6,2,6,],
    [1,0,5,4,3,0,3,4,3,0,7,0,3,5,6,2,2,6,5,6,0,0,0,3,4,1,7,1,1,1,1,4,3,7,6,7,0,7,3,4,2,2,2,4,4,1,6,3,],
    [1,0,5,4,4,3,4,7,0,1,0,5,1,4,4,4,7,2,7,5,4,0,7,0,1,1,4,4,0,7,3,7,2,6,5,6,5,1,5,3,6,1,6,3,1,5,3,5,],
    [3,0,7,4,5,2,5,6,1,6,5,6,1,5,5,1,0,0,0,3,1,0,1,3,0,5,3,2,7,1,7,4,3,7,6,7,4,3,7,6,6,0,6,2,0,7,2,7,],
    [0,2,4,6,2,0,2,4,1,0,5,0,3,3,7,7,6,2,6,5,2,7,5,7,2,0,5,3,4,3,7,0,3,4,6,7,7,3,7,6,0,6,2,6,1,4,3,6,],
    [3,3,7,7,5,3,5,7,7,0,7,4,2,7,6,7,1,2,4,2,0,3,3,6,3,4,6,1,0,4,0,7,1,3,4,0,6,1,6,3,0,2,2,0,1,5,1,7,],
    [2,1,6,5,4,3,4,7,0,7,4,7,0,2,3,5,0,1,3,4,4,1,7,4,4,2,7,5,1,0,4,0,0,0,3,3,0,5,2,5,5,7,7,5,5,1,7,3,],
    [0,1,4,5,2,1,2,5,0,6,4,6,0,5,3,5,2,7,5,7,3,3,6,6,1,0,4,0,5,0,5,3,4,1,7,1,7,2,7,5,5,4,7,6,0,2,0,4,],
    [0,2,4,6,4,3,4,7,6,0,6,4,1,2,4,2,7,1,7,4,0,3,3,6,5,4,5,7,0,7,3,7,1,1,4,1,1,0,3,0,7,4,7,6,5,0,5,2,],
    [2,3,6,7,2,0,2,4,2,0,6,0,7,1,7,4,3,7,6,4,4,1,7,1,0,6,3,6,3,2,6,2,3,3,6,3,1,2,1,4,7,5,7,7,1,5,3,5,],
    [2,2,6,6,5,1,5,5,0,1,4,5,2,4,5,7,0,3,3,6,7,0,7,3,6,0,6,3,4,0,4,3,7,4,7,7,4,5,4,7,1,1,3,1,0,7,2,7,],
    [1,2,5,6,5,3,5,7,6,1,6,5,2,7,6,7,3,3,6,6,0,3,0,6,1,0,4,3,2,0,5,0,0,2,3,5,7,4,7,6,0,0,2,2,7,1,7,3,],
    [0,2,4,6,1,3,1,7,0,7,4,7,0,5,3,5,7,3,7,6,2,0,5,3,0,0,3,3,4,3,4,6,0,1,3,4,6,2,6,4,5,2,7,0,4,0,6,0,],
    [3,3,7,7,6,2,6,6,0,0,4,0,3,6,7,6,0,1,3,1,2,4,2,7,4,2,7,5,1,2,1,5,3,7,6,7,5,0,7,0,0,3,0,5,2,3,4,5,],
    [1,0,5,4,3,0,3,4,3,0,7,0,1,4,4,4,3,7,6,4,7,1,7,4,0,7,3,4,0,4,3,1,3,4,6,7,0,1,2,3,6,1,6,3,4,7,6,5,],
    [3,1,7,5,7,2,7,6,1,0,5,4,4,5,7,5,1,3,4,6,0,0,3,3,1,4,1,7,2,0,5,0,0,1,3,4,4,7,6,7,6,1,6,3,5,7,7,5,],
    [1,1,5,5,2,1,2,5,7,2,7,6,6,4,6,7,3,2,6,2,4,4,4,7,4,1,7,1,0,4,3,7,3,6,6,3,0,0,0,2,1,6,3,4,1,2,1,4,],
    [1,3,5,7,3,3,3,7,3,3,7,3,0,0,0,3,4,1,7,1,3,0,6,0,4,5,7,5,0,5,3,2,4,4,7,4,0,7,2,5,0,4,2,6,5,6,7,6,],
    [1,0,5,4,4,2,4,6,3,0,7,0,1,2,1,6,3,3,3,6,2,7,5,7,0,3,0,6,4,1,7,4,4,6,7,6,4,5,6,5,2,2,2,4,5,3,7,5,],
    [1,3,5,7,2,0,2,4,1,0,5,0,1,2,4,2,4,7,7,4,0,2,0,5,2,5,5,2,5,2,5,5,3,3,6,0,1,6,3,6,0,7,2,7,4,4,6,2,],
    [0,0,4,4,3,2,3,6,2,3,6,3,7,2,7,6,5,4,5,7,4,0,7,0,1,7,4,7,1,3,1,6,0,4,0,7,2,1,4,1,0,1,0,3,4,2,6,2,],
    [0,3,4,7,3,2,3,6,3,3,7,3,2,6,5,6,0,4,3,1,0,7,3,7,4,4,7,4,3,0,6,0,4,5,7,5,5,2,7,2,0,6,2,4,5,6,7,6,],
    [3,1,7,5,4,2,4,6,7,0,7,4,3,6,6,6,2,2,2,5,6,0,6,3,1,0,1,3,1,7,4,7,0,4,0,7,5,4,7,6,3,1,5,1,1,4,3,4,],
    [3,2,7,6,4,0,4,4,1,0,5,0,0,3,3,6,0,4,3,7,1,2,4,5,1,3,4,6,7,1,7,4,4,4,7,7,0,0,3,3,5,2,7,0,0,5,0,7,],
    [0,0,4,4,2,2,2,6,5,0,5,4,0,6,3,6,1,7,4,7,3,5,6,5,0,3,3,0,7,3,7,6,6,1,6,4,1,3,1,5,4,6,6,6,4,0,4,2,],
    [3,2,7,6,6,2,6,6,3,5,7,5,0,0,4,4,3,7,6,7,1,6,4,6,7,1,7,4,0,4,3,4,2,0,5,0,3,1,5,3,0,5,2,5,0,3,2,3,],
    [2,2,6,6,5,2,5,6,3,0,7,0,0,7,4,3,3,7,6,7,1,1,1,4,4,1,7,1,0,4,3,7,0,0,0,3,2,7,4,5,2,4,4,6,7,2,7,4,],
    [3,3,7,7,5,3,5,7,2,1,6,1,3,7,6,7,0,3,3,6,2,2,5,2,0,0,3,0,0,1,3,4,0,4,0,7,7,4,7,6,1,7,3,5,5,0,7,0,],
    [1,2,5,6,1,1,1,5,3,2,7,6,0,1,3,1,3,3,6,0,7,0,7,3,4,4,7,7,6,1,6,4,0,4,0,7,4,1,7,4,3,5,5,7,2,5,2,7,],
    [3,2,7,6,6,1,6,5,7,1,7,5,3,3,7,7,0,1,0,4,0,6,3,6,2,0,5,0,3,4,6,7,1,1,4,1,0,5,3,5,1,2,1,4,1,7,3,7,],
    [3,2,7,6,6,1,6,5,0,2,4,6,4,5,7,5,3,7,6,7,7,1,7,4,0,4,0,7,0,3,3,0,2,0,5,3,2,3,4,5,2,2,4,4,2,7,4,5,],
    [2,1,6,5,5,0,5,4,3,7,7,3,0,2,3,5,1,1,4,4,0,0,3,0,0,4,3,7,1,2,4,5,4,7,7,7,0,7,2,5,6,0,6,2,7,4,7,6,],
    [1,3,5,7,1,0,1,4,2,1,6,1,2,2,6,6,0,7,3,7,4,3,7,6,3,2,6,2,2,0,5,0,2,3,5,6,7,3,7,5,7,0,7,2,0,6,2,6,],
    [0,0,4,4,1,1,1,5,5,2,5,6,1,6,4,3,2,0,5,0,4,5,7,2,0,2,0,5,3,1,6,1,4,7,7,7,7,3,7,5,2,6,4,6,6,4,6,6,],
    [1,3,5,7,2,0,2,4,1,1,5,1,1,4,5,4,4,7,7,4,0,4,3,7,7,0,7,3,6,0,6,3,4,2,7,5,1,4,3,6,1,2,3,2,5,5,7,7,],
    [0,3,4,7,3,2,3,6,5,3,5,7,1,3,4,0,3,0,6,3,7,3,7,6,2,3,2,6,0,4,0,7,6,4,6,7,0,0,0,2,4,3,4,5,7,0,7,2,],
    [3,1,7,5,5,1,5,5,2,3,6,3,3,5,6,5,2,7,5,7,0,7,3,4,7,0,7,3,1,0,4,0,0,0,0,3,2,2,5,5,0,4,2,6,6,0,6,2,],
    [0,0,4,4,3,3,3,7,0,7,4,7,2,5,5,5,4,3,7,3,7,4,7,7,2,1,5,1,6,4,6,7,0,1,0,4,4,0,6,0,1,2,1,4,0,6,2,6,],
    [0,0,4,4,4,1,4,5,0,2,0,6,4,6,7,6,1,4,4,7,0,7,3,7,7,2,7,5,6,2,6,5,1,0,4,0,5,0,7,0,5,1,7,1,5,2,5,4,],
    [3,0,7,4,6,3,6,7,1,3,5,3,2,6,5,6,0,1,0,4,4,0,7,0,2,1,5,4,1,1,1,4,0,7,3,7,4,2,7,2,3,5,5,5,0,0,2,0,],
    [0,2,4,6,2,0,2,4,2,0,6,0,0,3,4,7,3,3,6,6,3,4,6,7,4,3,7,0,7,4,7,7,0,4,3,7,0,5,2,7,3,1,5,3,7,1,7,3,],
    [0,1,4,5,3,0,3,4,2,1,6,1,2,4,6,4,4,2,7,2,0,4,0,7,1,5,4,5,4,7,7,4,4,3,7,3,5,7,7,7,5,0,7,0,3,7,5,5,],
    [0,2,4,6,0,1,0,5,1,0,5,0,4,1,7,4,4,4,7,1,1,2,4,5,4,7,7,7,4,3,7,6,3,3,6,0,1,4,1,6,2,5,2,7,1,1,3,1,],
    [1,0,5,4,3,0,3,4,1,3,1,7,6,4,6,7,2,5,5,5,4,4,7,1,4,0,7,0,2,2,5,2,0,1,3,4,2,6,5,6,7,5,7,7,4,1,6,1,],
    [0,2,4,6,1,3,1,7,3,0,3,4,4,7,7,7,4,4,7,1,4,3,7,0,4,5,7,5,0,3,0,6,2,0,2,3,7,2,7,4,4,2,6,0,1,0,1,2,],
    [3,2,7,6,5,2,5,6,2,4,6,4,3,6,6,6,1,2,1,5,3,0,6,0,0,2,0,5,7,0,7,3,0,0,3,3,5,7,7,7,2,1,4,1,0,6,2,6,],
    [2,2,6,6,4,2,4,6,3,4,7,4,4,1,7,1,2,0,5,0,1,3,1,6,0,2,0,5,0,1,3,1,0,7,3,7,5,3,7,3,7,5,7,7,2,4,2,6,],
    [0,3,4,7,0,0,0,4,1,1,5,1,1,6,4,3,3,3,6,6,3,2,6,2,0,4,3,7,2,4,5,7,0,4,0,7,7,0,7,3,5,7,7,7,4,5,6,3,],
    [0,3,4,7,0,0,0,4,1,2,5,6,1,7,5,3,3,2,6,5,2,4,5,1,4,1,7,4,2,0,5,0,7,0,7,3,1,5,1,7,5,7,7,7,4,6,6,4,],
    [3,1,7,5,5,3,5,7,4,3,4,7,0,1,0,4,1,4,1,7,2,3,2,6,6,0,6,3,3,3,3,6,7,1,7,4,1,0,3,0,1,1,1,3,3,2,5,0,],
    [1,3,5,7,3,1,3,5,3,1,7,1,1,4,1,7,0,1,0,4,6,3,6,6,3,0,6,0,4,2,7,2,2,7,5,4,7,3,7,6,2,0,2,2,0,5,0,7,],
    [3,0,7,4,5,0,5,4,2,2,6,2,2,4,6,4,2,3,5,6,0,3,3,6,3,7,6,7,0,1,3,1,7,0,7,3,3,3,3,5,0,4,2,6,0,5,2,7,],
    [1,2,5,6,2,0,2,4,3,2,7,2,1,4,4,4,6,4,6,7,0,0,3,3,0,4,3,7,4,3,7,3,4,1,7,1,5,7,7,5,0,5,0,7,3,0,5,0,],
    [1,3,5,7,3,3,3,7,3,3,7,3,4,0,7,0,4,1,7,4,0,3,0,6,6,2,6,5,0,7,3,4,2,0,2,3,4,6,7,6,5,1,7,1,5,5,7,7,],
    [1,1,5,5,4,0,4,4,3,1,7,1,3,4,7,4,0,0,3,0,2,4,2,7,1,3,1,6,3,7,6,7,0,2,0,5,4,6,6,6,5,0,7,0,6,3,6,5,],
    [1,3,5,7,4,3,4,7,1,0,5,0,2,7,5,7,5,2,5,5,0,2,0,5,7,2,7,5,3,1,3,4,6,4,6,7,5,1,7,1,0,7,2,5,5,6,7,6,],
    [1,0,5,4,2,0,2,4,3,1,7,1,3,5,6,5,1,1,1,4,1,6,4,6,7,4,7,7,3,0,6,0,4,2,7,2,2,7,5,7,0,5,2,5,0,0,0,2,],
    [2,2,6,6,5,2,5,6,3,7,7,7,3,6,6,6,0,7,3,4,6,2,6,5,3,0,6,0,7,1,7,4,0,5,3,2,0,0,2,0,0,1,2,1,4,1,4,3,],
    [1,3,5,7,2,0,2,4,1,1,5,1,1,2,4,2,6,0,6,3,1,4,4,7,3,4,3,7,0,3,0,6,4,3,7,0,7,2,7,5,5,4,7,6,5,5,7,7,],
    [2,1,6,5,5,0,5,4,3,7,7,3,7,4,7,7,2,2,2,5,0,6,3,6,1,0,1,3,6,0,6,3,0,1,0,4,3,4,6,7,2,0,4,2,3,5,5,3,],
    [2,3,6,7,4,3,4,7,1,1,5,1,3,2,7,2,0,3,0,6,6,3,6,6,1,0,4,0,7,3,7,6,2,4,2,7,5,0,7,0,1,3,1,5,5,3,5,5,],
    [0,0,4,4,3,0,3,4,3,1,7,1,1,4,4,4,1,7,4,7,5,4,5,7,2,0,2,3,0,6,3,6,7,2,7,5,4,2,6,4,5,0,7,0,1,5,3,5,],
    [3,3,7,7,6,2,6,6,1,0,1,4,4,6,7,6,2,1,5,4,7,1,7,4,2,3,2,6,0,1,0,4,0,7,3,7,5,0,7,0,5,7,7,5,2,2,4,0,],
    [2,1,6,5,5,1,5,5,2,3,6,7,0,2,4,6,7,1,7,4,0,3,3,6,1,1,4,4,4,0,7,0,6,1,6,4,0,4,3,7,5,7,7,5,0,5,2,7,],
    [3,2,7,6,4,3,4,7,2,6,6,6,4,2,7,5,0,1,0,4,3,0,6,0,0,5,3,5,2,0,2,3,6,0,6,3,1,2,1,4,1,7,3,7,5,7,7,7,],
    [2,3,6,7,5,2,5,6,7,0,7,4,1,3,4,6,4,0,4,3,1,0,4,0,0,0,3,3,6,3,6,6,0,1,0,4,0,5,2,7,3,7,5,7,2,5,2,7,],
    [0,2,4,6,3,1,3,5,3,0,7,4,2,3,5,3,6,4,6,7,0,3,3,6,4,0,7,0,4,0,7,3,2,7,5,7,0,4,2,6,0,0,2,0,0,1,2,1,],
    [1,2,5,6,2,3,2,7,0,6,4,6,1,5,4,5,4,1,7,1,4,2,7,5,1,0,4,3,1,3,4,0,0,1,0,4,5,4,7,6,3,7,5,7,5,5,7,7,],
    [3,3,7,7,5,3,5,7,2,5,6,5,3,7,6,7,3,4,6,1,0,1,3,1,3,0,6,0,7,0,7,3,0,2,3,2,6,2,6,4,0,0,2,0,0,5,2,7,],
    [0,1,4,5,4,2,4,6,5,1,5,5,1,7,4,7,2,0,5,0,7,3,7,6,6,1,6,4,1,0,4,3,0,4,3,1,0,7,2,5,6,5,6,7,0,2,2,4,],
    [1,3,5,7,2,1,2,5,6,2,6,6,7,1,7,4,3,0,6,0,2,2,5,5,3,4,6,1,3,1,6,1,0,1,0,4,2,7,4,7,1,0,3,0,1,1,1,3,],
    [3,0,7,4,6,3,6,7,2,6,6,6,4,3,7,3,0,3,3,3,0,0,3,3,0,7,3,4,1,7,4,7,2,0,5,3,5,7,7,7,7,4,7,6,5,0,7,2,],
    [2,2,6,6,6,3,6,7,3,0,7,0,4,7,7,7,0,0,0,3,4,2,7,2,0,4,3,7,1,0,4,3,2,7,5,4,3,1,6,1,2,4,4,6,7,3,7,5,],
    [1,3,5,7,3,3,3,7,3,3,7,3,0,5,3,2,2,1,5,1,6,4,6,7,0,2,0,5,2,0,5,0,7,4,7,7,0,0,0,2,4,2,6,2,0,6,2,6,],
    [3,0,7,4,5,0,5,4,2,2,6,2,3,4,6,4,4,7,7,7,0,5,3,5,3,6,6,6,0,7,3,7,1,3,4,3,0,0,0,3,0,4,2,4,5,5,7,5,],
    [3,1,7,5,6,0,6,4,2,1,2,5,4,4,7,4,0,4,3,7,3,4,6,7,4,3,7,6,1,6,4,6,1,0,1,3,0,2,2,0,5,1,7,3,4,1,6,3,],
    [3,2,7,6,3,1,3,5,4,0,4,4,5,1,5,5,0,3,3,6,6,0,6,3,1,7,4,7,2,1,2,4,0,0,3,0,7,1,7,3,4,5,6,3,5,7,7,5,],
    [2,3,6,7,5,2,5,6,2,2,6,2,2,6,6,6,1,4,1,7,3,1,6,1,0,2,0,5,0,6,3,3,4,0,7,0,7,2,7,5,1,1,1,3,6,3,6,5,],
    [2,3,6,7,5,3,5,7,3,6,7,6,0,4,4,0,6,0,6,3,2,3,2,6,7,1,7,4,1,1,1,4,0,0,0,3,4,1,4,3,1,0,3,2,0,5,2,7,],
    [1,2,5,6,2,3,2,7,0,0,4,4,1,5,4,5,3,7,6,7,0,4,0,7,4,1,7,1,4,2,7,2,4,3,7,3,5,4,7,6,4,0,6,0,3,7,5,5,],
    [2,3,6,7,5,2,5,6,2,2,6,2,4,4,7,4,0,2,3,5,0,6,3,3,4,3,7,0,0,3,3,0,2,6,5,6,5,7,7,5,0,0,2,0,0,7,2,5,],
    [3,2,7,6,5,0,5,4,7,0,7,4,1,1,5,1,2,3,2,6,6,1,6,4,0,0,3,0,0,2,3,2,0,4,0,7,4,7,7,7,3,7,5,5,1,4,1,6,],
    [0,3,4,7,2,1,2,5,1,1,5,1,3,3,6,3,7,2,7,5,1,7,4,4,3,7,6,4,0,3,0,6,1,0,1,3,3,4,5,6,4,2,6,2,5,4,7,6,],
    [0,0,4,4,3,3,3,7,1,6,5,6,4,3,7,3,7,4,7,7,0,4,0,7,4,0,7,0,0,3,3,0,6,4,6,7,4,1,6,1,2,0,4,2,1,0,3,2,],
    [1,1,5,5,1,0,1,4,3,2,7,6,2,0,5,3,4,7,7,4,0,6,3,6,4,0,7,0,6,1,6,4,0,7,3,7,2,4,5,7,0,0,0,2,2,3,4,5,],
    [0,3,4,7,3,3,3,7,1,6,5,6,2,0,6,4,7,4,7,7,1,0,4,3,3,0,6,3,4,0,7,3,0,4,0,7,0,2,2,2,5,0,7,0,4,4,6,6,],
    [0,3,4,7,1,0,1,4,2,1,6,5,0,4,3,4,2,0,5,3,2,2,5,5,7,1,7,4,6,0,6,3,0,7,3,7,5,2,7,0,0,5,2,3,4,6,6,6,],
    [1,3,5,7,3,1,3,5,0,1,4,1,3,2,7,2,0,0,3,0,4,3,7,6,4,0,7,0,1,7,4,7,0,4,0,7,0,2,3,2,0,3,2,5,1,6,3,6,],
    [2,2,6,6,2,1,2,5,3,0,7,0,1,1,4,1,4,7,7,7,4,5,7,2,0,2,0,5,7,2,7,5,0,6,3,6,3,4,5,2,1,3,1,5,4,2,6,4,],
    [2,1,6,5,2,0,2,4,1,0,1,4,2,1,5,1,1,6,4,6,0,1,0,4,4,4,7,7,7,0,7,3,4,2,7,5,3,7,5,7,6,1,6,3,1,7,3,5,],
    [3,1,7,5,3,0,3,4,1,3,1,7,4,0,7,3,2,4,2,7,3,6,6,3,0,0,0,3,4,3,7,0,3,7,6,7,4,6,7,6,2,0,2,2,1,2,3,4,],
    [2,2,6,6,6,3,6,7,0,3,4,7,0,1,4,5,3,0,6,0,0,7,3,7,2,4,5,7,4,3,7,0,7,2,7,5,0,3,0,6,2,1,4,1,5,1,5,3,],
    [2,1,6,5,5,0,5,4,3,1,7,1,4,2,7,2,2,4,5,7,4,4,7,7,0,4,3,1,7,3,7,6,1,4,4,7,4,5,6,7,0,7,2,7,1,0,1,2,],
    [1,3,5,7,4,3,4,7,3,1,7,5,2,7,5,7,0,7,3,4,2,3,5,0,0,0,0,3,7,1,7,4,0,4,3,7,5,6,7,6,1,0,1,2,2,0,4,0,],
    [1,2,5,6,2,0,2,4,5,1,5,5,1,4,4,4,6,3,6,6,0,3,0,6,7,4,7,7,1,6,4,6,3,0,6,0,1,7,4,7,4,2,6,2,3,1,3,3,],
    [2,0,6,4,5,2,5,6,2,3,6,3,0,3,3,0,0,6,3,6,3,7,6,7,0,4,3,4,4,1,7,1,0,5,3,5,4,0,6,2,4,4,4,6,0,1,2,1,],
    [2,1,6,5,6,2,6,6,0,0,4,0,1,7,4,4,5,2,5,5,0,0,0,3,1,2,1,5,3,3,6,0,2,2,2,5,4,7,7,7,7,0,7,2,3,6,5,6,],
    [1,3,5,7,2,0,2,4,3,6,7,2,2,3,5,3,0,1,0,4,6,4,6,7,1,7,4,7,4,1,7,1,7,3,7,6,5,0,7,0,0,7,2,5,0,5,2,3,],
    [1,2,5,6,3,0,3,4,0,6,4,6,3,1,7,1,4,3,7,6,0,7,3,7,4,4,7,7,0,2,3,5,4,2,7,5,0,1,2,1,5,0,7,2,0,3,2,5,],
    [2,0,6,4,4,0,4,4,1,2,5,6,0,6,4,6,2,7,5,7,0,0,3,3,6,0,6,3,0,1,0,4,7,0,7,3,2,4,4,6,0,0,2,0,7,4,7,6,],
    [2,1,6,5,4,3,4,7,0,7,4,7,2,4,6,0,0,4,3,1,0,1,3,4,3,0,6,0,0,3,3,6,7,1,7,4,0,6,2,6,5,2,7,0,5,5,7,7,],
    [0,0,4,4,3,3,3,7,2,6,6,6,2,5,5,5,4,2,7,2,6,0,6,3,1,4,1,7,2,0,2,3,0,1,0,4,0,5,0,7,3,2,5,0,4,7,6,7,],
    [2,2,6,6,4,0,4,4,1,0,5,0,3,4,6,4,0,2,0,5,7,1,7,4,1,4,1,7,2,3,2,6,4,7,7,7,2,7,4,5,1,1,1,3,5,2,7,0,],
    [0,0,4,4,3,3,3,7,7,0,7,4,0,4,3,4,5,1,5,4,6,1,6,4,0,3,3,0,2,3,5,0,4,7,7,7,0,6,2,6,5,5,7,5,2,0,4,2,],
    [3,0,7,4,4,1,4,5,1,5,5,5,0,1,3,1,4,0,7,3,0,7,3,7,3,6,6,6,0,5,3,2,4,7,7,7,5,0,7,0,0,2,0,4,5,3,7,5,],
    [1,2,5,6,2,0,2,4,1,0,5,0,3,5,6,2,3,7,6,7,3,3,6,0,1,4,1,7,4,1,7,4,7,0,7,3,0,0,0,3,4,3,6,5,5,5,7,7,],
    [0,2,4,6,0,1,0,5,6,3,6,7,0,7,3,4,4,0,7,3,0,0,3,0,2,3,5,3,1,2,4,2,4,3,7,0,3,6,5,4,5,5,5,7,1,5,3,7,],
    [2,0,6,4,5,0,5,4,1,3,5,7,4,0,7,0,3,3,6,6,7,3,7,6,1,2,4,5,6,0,6,3,1,0,4,3,2,5,2,7,0,3,0,5,4,7,6,5,],
    [0,1,4,5,4,2,4,6,6,2,6,6,7,3,7,7,0,7,3,7,0,2,3,5,0,3,3,6,2,0,5,0,0,0,3,3,5,2,5,5,5,1,7,1,4,7,6,7,],
    [2,3,6,7,3,0,3,4,1,7,5,7,2,0,5,0,4,4,7,7,0,0,0,3,6,1,6,4,1,0,1,3,0,7,3,4,4,3,6,5,2,2,4,2,7,4,7,6,],
    [0,2,4,6,3,1,3,5,3,0,7,0,2,5,5,5,7,2,7,5,2,3,5,3,4,1,7,1,0,6,3,6,3,7,6,7,3,2,6,2,0,7,2,7,0,0,2,2,],
    [0,1,4,5,3,0,3,4,1,1,5,1,2,2,5,2,4,7,7,4,4,3,7,3,0,5,3,5,1,6,4,6,4,4,7,7,6,0,6,2,0,7,2,7,0,4,2,4,],
    [3,3,7,7,6,2,6,6,0,2,0,6,3,6,7,6,5,1,5,4,1,4,4,1,0,7,3,4,2,7,5,7,0,1,3,1,7,3,7,5,4,0,6,0,1,7,3,5,],
    [0,3,4,7,1,0,1,4,1,1,5,1,0,0,3,0,2,2,5,2,4,3,7,6,2,3,5,6,1,7,4,4,3,7,6,4,7,1,7,3,0,4,0,6,5,7,7,7,],
    [1,3,5,7,2,0,2,4,1,0,5,0,3,4,6,7,3,3,6,3,7,3,7,6,0,4,0,7,3,2,6,5,1,4,4,7,1,5,3,7,0,0,0,2,4,4,6,6,],
    [0,0,4,4,1,1,1,5,3,6,7,6,0,1,4,1,3,5,6,5,1,6,4,3,7,1,7,4,2,7,5,7,5,1,5,4,0,2,2,4,1,0,3,0,5,0,7,0,],
    [2,1,6,5,5,0,5,4,2,0,6,0,4,4,7,4,3,6,6,6,0,6,3,3,1,0,1,3,0,5,3,5,4,7,7,7,0,1,0,3,1,7,3,7,5,2,7,0,],
    [3,0,7,4,4,1,4,5,1,5,5,5,2,7,5,7,4,0,7,0,0,4,3,1,2,6,5,6,0,5,3,2,6,4,6,7,0,2,2,0,3,2,5,4,5,1,5,3,],
    [1,2,5,6,2,0,2,4,1,0,5,0,0,4,3,7,6,2,6,5,0,3,3,6,2,1,5,4,7,0,7,3,7,4,7,7,1,7,3,5,5,0,5,2,4,4,6,6,],
    [0,1,4,5,3,0,3,4,3,1,7,1,0,3,3,6,0,4,0,7,4,7,7,4,2,6,5,3,4,0,7,0,3,7,6,4,7,5,7,7,0,2,2,0,5,4,7,2,],
    [3,0,7,4,4,1,4,5,0,4,4,4,2,1,5,1,0,0,3,3,4,6,7,6,4,0,7,0,0,5,3,5,0,7,3,7,5,5,7,3,1,6,3,6,0,1,2,3,],
    [1,0,5,4,3,0,3,4,3,1,7,1,1,4,4,7,4,2,7,5,0,4,0,7,4,4,7,7,0,0,0,3,1,3,4,6,1,5,3,7,7,2,7,4,4,5,6,7,],
    [2,0,6,4,5,3,5,7,2,7,6,7,0,2,0,5,1,3,1,6,1,7,4,4,4,1,7,4,0,1,3,4,4,0,7,0,2,7,4,5,0,0,2,2,7,5,7,7,],
    [0,1,4,5,1,2,1,6,7,0,7,4,0,4,3,4,3,0,6,3,3,7,6,7,3,3,6,0,2,1,5,4,4,4,7,7,2,2,4,0,0,0,2,0,2,5,2,7,],
    [1,3,5,7,3,3,3,7,3,4,7,4,1,7,4,7,3,2,6,2,4,3,7,0,0,3,3,0,5,0,5,3,0,4,0,7,2,2,4,0,4,5,6,7,5,5,7,7,],
    [2,2,6,6,4,2,4,6,0,0,4,0,3,1,6,1,7,2,7,5,2,7,5,7,1,4,1,7,3,5,6,2,0,4,0,7,5,0,7,0,1,2,3,4,5,4,7,6,],
    [0,1,4,5,3,0,3,4,0,2,4,6,3,1,7,1,7,4,7,7,0,7,3,7,0,4,3,7,5,2,5,5,4,0,7,0,6,1,6,4,4,2,4,4,4,7,6,5,],
    [3,3,7,7,4,0,4,4,2,1,6,1,3,4,7,4,1,5,4,5,1,1,1,4,0,0,0,3,2,7,5,7,3,0,6,3,7,0,7,3,3,6,5,6,2,2,2,4,],
    [3,3,7,7,5,1,5,5,0,3,4,7,3,1,6,1,3,4,6,7,6,3,6,6,2,4,5,7,7,0,7,3,0,4,0,7,0,0,2,0,0,2,2,0,1,5,3,7,],
    [0,3,4,7,2,3,2,7,1,6,5,2,0,7,3,7,3,1,6,1,1,0,1,3,4,7,7,4,5,2,5,5,2,0,5,0,6,2,6,4,2,2,4,4,3,5,5,7,],
    [0,0,4,4,2,2,2,6,2,6,6,6,2,5,6,5,1,3,1,6,4,1,7,4,2,1,5,4,2,0,5,3,2,7,5,7,3,0,5,0,7,0,7,2,5,1,7,3,],
    [1,2,5,6,4,2,4,6,2,7,6,3,3,2,6,2,0,2,0,5,6,4,6,7,7,4,7,7,1,4,1,7,7,0,7,3,0,0,3,3,4,0,6,0,2,6,4,4,],
    [2,1,6,5,3,2,3,6,1,5,5,5,3,0,7,4,0,4,3,1,4,7,7,7,4,0,7,3,4,6,7,6,4,2,7,5,0,2,2,4,1,7,3,7,5,0,7,2,],
    [3,2,7,6,5,0,5,4,0,0,4,4,3,0,6,0,0,3,0,6,2,3,2,6,2,7,5,7,3,4,6,7,7,2,7,5,1,4,1,7,2,1,4,1,4,6,6,4,],
    [1,3,5,7,3,3,3,7,3,3,7,3,1,2,4,2,4,5,7,2,0,2,0,5,4,1,7,1,0,1,3,1,0,0,3,0,0,7,2,5,4,7,6,5,5,0,7,0,],
    [0,3,4,7,1,0,1,4,4,0,4,4,0,2,3,2,6,0,6,3,2,3,5,6,0,6,3,3,7,1,7,4,3,7,6,4,5,1,5,3,1,7,3,5,0,5,2,7,],
    [2,1,6,5,3,2,3,6,1,5,5,5,2,4,5,4,7,2,7,5,3,7,6,7,3,3,6,0,6,1,6,4,2,0,5,0,1,0,1,3,4,6,6,6,0,4,0,6,],
    [3,2,7,6,3,1,3,5,6,0,6,4,2,2,5,5,0,1,0,4,7,3,7,6,1,4,4,7,1,0,1,3,5,0,5,3,0,5,0,7,4,5,6,7,2,0,4,0,],
    [0,1,4,5,0,0,0,4,6,3,6,7,0,1,3,1,3,4,6,1,3,0,3,3,4,4,7,1,2,6,5,6,1,3,1,6,4,7,6,7,4,0,4,2,2,7,4,7,],
    [0,1,4,5,1,2,1,6,2,6,6,2,2,0,6,0,3,2,6,5,0,4,3,1,1,7,4,7,7,3,7,6,3,3,6,6,2,6,5,6,6,3,6,5,5,7,7,7,],
    [0,3,4,7,3,3,3,7,3,4,7,4,2,0,2,4,4,3,7,3,2,6,5,6,0,4,0,7,3,1,6,1,3,0,6,0,4,5,6,5,3,2,5,2,5,7,7,5,],
    [3,3,7,7,6,3,6,7,2,1,2,5,4,3,7,3,1,3,1,6,4,0,7,0,3,6,6,3,3,2,6,2,0,1,0,4,1,7,4,7,1,0,3,0,3,1,5,1,],
    [1,2,5,6,5,3,5,7,0,7,4,7,6,0,6,4,0,5,3,5,0,1,3,1,4,0,4,3,7,0,7,3,0,6,3,6,1,4,3,6,0,2,2,4,7,4,7,6,],
    [1,0,5,4,4,3,4,7,3,6,7,6,2,0,5,3,4,1,7,1,0,2,0,5,1,3,1,6,6,2,6,5,0,0,3,3,2,3,2,6,5,7,7,7,7,3,7,5,],
    [1,0,5,4,3,0,3,4,3,0,7,0,1,4,4,4,0,6,3,6,6,4,6,7,7,2,7,5,0,7,3,7,1,5,4,5,4,1,6,1,0,2,2,0,4,2,6,2,],
    [0,2,4,6,1,3,1,7,2,5,6,1,7,0,7,3,7,4,7,7,3,0,6,0,3,3,6,6,2,1,5,4,2,0,5,3,0,4,0,7,4,5,6,7,1,0,1,2,],
    [3,3,7,7,4,0,4,4,3,1,7,1,3,4,6,4,3,7,6,7,0,0,3,0,2,6,5,3,0,3,3,6,0,2,3,2,7,1,7,3,1,5,1,7,7,4,7,6,],
    [2,2,6,6,5,2,5,6,2,7,6,3,1,0,4,3,0,1,3,4,7,1,7,4,0,2,3,5,0,4,3,7,4,7,7,7,0,5,0,7,4,0,4,2,0,3,2,5,],
    [2,3,6,7,4,3,4,7,3,5,7,5,2,7,5,7,4,0,7,3,1,3,1,6,1,2,4,2,3,0,6,0,0,3,0,6,1,1,3,3,0,0,0,2,7,0,7,2,],
    [2,0,6,4,5,2,5,6,2,3,6,3,1,0,1,4,0,4,3,7,7,0,7,3,3,6,6,6,0,7,3,7,0,0,0,3,4,0,6,2,5,7,7,7,0,5,2,5,],
    [0,3,4,7,3,3,3,7,1,0,5,4,4,1,7,1,2,0,5,3,6,4,6,7,7,3,7,6,2,0,5,0,0,4,0,7,0,2,2,2,2,4,4,6,4,1,6,3,],
    [1,3,5,7,4,2,4,6,2,3,6,3,3,6,6,6,4,0,7,3,2,3,5,0,0,1,3,1,1,7,4,7,7,4,7,7,0,6,2,6,0,3,2,5,1,0,3,0,],
    [3,1,7,5,5,3,5,7,1,7,5,7,1,3,4,6,1,1,4,4,3,4,6,1,7,1,7,4,0,3,3,6,1,0,4,0,1,0,3,2,0,4,0,6,0,1,2,3,],
    [1,2,5,6,4,1,4,5,3,2,7,2,3,3,6,3,1,7,4,7,0,3,3,6,4,6,7,3,4,0,7,0,0,0,3,0,5,7,7,5,0,1,2,1,5,1,7,1,],
    [3,3,7,7,4,0,4,4,3,1,7,1,3,4,7,4,2,0,2,3,1,4,1,7,0,3,0,6,2,7,5,7,0,7,3,4,3,4,5,6,5,2,7,2,1,0,1,2,],
    [0,0,4,4,3,0,3,4,6,1,6,5,1,5,4,5,0,4,0,7,1,7,4,7,0,2,3,5,7,3,7,6,3,6,6,6,4,1,4,3,5,0,5,2,7,0,7,2,],
    [0,0,4,4,2,2,2,6,1,0,1,4,6,1,6,4,1,7,4,7,5,4,5,7,7,2,7,5,0,3,3,0,2,0,5,3,4,1,4,3,3,5,5,7,1,4,1,6,],
    [0,0,4,4,3,3,3,7,3,6,7,6,2,5,5,5,7,0,7,3,0,3,3,0,3,2,6,5,2,0,5,3,0,4,0,7,6,1,6,3,4,0,6,0,0,2,2,4,],
    [1,0,5,4,5,1,5,5,1,4,5,4,4,5,7,5,0,3,0,6,7,1,7,4,0,6,3,6,1,3,4,0,3,7,6,7,6,2,6,5,0,7,2,7,5,6,7,6,],
    [2,2,6,6,5,1,5,5,2,1,6,1,4,3,7,3,0,4,3,7,1,0,1,3,2,3,5,6,1,0,4,0,0,0,0,3,0,7,2,7,3,5,5,7,2,5,4,7,],
    [0,1,4,5,3,1,3,5,2,4,6,4,1,5,4,5,1,6,4,6,2,7,5,7,2,0,2,3,7,0,7,3,5,0,5,3,0,4,2,4,5,5,7,7,7,4,7,6,],
    [1,0,5,4,2,1,2,5,2,0,6,4,1,4,4,7,7,4,7,7,3,5,6,5,0,2,0,5,3,0,6,0,0,7,3,7,6,1,6,3,1,3,3,3,4,1,6,1,],
    [3,2,7,6,4,3,4,7,1,0,5,0,1,4,4,4,3,3,6,0,0,4,3,7,0,7,3,4,6,1,6,4,7,2,7,5,5,5,5,7,0,0,2,2,2,1,4,1,],
    [3,0,7,4,4,1,4,5,1,5,5,5,3,3,6,3,4,6,7,6,4,7,7,7,0,7,3,7,0,2,3,2,0,1,3,1,1,4,3,2,6,0,6,2,1,6,3,6,],
    [0,3,4,7,0,0,0,4,5,3,5,7,0,1,4,1,1,0,4,0,0,6,3,3,4,2,4,5,6,0,6,3,0,7,3,7,7,4,7,6,1,2,3,4,5,2,7,2,],
    [2,0,6,4,4,0,4,4,3,2,7,2,1,2,5,6,1,6,4,6,0,4,3,7,0,2,3,5,7,3,7,6,0,0,3,3,0,5,0,7,6,5,6,7,0,3,2,5,],
    [0,0,4,4,1,0,1,4,2,0,6,4,0,4,3,4,3,2,6,5,1,5,4,5,2,7,5,7,7,3,7,6,3,0,6,0,4,1,6,3,0,1,0,3,7,0,7,2,],
    [1,2,5,6,3,0,3,4,0,0,4,0,1,3,4,6,0,3,3,6,4,1,4,4,6,4,6,7,7,0,7,3,0,7,3,7,0,4,0,6,0,1,2,1,6,1,6,3,],
    [2,3,6,7,2,0,2,4,0,1,4,1,1,2,4,2,6,2,6,5,7,1,7,4,1,3,1,6,3,7,6,7,2,6,5,3,4,3,7,0,0,4,0,6,0,7,2,7,],
    [2,0,6,4,5,3,5,7,0,0,4,4,0,1,0,4,3,4,6,1,2,4,2,7,7,2,7,5,1,4,4,1,0,6,3,6,1,2,3,0,6,1,6,3,4,5,4,7,],
    [3,1,7,5,4,2,4,6,1,4,5,4,1,7,4,7,0,3,0,6,7,1,7,4,4,3,7,0,3,2,3,5,2,0,2,3,1,0,1,2,0,7,2,5,5,6,7,6,],
    [2,2,6,6,3,3,3,7,3,1,7,1,2,5,5,5,1,0,4,0,7,3,7,6,2,1,5,4,4,7,7,7,0,4,0,7,4,2,7,2,1,2,1,4,5,0,7,0,],
    [1,3,5,7,2,0,2,4,2,1,6,1,1,0,4,0,5,2,5,5,1,2,4,2,6,3,6,6,0,7,3,4,7,2,7,5,1,7,3,7,0,2,0,4,4,3,4,5,],
    [1,3,5,7,4,2,4,6,2,3,6,3,3,4,6,4,0,0,3,0,0,2,0,5,0,6,3,6,4,0,7,3,1,1,4,1,2,7,4,7,5,4,5,6,5,5,7,5,],
    [0,1,4,5,0,0,0,4,5,3,5,7,3,2,6,2,1,1,4,4,4,3,7,0,4,3,7,6,1,4,1,7,1,3,4,6,2,5,4,7,2,0,4,0,7,1,7,3,],
    [2,2,6,6,2,1,2,5,2,0,6,4,0,5,3,5,4,1,7,1,4,7,7,7,4,7,7,4,1,0,1,3,1,6,4,6,4,0,6,2,3,2,5,4,7,2,7,4,],
    [2,0,6,4,5,3,5,7,1,6,5,6,4,7,7,7,0,2,3,5,1,0,4,3,4,0,7,3,3,0,6,3,1,4,1,7,0,4,0,7,1,2,3,4,7,4,7,6,],
    [1,3,5,7,2,0,2,4,2,1,6,1,1,0,4,0,3,3,6,6,1,7,4,7,0,0,0,3,0,4,0,7,4,5,7,2,5,6,7,4,3,2,5,2,1,4,1,6,],
    [1,3,5,7,3,3,3,7,7,1,7,5,1,7,4,7,0,5,3,2,6,2,6,5,0,0,0,3,5,2,5,5,1,1,4,1,3,4,6,7,4,2,6,0,0,6,2,6,],
    [0,3,4,7,1,0,1,4,1,1,5,1,0,0,3,0,5,4,5,7,6,2,6,5,4,0,7,0,0,7,3,7,2,6,5,3,2,2,2,4,7,0,7,2,3,2,3,4,],
    [3,0,7,4,4,0,4,4,0,3,4,3,2,0,5,3,4,6,7,3,2,7,5,7,1,4,1,7,6,0,6,3,0,2,3,2,3,4,5,4,2,6,4,6,7,5,7,7,],
    [3,1,7,5,4,2,4,6,2,5,6,5,7,1,7,4,0,4,3,4,4,0,7,0,0,0,3,3,2,7,5,7,0,6,3,6,6,1,6,3,0,1,0,3,3,0,5,2,],
    [0,0,4,4,3,3,3,7,2,6,6,6,3,1,6,4,0,2,0,5,3,0,6,3,2,1,5,4,4,0,7,3,1,3,1,6,4,5,6,7,7,4,7,6,0,1,2,3,],
    [0,2,4,6,3,1,3,5,2,2,6,2,2,5,6,5,2,7,5,7,4,0,7,0,1,7,4,4,0,3,3,0,4,3,7,3,5,6,7,6,4,1,6,1,0,5,2,3,],
    [1,3,5,7,2,0,2,4,1,0,5,0,0,4,0,7,1,6,4,3,4,4,7,7,2,7,5,4,7,0,7,3,1,4,4,1,7,4,7,6,5,3,7,3,1,5,3,7,],
    [3,0,7,4,4,1,4,5,0,1,0,5,3,5,6,5,4,0,7,3,3,7,6,7,1,0,1,3,4,6,7,6,3,1,3,4,0,7,2,7,1,4,1,6,2,3,2,5,],
    [0,2,4,6,2,2,2,6,1,2,5,2,6,3,6,7,0,0,3,0,4,0,7,0,7,2,7,5,0,3,0,6,2,1,5,1,4,5,6,7,3,3,5,5,2,7,4,7,],
    [2,3,6,7,3,1,3,5,3,2,7,2,1,7,4,7,1,3,1,6,2,2,5,5,0,0,3,0,3,2,6,5,0,4,0,7,5,3,7,3,7,4,7,6,0,1,2,1,],
    [2,0,6,4,5,0,5,4,0,2,0,6,3,4,6,4,1,7,4,7,7,1,7,4,1,1,4,4,2,3,2,6,6,0,6,3,5,7,7,5,4,5,6,7,1,2,3,0,],
    [0,0,4,4,2,2,2,6,5,2,5,6,1,2,4,2,4,3,7,6,0,3,0,6,2,1,5,1,4,0,7,0,3,7,6,7,3,6,5,6,6,2,6,4,1,4,3,4,],
    [1,1,5,5,2,2,2,6,6,3,6,7,1,2,5,2,7,4,7,7,2,1,5,1,7,0,7,3,0,0,3,0,0,4,0,7,3,6,5,4,3,5,5,7,1,4,1,6,],
    [2,3,6,7,3,0,3,4,3,1,7,1,0,7,4,7,0,3,0,6,4,2,7,5,1,0,4,3,1,6,4,6,1,0,1,3,5,2,7,2,2,4,4,4,0,0,2,2,],
    [0,3,4,7,3,3,3,7,3,4,7,4,3,2,6,2,2,1,2,4,2,6,5,6,3,1,6,1,7,0,7,3,0,4,0,7,2,0,4,0,6,5,6,7,4,3,6,3,],
    [3,0,7,4,6,3,6,7,3,7,7,7,4,5,7,5,0,5,3,2,1,5,4,2,1,0,1,3,1,7,4,4,4,0,7,3,0,7,2,5,5,0,7,2,3,6,5,6,],
    [0,1,4,5,1,2,1,6,3,2,7,6,4,4,7,7,0,0,0,3,2,0,5,3,0,4,0,7,2,4,5,7,6,1,6,4,3,0,6,0,7,0,7,2,1,1,3,3,],
    [3,1,7,5,6,0,6,4,1,0,1,4,3,4,7,4,2,1,2,4,4,6,7,6,2,0,5,0,2,5,5,5,0,2,0,5,1,6,3,6,5,0,5,2,7,0,7,2,],
    [0,1,4,5,3,0,3,4,7,0,7,4,2,0,5,0,1,3,4,6,1,4,4,7,0,4,3,7,3,1,6,1,4,2,7,5,0,5,0,7,5,5,7,7,4,3,6,5,],
    [2,1,6,5,5,0,5,4,2,0,6,0,2,4,6,4,1,4,1,7,0,3,3,3,0,4,0,7,0,0,0,3,2,6,5,6,2,7,5,7,7,0,7,2,4,5,6,7,],
    [3,1,7,5,4,2,4,6,0,5,4,5,1,4,5,0,0,3,3,3,2,7,5,7,7,0,7,3,0,6,3,6,6,3,6,6,2,0,4,0,1,0,1,2,5,1,7,3,],
    [2,3,6,7,4,3,4,7,0,3,0,7,2,7,5,7,3,3,6,0,1,7,4,4,0,1,3,1,1,0,4,0,6,3,6,6,1,2,1,5,7,1,7,3,3,2,5,0,],
    [2,1,6,5,6,2,6,6,2,7,6,7,3,6,7,6,1,2,4,5,0,6,3,3,2,6,5,3,7,2,7,5,1,3,4,0,0,1,0,3,0,7,2,5,5,1,7,1,],
    [2,2,6,6,3,3,3,7,0,5,4,5,4,7,7,4,4,2,7,2,0,3,3,0,1,4,4,1,2,0,5,3,4,0,7,0,7,4,7,6,0,5,2,7,0,1,2,1,],
    [2,1,6,5,3,1,3,5,2,4,6,0,3,6,6,6,1,0,1,3,2,7,5,4,0,4,0,7,2,0,5,0,7,2,7,5,6,1,6,4,4,7,6,7,1,5,1,7,],
    [1,3,5,7,2,0,2,4,0,3,4,7,2,1,6,1,7,0,7,3,3,4,6,4,7,4,7,7,3,0,6,0,3,2,6,5,4,2,6,2,0,4,2,6,4,5,6,7,],
    [0,0,4,4,3,3,3,7,3,2,7,6,4,2,7,2,2,3,2,6,2,1,5,1,4,7,7,7,1,2,1,5,0,1,0,4,0,5,0,7,4,6,6,6,3,5,5,5,],
    [0,3,4,7,2,1,2,5,3,5,7,1,0,1,3,1,7,2,7,5,3,2,6,5,0,4,0,7,3,0,6,3,3,3,6,0,1,0,1,2,3,4,5,6,1,5,3,7,],
    [0,2,4,6,0,1,0,5,2,5,6,1,4,7,7,4,2,1,5,1,4,4,7,1,0,0,3,0,4,0,7,0,3,6,6,3,5,7,7,5,1,5,3,7,1,1,3,3,],
    [1,1,5,5,4,0,4,4,1,6,5,6,3,4,7,4,0,1,0,4,4,7,7,7,5,0,5,3,0,5,3,2,0,7,3,7,2,5,4,5,1,2,3,0,6,0,6,2,],
    [2,0,6,4,4,2,4,6,1,3,1,7,2,6,5,6,0,1,0,4,0,0,3,3,4,1,7,4,4,0,7,3,4,7,7,7,2,4,5,4,1,2,3,0,5,0,7,2,],
    [0,3,4,7,2,3,2,7,1,3,5,3,0,7,3,7,4,4,7,7,3,4,6,7,3,0,6,3,2,4,5,7,7,2,7,5,0,4,0,6,1,2,3,2,5,4,7,6,],
    [1,1,5,5,2,2,2,6,1,6,5,6,1,2,5,2,4,0,7,0,6,4,6,7,3,1,6,1,0,4,0,7,3,7,6,7,0,0,0,2,4,3,6,3,1,0,3,0,],
    [2,3,6,7,4,3,4,7,7,3,7,7,0,2,4,2,5,0,5,3,6,1,6,4,1,1,4,1,1,4,1,7,0,3,0,6,1,3,3,5,2,5,2,7,3,0,5,0,],
    [3,1,7,5,4,2,4,6,1,4,5,4,0,1,0,5,4,7,7,4,3,0,6,3,4,0,7,3,0,5,3,5,1,1,1,4,3,3,5,5,1,7,3,7,5,7,7,7,],
    [2,3,6,7,2,0,2,4,2,0,6,0,3,7,6,4,3,2,6,5,1,7,4,4,0,4,0,7,0,0,0,3,1,4,4,7,1,0,1,2,1,5,3,3,4,1,6,3,],
    [1,1,5,5,2,2,2,6,2,0,6,4,1,6,4,6,7,0,7,3,0,4,0,7,0,3,3,0,4,1,7,4,3,2,6,5,3,0,6,0,4,5,6,7,0,0,0,2,],
    [1,0,5,4,5,1,5,5,1,1,1,5,3,1,6,1,7,0,7,3,0,1,0,4,2,6,5,6,4,7,7,7,0,7,3,4,4,0,6,0,7,4,7,6,1,7,3,7,],
    [1,2,5,6,2,3,2,7,0,1,4,1,1,3,4,3,7,2,7,5,3,5,6,2,6,3,6,6,0,0,3,0,4,7,7,7,3,7,5,5,4,2,6,0,0,4,0,6,],
    [3,3,7,7,6,3,6,7,3,6,7,6,4,1,7,4,1,3,4,0,1,4,1,7,7,0,7,3,0,0,3,0,2,4,2,7,0,1,0,3,4,2,6,0,2,3,4,5,],
    [3,2,7,6,5,2,5,6,0,1,4,5,3,6,6,6,4,0,7,0,0,2,0,5,0,7,3,7,6,1,6,4,1,3,4,6,1,4,1,6,4,7,6,7,1,1,3,3,],
    [0,2,4,6,4,3,4,7,2,2,6,6,3,7,7,7,4,2,7,5,4,0,7,3,1,4,4,1,0,6,3,6,0,7,3,7,0,3,0,5,5,2,7,2,1,0,1,2,],
    [1,3,5,7,3,3,3,7,1,0,5,4,0,0,0,3,2,3,5,0,4,4,7,1,7,3,7,6,0,7,3,4,0,4,3,7,6,5,6,7,4,2,6,0,0,2,2,0,],
    [3,2,7,6,6,1,6,5,7,1,7,5,1,4,4,7,0,1,3,1,4,0,7,3,0,4,3,7,3,3,6,6,2,4,5,7,4,2,6,0,2,3,4,5,0,0,2,0,],
    [2,0,6,4,5,3,5,7,0,3,0,7,4,5,7,5,2,5,5,2,6,2,6,5,0,2,3,2,3,3,3,6,0,7,3,7,1,4,1,6,5,2,7,0,0,0,0,2,],
    [1,1,5,5,2,2,2,6,2,7,6,7,1,2,5,2,1,3,1,6,4,0,7,0,0,3,0,6,2,1,5,1,0,0,3,0,5,3,7,5,7,1,7,3,2,6,4,6,],
    [0,3,4,7,3,2,3,6,3,7,7,3,0,4,4,0,4,2,4,5,3,0,6,3,2,4,2,7,7,1,7,4,5,0,5,3,0,0,0,2,4,5,6,7,5,7,7,5,],
    [0,0,4,4,1,1,1,5,2,3,6,7,0,5,3,5,1,7,4,7,0,1,0,4,1,0,4,0,7,3,7,6,6,3,6,6,4,2,6,0,5,0,7,2,2,6,4,6,],
    [2,2,6,6,5,2,5,6,1,3,1,7,3,6,6,6,6,2,6,5,0,0,0,3,3,0,6,0,2,4,2,7,7,0,7,3,2,0,4,2,0,4,0,6,3,7,5,7,],
    [0,0,4,4,2,0,2,4,3,6,7,6,2,1,6,1,4,4,7,4,0,7,3,4,1,2,1,5,4,5,7,5,3,3,6,3,7,0,7,2,1,7,3,5,3,2,5,2,],
    [2,1,6,5,4,3,4,7,7,0,7,4,2,7,5,7,0,3,0,6,3,3,6,0,1,3,4,6,0,1,3,4,1,4,1,7,1,0,3,0,7,5,7,7,4,1,6,3,],
    [2,1,6,5,5,0,5,4,3,5,7,1,0,3,0,6,2,2,2,5,4,6,7,3,3,7,6,7,1,2,1,5,3,3,3,6,0,2,2,0,0,7,2,7,5,6,7,6,],
    [1,0,5,4,2,1,2,5,3,5,7,1,2,0,5,0,3,3,6,0,1,7,4,7,0,0,0,3,0,4,0,7,7,2,7,5,6,3,6,6,3,4,5,2,0,3,2,3,],
    [2,0,6,4,5,3,5,7,2,7,6,7,1,2,5,6,1,3,1,6,0,3,3,6,2,4,5,1,7,3,7,6,1,7,4,4,5,0,7,2,0,4,0,6,0,0,2,2,],
    [0,1,4,5,3,0,3,4,3,1,7,1,2,0,5,0,3,7,6,4,2,6,5,3,1,4,4,7,7,4,7,7,1,0,1,3,1,5,1,7,2,2,4,2,5,4,7,2,],
    [1,2,5,6,4,2,4,6,3,5,7,5,2,6,5,6,1,7,4,7,0,1,0,4,2,0,5,0,1,3,1,6,2,1,5,1,5,1,7,1,5,2,7,2,5,4,7,4,],
    [1,0,5,4,2,1,2,5,2,4,6,0,7,2,7,6,1,7,4,4,1,4,4,7,0,2,0,5,4,6,7,6,6,1,6,4,2,0,4,0,5,1,5,3,5,5,7,7,],
    [1,2,5,6,5,3,5,7,0,4,4,0,2,7,6,7,0,6,3,3,3,2,6,2,1,7,4,4,6,3,6,6,7,4,7,7,0,0,3,0,0,3,2,5,5,0,7,2,],
    [0,2,4,6,1,3,1,7,1,2,5,6,3,2,6,5,4,0,7,0,4,2,7,5,0,3,0,6,1,1,4,4,2,1,5,1,4,4,6,6,5,2,7,2,5,7,7,7,],
    [0,1,4,5,3,1,3,5,0,6,4,2,2,1,5,1,7,1,7,4,4,4,7,7,6,2,6,5,0,2,0,5,4,0,7,0,1,0,3,0,2,7,4,7,0,0,2,2,],
    [2,3,6,7,2,0,2,4,1,1,5,1,2,3,5,3,0,5,3,5,4,4,7,7,7,0,7,3,3,0,6,0,0,6,3,6,6,3,6,5,0,0,0,2,3,7,5,7,],
    [0,2,4,6,1,3,1,7,2,0,6,4,0,3,4,3,3,4,6,7,7,0,7,3,6,0,6,3,4,3,7,6,4,4,7,7,0,5,0,7,3,7,5,7,1,0,3,2,],
    [1,0,5,4,2,0,2,4,0,3,0,7,3,3,7,7,4,0,7,3,1,2,1,5,0,0,3,3,3,4,3,7,3,1,6,4,5,6,7,4,4,5,4,7,5,0,7,0,],
    [1,3,5,7,2,0,2,4,6,2,6,6,2,1,6,1,5,3,5,6,0,3,0,6,2,5,5,2,0,7,3,7,4,0,7,0,7,4,7,7,1,0,1,2,2,2,4,4,],
    [0,3,4,7,1,0,1,4,1,1,5,1,0,4,3,4,5,3,5,6,7,1,7,4,1,7,4,4,3,0,6,0,4,3,7,0,0,5,0,7,5,7,7,7,6,3,6,5,],
    [1,2,5,6,3,2,3,6,2,0,6,4,0,1,0,4,4,4,7,4,4,1,7,1,0,6,3,6,6,3,6,6,4,0,7,3,0,5,2,7,0,7,2,5,4,7,6,7,],
    [0,1,4,5,3,1,3,5,2,4,6,4,3,2,7,2,3,0,6,0,1,6,4,6,0,7,3,7,4,3,7,3,7,4,7,7,4,7,6,5,0,0,2,2,0,2,0,4,],
    [3,3,7,7,6,2,6,6,1,6,5,2,0,1,0,4,1,0,4,0,1,2,4,2,2,1,5,1,2,4,5,7,7,3,7,6,5,0,7,2,4,5,6,7,1,3,1,5,],
    [1,1,5,5,4,0,4,4,1,0,5,0,3,4,7,4,4,5,7,2,0,7,3,7,7,4,7,7,0,0,0,3,0,5,3,2,2,5,4,7,5,1,7,3,0,4,2,6,],
    [1,1,5,5,1,0,1,4,7,2,7,6,0,0,3,0,1,6,4,6,5,0,5,3,1,7,4,7,6,3,6,6,2,1,5,4,4,0,4,2,3,4,5,6,6,0,6,2,],
    [3,0,7,4,5,2,5,6,2,1,2,5,4,2,7,2,1,2,4,5,0,6,3,6,4,0,7,3,4,3,7,6,2,7,5,7,0,3,0,5,0,2,2,0,7,0,7,2,],
    [0,1,4,5,2,3,2,7,2,7,6,7,4,4,7,7,3,6,6,6,4,3,7,6,7,2,7,5,4,0,7,0,3,1,6,4,5,2,7,2,1,1,3,3,0,0,2,0,],
    [0,0,4,4,1,1,1,5,0,5,4,5,0,1,4,1,4,7,7,4,0,6,3,6,6,0,6,3,4,2,7,5,5,1,5,4,2,0,4,0,7,0,7,2,0,7,2,7,],
    [3,0,7,4,7,1,7,5,2,3,2,7,1,7,4,4,0,3,0,6,0,2,3,2,3,4,6,1,5,3,5,6,1,3,1,6,4,0,6,2,4,7,6,7,4,2,6,0,],
    [3,2,7,6,3,1,3,5,3,7,7,3,4,0,7,0,2,3,2,6,0,0,3,0,4,2,7,2,0,3,0,6,1,1,1,4,5,7,7,5,2,7,4,5,5,1,7,1,],
    [1,1,5,5,4,0,4,4,1,0,5,0,3,2,6,2,1,6,4,6,0,2,3,5,4,7,7,7,7,0,7,3,0,7,3,7,5,4,7,4,5,5,7,5,5,6,7,6,],
    [0,1,4,5,2,1,2,5,2,1,6,1,0,5,3,5,5,4,5,7,3,0,6,0,0,7,3,7,4,2,7,5,0,6,3,6,7,2,7,4,6,5,6,7,4,4,6,2,],
    [3,3,7,7,6,3,6,7,3,6,7,6,2,1,5,4,2,4,2,7,2,0,5,3,0,1,0,4,7,0,7,3,0,0,3,3,4,1,6,1,1,2,3,4,0,5,0,7,],
    [2,0,6,4,5,3,5,7,3,6,7,6,2,5,5,2,2,3,5,0,0,3,0,6,7,2,7,5,1,1,4,4,1,2,1,5,1,7,3,5,6,1,6,3,3,7,5,7,],
    [1,0,5,4,4,3,4,7,2,6,6,2,2,0,5,0,0,7,3,7,6,3,6,6,0,3,3,6,7,1,7,4,0,6,3,3,4,1,6,1,0,4,2,2,5,7,7,7,],
    [1,2,5,6,3,0,3,4,3,0,7,0,1,4,4,4,1,6,4,6,4,3,7,6,0,4,0,7,4,1,7,1,3,4,3,7,5,3,7,5,5,2,7,2,0,1,0,3,],
    [1,1,5,5,2,2,2,6,1,6,5,6,0,7,3,7,6,3,6,6,0,2,0,5,7,0,7,3,4,2,7,5,1,0,4,0,1,0,3,2,1,3,3,5,4,1,6,1,],
    [0,3,4,7,3,2,3,6,5,1,5,5,0,6,4,6,1,0,4,0,7,1,7,4,0,1,3,1,4,2,4,5,6,3,6,6,0,2,2,4,5,7,7,5,0,5,2,7,],
    [3,2,7,6,4,3,4,7,0,6,4,6,0,2,0,5,1,0,4,0,0,0,3,3,7,2,7,5,6,1,6,4,1,2,1,5,3,1,5,3,6,4,6,6,4,5,6,7,],
    [2,0,6,4,3,1,3,5,0,3,4,3,4,0,7,3,1,6,4,6,4,1,7,4,2,2,5,5,0,3,0,6,2,7,5,7,5,0,7,2,0,0,0,2,7,5,7,7,],
    [0,2,4,6,2,0,2,4,1,0,5,0,3,3,6,0,0,3,3,6,4,5,7,2,3,7,6,7,4,3,7,0,4,4,7,1,7,3,7,5,0,6,2,6,5,5,7,7,],
    [0,2,4,6,0,1,0,5,3,1,7,1,1,6,4,3,3,6,6,3,7,3,7,6,6,4,6,7,5,3,5,6,2,7,5,7,1,0,3,2,4,0,6,0,0,0,2,2,],
    [2,3,6,7,2,0,2,4,2,0,6,0,4,3,7,0,4,6,7,3,7,4,7,7,3,6,6,3,2,7,5,7,4,4,7,1,0,6,2,6,1,5,3,5,1,1,1,3,],
    [3,2,7,6,5,2,5,6,0,2,4,6,7,0,7,3,4,7,7,7,2,0,2,3,0,7,3,7,3,3,6,0,3,0,6,0,1,6,3,6,6,2,6,4,1,0,1,2,],
    [2,1,6,5,3,1,3,5,0,5,4,5,2,0,5,0,0,7,3,7,0,6,3,6,1,1,1,4,4,7,7,7,3,1,6,4,7,4,7,6,2,4,4,6,5,1,7,1,],
    [0,0,4,4,3,3,3,7,1,6,5,6,4,2,7,5,3,2,6,5,0,2,0,5,2,1,5,1,2,0,5,0,6,0,6,3,5,2,7,0,7,2,7,4,5,5,7,7,],
    [3,0,7,4,4,1,4,5,0,4,4,4,3,1,6,1,0,7,3,7,2,3,2,6,7,0,7,3,6,4,6,7,5,4,5,7,1,1,1,3,0,0,2,0,0,1,0,3,],
    [0,2,4,6,1,3,1,7,7,1,7,5,1,0,5,4,3,7,6,7,3,3,6,6,2,3,5,6,5,0,5,3,0,6,3,6,6,1,6,4,2,2,4,0,0,3,0,5,],
    [3,0,7,4,4,1,4,5,3,7,7,3,3,3,6,3,0,1,0,4,4,7,7,7,1,3,4,0,0,5,3,2,0,6,3,6,1,0,1,2,7,0,7,2,0,7,2,7,],
    [3,2,7,6,4,0,4,4,1,0,5,0,3,4,6,4,1,4,1,7,0,5,3,5,3,7,6,7,0,4,3,1,5,1,5,4,0,0,0,2,7,3,7,5,5,0,7,2,],
    [0,0,4,4,2,0,2,4,2,0,6,0,3,4,6,1,6,2,6,5,7,3,7,6,0,4,3,7,5,4,5,7,0,3,3,6,0,5,2,7,3,1,5,3,4,5,4,7,],
    [0,0,4,4,3,3,3,7,3,0,7,4,2,3,5,3,0,4,3,1,1,4,1,7,4,0,7,0,4,5,7,2,6,4,6,7,0,6,2,6,1,0,3,2,7,5,7,7,],
    [3,2,7,6,5,0,5,4,1,0,5,0,0,6,3,6,1,1,4,1,1,2,4,5,1,5,4,2,7,2,7,5,3,7,6,7,6,1,6,4,5,5,7,7,0,4,2,2,],
    [1,1,5,5,2,2,2,6,7,0,7,4,1,2,5,2,3,4,3,7,6,0,6,3,4,6,7,6,0,0,0,3,1,2,1,5,1,0,3,0,2,1,4,1,0,5,2,7,],
    [2,2,6,6,2,1,2,5,3,6,7,2,0,5,3,5,0,0,0,3,1,0,1,3,1,7,4,7,7,2,7,5,4,3,7,0,3,4,5,6,3,2,5,0,2,0,4,0,],
    [3,3,7,7,3,0,3,4,0,0,4,0,0,5,3,5,7,3,7,6,4,3,7,0,0,7,3,7,2,6,5,6,0,4,3,4,6,0,6,2,4,5,6,3,0,2,2,2,],
    [3,3,7,7,6,3,6,7,3,6,7,6,7,0,7,4,0,2,0,5,2,5,5,2,1,0,4,0,3,1,6,4,1,3,1,6,2,3,5,0,0,7,2,7,3,6,5,4,],
    [3,0,7,4,6,3,6,7,3,6,7,6,4,5,7,5,0,4,3,1,4,0,7,0,1,6,4,3,0,7,3,7,4,4,7,1,0,5,2,3,1,0,1,2,0,2,2,4,],
    [1,3,5,7,3,1,3,5,3,1,7,1,1,5,4,5,7,2,7,5,1,6,4,6,0,0,0,3,0,4,0,7,3,5,6,2,3,0,5,0,1,7,3,7,6,5,6,7,],
    [1,0,5,4,3,0,3,4,3,1,7,1,1,4,4,4,4,5,7,5,0,6,3,6,0,5,3,5,4,2,7,5,0,7,3,7,0,1,2,3,5,2,7,4,0,2,0,4,],
    [0,2,4,6,3,1,3,5,4,1,4,5,1,5,4,5,7,1,7,4,1,7,4,7,5,1,5,4,6,3,6,6,2,0,2,3,1,2,3,0,5,5,5,7,6,0,6,2,],
    [3,3,7,7,5,3,5,7,2,5,6,5,1,1,1,5,3,0,6,3,0,2,0,5,0,7,3,7,2,1,2,4,7,2,7,5,0,6,2,6,4,2,6,0,4,6,6,4,],
    [3,2,7,6,5,0,5,4,1,0,5,0,1,2,5,6,0,6,3,3,1,6,4,6,7,2,7,5,2,7,5,7,4,4,7,7,1,7,3,5,1,1,3,1,0,3,0,5,],
    [2,0,6,4,3,1,3,5,1,4,5,4,1,6,4,6,0,4,0,7,1,7,4,7,1,0,1,3,4,3,7,0,4,0,7,3,7,5,7,7,4,5,6,7,0,1,0,3,],
    [3,2,7,6,6,2,6,6,3,5,7,5,0,1,0,4,1,5,4,2,1,6,4,6,5,0,5,3,1,1,1,4,2,7,5,7,2,1,2,3,3,4,5,6,2,0,4,0,],
    [3,1,7,5,3,0,3,4,0,4,4,4,0,6,3,6,4,1,7,4,7,0,7,3,2,7,5,7,4,3,7,6,1,0,1,3,0,1,0,3,3,5,5,5,4,6,6,6,],
    [0,3,4,7,0,0,0,4,1,5,5,1,3,0,3,4,4,3,7,3,4,5,7,5,4,6,7,6,4,3,7,0,4,4,7,4,0,5,2,7,1,7,3,5,1,1,1,3,],
    [1,1,5,5,2,2,2,6,1,6,5,6,1,2,4,2,3,4,6,1,0,3,0,6,4,7,7,7,7,4,7,7,2,0,5,0,7,1,7,3,1,5,3,7,6,3,6,5,],
    [1,3,5,7,2,0,2,4,7,2,7,6,2,3,5,3,1,4,4,7,3,4,6,7,3,0,6,3,4,0,7,0,3,7,6,4,0,2,0,5,0,7,2,7,5,1,7,1,],
    [0,2,4,6,0,1,0,5,0,2,4,2,2,3,5,6,1,4,1,7,5,1,5,4,7,2,7,5,6,3,6,6,0,0,3,0,3,7,6,7,6,1,6,3,1,1,3,3,],
    [1,0,5,4,4,2,4,6,3,3,7,3,0,5,4,1,2,2,2,5,4,0,7,0,4,7,7,7,0,6,3,6,0,0,0,3,1,5,1,7,7,4,7,6,5,1,7,3,],
    [2,2,6,6,5,1,5,5,1,0,1,4,4,5,7,5,2,3,5,6,0,5,3,5,0,6,3,6,0,3,3,0,4,7,7,7,7,1,7,4,0,2,2,4,3,2,5,0,],
    [2,0,6,4,4,0,4,4,2,6,6,6,2,4,5,4,6,0,6,3,7,3,7,6,0,0,3,3,1,2,1,5,0,4,0,7,0,7,2,5,5,0,5,2,7,0,7,2,],
    [0,0,4,4,3,3,3,7,0,5,4,1,3,6,7,6,7,1,7,4,4,3,7,0,5,1,5,4,2,0,5,0,4,7,7,7,6,2,6,5,2,1,4,1,0,4,2,6,],
    [3,3,7,7,6,2,6,6,0,3,4,7,4,4,7,4,4,3,7,0,0,1,3,1,2,4,5,7,0,4,0,7,1,3,1,6,0,0,2,2,4,0,6,0,2,3,4,5,],
    [0,3,4,7,1,0,1,4,0,0,4,0,3,3,7,3,2,4,5,7,2,3,5,6,0,7,3,7,4,1,7,1,6,4,6,7,7,3,7,5,5,2,7,2,3,2,5,4,],
    [2,0,6,4,5,3,5,7,3,6,7,6,1,5,4,5,2,3,5,0,0,7,3,7,1,1,4,4,1,0,4,3,7,2,7,5,4,0,6,2,6,0,6,2,0,6,2,6,],
    [1,0,5,4,4,3,4,7,3,3,3,7,0,0,0,3,1,3,4,0,6,0,6,3,7,0,7,3,1,5,4,2,4,2,7,5,6,5,6,7,0,7,2,5,0,5,2,3,],
    [0,2,4,6,3,1,3,5,7,0,7,4,2,3,5,3,3,6,6,3,3,0,6,3,2,2,5,5,0,0,3,0,0,4,3,7,4,7,6,5,0,1,2,1,4,0,6,2,],
    [3,3,7,7,5,1,5,5,0,6,4,6,3,1,6,1,0,2,3,5,3,4,6,7,1,7,4,7,3,0,6,0,6,2,6,5,2,1,4,3,7,0,7,2,0,0,2,2,],
    [1,3,5,7,3,1,3,5,0,1,4,1,2,5,5,5,4,0,7,3,7,4,7,7,1,4,1,7,0,0,3,0,6,3,6,6,5,0,7,0,2,7,4,7,5,0,7,2,],
    [1,3,5,7,4,3,4,7,3,6,7,2,0,1,3,4,7,3,7,6,4,0,7,0,0,0,3,0,3,1,6,4,0,3,0,6,2,5,2,7,5,1,7,1,1,1,3,3,],
    [1,1,5,5,3,3,3,7,3,7,7,7,2,3,5,3,7,3,7,6,2,0,5,0,3,2,6,2,0,1,0,4,1,4,1,7,2,1,4,1,0,5,0,7,2,4,2,6,],
    [1,0,5,4,3,0,3,4,3,5,7,5,1,4,4,4,1,6,4,6,4,1,7,1,1,7,4,7,4,2,7,2,0,3,0,6,1,1,1,3,5,0,7,0,0,0,0,2,],
    [3,1,7,5,6,0,6,4,3,7,7,7,3,4,7,4,0,6,3,3,2,3,5,0,0,0,0,3,1,6,4,6,1,0,4,3,1,7,3,5,0,4,2,2,2,7,4,5,],
    [1,0,5,4,2,1,2,5,0,4,4,4,3,1,6,1,2,6,5,6,3,5,6,5,7,3,7,6,0,0,0,3,1,7,4,7,4,2,7,2,5,7,7,7,0,5,0,7,],
    [3,0,7,4,5,2,5,6,0,6,4,2,3,6,6,6,1,7,4,4,0,5,3,2,0,7,3,4,1,0,1,3,3,7,6,7,2,0,2,2,5,3,7,5,7,1,7,3,],
    [1,1,5,5,2,1,2,5,3,4,7,0,0,4,0,7,7,2,7,5,2,0,5,0,1,2,1,5,2,6,5,6,6,2,6,5,3,3,6,0,0,1,0,3,0,7,2,7,],
    [2,3,6,7,3,0,3,4,1,1,5,1,2,4,5,4,4,0,7,0,1,7,4,7,4,6,7,3,0,3,3,6,2,0,5,3,5,7,7,5,6,1,6,3,0,5,0,7,],
    [2,2,6,6,3,3,3,7,0,5,4,5,5,0,5,3,1,0,4,3,7,4,7,7,1,1,1,4,6,3,6,6,7,0,7,3,6,0,6,2,0,2,2,0,4,0,4,2,],
    [3,0,7,4,6,0,6,4,0,2,4,6,4,0,7,0,1,1,4,4,3,2,6,5,0,3,3,6,1,2,4,5,3,7,6,7,0,5,2,7,0,4,2,6,4,2,6,0,],
    [0,3,4,7,3,2,3,6,2,0,2,4,7,2,7,5,3,0,6,0,4,2,4,5,5,3,5,6,0,4,0,7,1,0,1,3,5,7,7,7,6,4,6,6,5,2,7,0,],
    [3,1,7,5,5,1,5,5,0,6,4,6,3,5,6,5,0,0,3,0,7,0,7,3,1,4,1,7,0,4,3,1,1,4,4,1,5,6,7,6,0,1,2,1,4,7,6,7,],
    [0,0,4,4,2,2,2,6,6,1,6,5,1,2,4,2,3,0,6,0,7,2,7,5,4,7,7,7,0,4,3,4,5,1,5,4,5,5,7,7,2,1,4,1,1,3,3,5,],
    [3,1,7,5,5,3,5,7,2,2,2,6,3,7,6,7,0,6,3,3,1,0,4,3,4,1,7,4,3,0,6,0,1,1,1,4,5,1,7,1,0,2,0,4,3,4,3,6,],
    [2,0,6,4,6,1,6,5,1,3,5,7,1,2,4,5,4,4,7,7,0,6,3,6,2,1,5,4,4,0,7,0,0,0,3,3,7,1,7,3,1,7,3,7,0,2,0,4,],
    [0,3,4,7,1,1,1,5,1,2,5,2,2,0,5,0,4,5,7,2,7,4,7,7,0,7,3,7,2,1,2,4,4,1,7,1,4,6,6,4,1,6,3,4,0,0,0,2,],
    [1,1,5,5,2,2,2,6,2,7,6,3,1,2,5,2,0,3,0,6,4,0,7,0,1,4,1,7,0,0,3,0,7,4,7,7,7,1,7,4,3,7,5,5,4,6,6,6,],
    [3,0,7,4,4,1,4,5,2,2,6,6,3,1,7,1,0,5,3,2,1,3,4,6,2,7,5,7,0,7,3,4,4,0,7,0,0,0,2,0,0,2,0,4,5,3,7,5,],
    [1,1,5,5,3,3,3,7,3,7,7,7,3,6,7,6,1,4,1,7,4,0,7,3,0,4,3,7,3,1,6,4,0,3,3,0,3,2,5,4,5,2,7,0,0,2,2,4,],
    [1,2,5,6,1,1,1,5,2,6,6,2,0,1,4,1,1,7,4,7,2,4,5,7,1,0,4,0,6,3,6,6,4,0,7,0,7,4,7,7,7,1,7,3,0,3,0,5,],
    [0,2,4,6,1,3,1,7,3,0,7,4,0,3,3,3,3,7,6,7,4,5,7,5,4,0,7,0,1,2,4,2,1,0,4,3,4,4,6,2,0,5,0,7,5,1,7,1,],
    [2,3,6,7,4,3,4,7,3,5,7,5,1,4,1,7,2,4,2,7,0,0,3,0,4,0,4,3,5,1,5,4,6,0,6,3,3,1,3,3,7,3,7,5,0,2,2,2,],
    [0,0,4,4,4,1,4,5,3,2,7,2,3,7,6,7,6,3,6,6,0,3,3,6,4,0,7,0,0,4,0,7,1,3,4,6,0,1,3,4,1,5,1,7,5,4,5,6,],
    [0,1,4,5,3,0,3,4,1,1,5,1,2,4,5,4,4,2,7,5,0,7,3,7,0,4,0,7,2,6,5,6,3,4,6,1,1,4,1,6,5,0,7,0,0,0,2,0,],
    [0,3,4,7,2,1,2,5,2,1,6,1,3,3,7,7,0,0,3,0,4,3,7,6,4,0,7,0,0,7,3,7,7,2,7,5,2,2,5,2,4,5,6,7,1,1,1,3,],
    [1,0,5,4,4,0,4,4,1,2,5,6,3,0,6,0,2,4,5,7,1,7,4,7,7,0,7,3,7,4,7,7,0,0,0,3,0,4,0,6,1,6,3,6,6,3,6,5,],
    [3,2,7,6,6,1,6,5,2,0,6,0,3,5,7,5,0,2,0,5,1,4,1,7,2,6,5,6,2,7,5,7,2,4,5,1,7,0,7,2,5,0,5,2,1,1,3,1,],
    [3,3,7,7,4,0,4,4,6,1,6,5,2,4,5,4,0,5,3,5,1,1,1,4,2,3,5,6,1,6,4,6,7,3,7,6,2,1,4,3,7,0,7,2,2,7,4,7,],
    [1,3,5,7,3,3,3,7,3,4,7,4,1,0,4,0,4,5,7,5,2,2,5,2,0,0,0,3,0,6,3,6,1,1,4,1,2,5,2,7,5,3,7,3,5,6,7,6,],
    [0,2,4,6,1,3,1,7,0,7,4,7,0,3,3,3,3,1,6,4,5,4,5,7,2,5,5,2,6,0,6,3,1,0,4,0,4,5,6,7,7,5,7,7,0,4,0,6,],
    [1,2,5,6,3,2,3,6,3,2,7,2,2,1,5,4,0,4,3,7,4,0,7,0,0,0,3,3,7,4,7,7,4,1,7,1,0,7,2,5,6,3,6,5,4,4,6,6,],
    [2,1,6,5,6,2,6,6,2,4,6,0,3,6,7,6,0,4,0,7,3,7,6,7,0,0,0,3,5,0,5,3,7,2,7,5,1,0,3,0,1,5,3,5,2,3,4,5,],
    [0,2,4,6,3,1,3,5,6,2,6,6,2,3,5,3,4,4,7,7,0,3,3,6,2,0,5,0,2,7,5,7,7,0,7,3,4,2,6,0,0,1,2,1,0,5,0,7,],
    [1,0,5,4,4,0,4,4,0,3,4,7,3,4,6,7,0,2,3,5,5,0,5,3,7,4,7,7,0,7,3,7,6,1,6,4,0,3,3,3,0,6,2,6,7,1,7,3,],
    [3,1,7,5,7,2,7,6,1,2,5,6,2,7,5,7,2,0,5,0,1,6,4,6,4,3,7,0,0,2,3,5,0,0,3,3,6,5,6,7,1,0,3,2,0,3,2,5,],
    [2,0,6,4,5,2,5,6,2,3,6,3,1,7,4,4,0,2,3,2,0,3,3,6,7,3,7,6,3,0,6,0,4,2,4,5,2,7,4,7,3,5,5,7,4,1,6,1,],
    [3,2,7,6,5,2,5,6,1,5,5,1,2,6,6,6,0,5,3,2,0,4,3,1,2,0,5,0,4,5,7,2,4,7,7,7,5,1,7,3,0,0,0,2,1,7,3,7,],
    [1,3,5,7,2,0,2,4,0,1,4,1,1,4,5,4,6,0,6,3,0,2,0,5,7,0,7,3,4,2,7,5,0,6,3,6,4,5,6,7,2,7,4,7,5,5,7,7,],
    [3,2,7,6,5,0,5,4,6,0,6,4,1,1,5,1,2,3,5,6,2,4,2,7,0,2,0,5,2,2,5,5,1,4,1,7,1,0,3,0,7,0,7,2,5,7,7,5,],
    [0,0,4,4,4,1,4,5,2,0,6,0,1,4,4,4,6,1,6,4,1,6,4,6,1,7,4,7,5,1,5,4,0,1,3,4,5,6,7,6,7,2,7,4,1,5,3,5,],
    [0,2,4,6,3,2,3,6,3,3,7,3,2,2,5,2,0,1,3,1,0,3,0,6,7,4,7,7,6,4,6,7,5,4,5,7,2,3,4,5,0,7,2,5,1,0,3,0,],
    [3,0,7,4,7,1,7,5,2,3,2,7,3,2,7,6,6,4,6,7,1,2,1,5,2,0,5,3,2,3,5,6,0,1,0,4,3,3,5,5,0,5,0,7,4,0,6,2,],
    [0,2,4,6,1,0,1,4,1,1,5,1,0,4,3,4,3,6,6,3,2,7,5,7,0,6,3,3,3,2,6,2,4,3,7,0,6,4,6,6,3,0,5,0,3,3,5,5,],
    [0,2,4,6,2,2,2,6,1,2,5,2,6,3,6,7,4,1,7,1,1,0,4,0,0,4,0,7,3,4,6,7,7,4,7,7,3,3,5,3,3,7,5,7,0,1,2,1,],
    [0,3,4,7,1,0,1,4,2,2,6,6,2,1,5,1,4,2,7,5,3,4,6,1,3,0,6,0,2,4,5,7,4,5,7,2,0,6,2,6,0,7,2,7,0,0,0,2,],
    [1,3,5,7,4,2,4,6,0,0,0,4,3,6,6,6,7,2,7,5,2,3,5,3,1,7,4,7,0,3,3,0,3,1,6,1,1,6,3,4,5,0,7,0,7,5,7,7,],
    [3,3,7,7,4,1,4,5,1,7,5,7,3,5,6,5,1,3,4,0,2,0,5,0,7,1,7,4,0,1,0,4,3,6,6,6,5,2,5,4,1,0,3,2,2,3,2,5,],
    [1,2,5,6,4,1,4,5,3,2,7,2,3,3,6,3,1,3,4,0,7,3,7,6,4,1,7,1,0,5,3,5,3,7,6,4,0,6,3,6,5,4,7,6,5,7,7,7,],
    [2,3,6,7,3,0,3,4,0,0,4,0,3,1,7,1,7,2,7,5,1,3,4,6,0,6,3,6,6,2,6,5,1,7,4,7,0,2,2,2,0,3,0,5,4,2,4,4,],
    [1,0,5,4,2,1,2,5,3,3,7,7,1,1,5,1,3,4,3,7,4,0,7,0,0,1,0,4,6,1,6,4,1,3,1,6,4,7,7,4,0,7,2,7,2,6,4,6,],
    [0,2,4,6,1,3,1,7,3,1,7,1,0,5,3,5,7,2,7,5,3,4,6,7,0,3,3,0,3,2,6,5,2,2,5,5,4,0,7,0,2,7,4,7,4,2,6,4,],
    [2,0,6,4,5,3,5,7,3,6,7,6,4,5,7,5,0,4,3,7,0,1,3,4,3,0,6,0,2,4,5,1,4,1,7,4,0,7,2,5,0,0,2,2,1,0,3,2,],
    [1,2,5,6,1,1,1,5,2,1,6,1,3,5,7,1,4,6,7,3,0,0,3,0,0,6,3,6,3,7,6,7,4,3,7,6,5,2,7,4,0,2,0,4,1,5,3,3,],
    [0,0,4,4,3,3,3,7,1,6,5,6,7,4,7,7,0,5,3,2,0,3,3,0,5,2,5,5,6,3,6,6,4,0,7,0,5,1,7,1,0,2,2,4,4,7,6,7,],
    [1,2,5,6,4,1,4,5,6,2,6,6,2,7,5,7,0,5,3,5,0,0,3,0,7,1,7,4,5,1,5,4,0,1,3,1,5,0,7,0,1,6,3,6,0,2,0,4,],
    [3,2,7,6,6,1,6,5,1,2,5,6,0,3,0,6,1,1,4,4,4,7,7,7,1,7,4,7,2,0,5,0,7,2,7,5,0,7,2,5,0,2,2,4,3,1,5,3,],
    [0,3,4,7,3,2,3,6,0,2,4,2,2,4,5,4,4,1,7,1,4,6,7,3,0,0,3,0,0,4,0,7,4,0,7,0,5,7,7,5,5,6,7,4,4,3,6,3,],
    [3,3,7,7,6,2,6,6,3,2,7,2,3,6,7,6,0,3,3,0,2,7,5,7,1,3,4,0,0,7,3,4,7,3,7,6,1,5,1,7,3,3,5,3,0,5,2,3,],
    [1,1,5,5,2,2,2,6,2,1,6,5,4,7,7,7,4,1,7,1,0,7,3,7,2,0,5,3,3,0,6,0,7,3,7,6,1,2,1,5,5,2,7,2,3,4,5,6,],
    [1,2,5,6,1,1,1,5,3,2,7,2,0,1,3,1,3,7,6,7,5,1,5,4,0,0,3,0,4,0,7,0,0,2,0,5,7,4,7,7,2,6,4,6,3,3,5,5,],
    [1,2,5,6,3,2,3,6,3,3,7,3,1,3,1,6,4,7,7,7,2,0,5,0,0,7,3,7,2,1,5,1,4,4,7,4,5,2,7,0,0,4,2,6,5,5,7,5,],
    [3,1,7,5,6,0,6,4,3,0,7,0,4,4,7,4,1,3,4,6,1,4,4,1,0,1,0,4,1,6,4,3,4,7,7,7,2,7,4,7,1,0,1,2,5,6,7,6,],
    [1,0,5,4,3,0,3,4,3,1,7,1,1,4,4,4,6,4,6,7,0,7,3,7,0,6,3,6,4,2,7,2,0,5,3,5,0,2,2,2,7,4,7,6,5,0,7,0,],
    [2,1,6,5,4,1,4,5,3,3,7,3,2,5,5,5,1,2,1,5,4,6,7,6,2,0,5,0,0,3,0,6,0,7,3,7,0,0,2,2,5,0,7,2,6,2,6,4,],
    [2,3,6,7,5,3,5,7,2,6,6,6,0,7,3,7,0,6,3,3,1,3,4,0,4,1,7,4,0,2,0,5,1,0,4,3,5,0,7,2,6,4,6,6,4,2,6,0,],
    [2,0,6,4,5,3,5,7,1,3,1,7,4,7,7,7,0,0,3,3,0,1,3,4,3,0,6,3,0,2,0,5,7,1,7,4,4,0,6,0,4,4,6,2,2,4,4,6,],
    [3,0,7,4,4,1,4,5,1,2,1,6,2,1,2,5,3,6,6,6,4,7,7,7,3,0,3,3,4,0,7,0,4,1,7,1,5,4,7,6,5,5,7,3,0,2,0,4,],
    [3,0,7,4,7,1,7,5,0,6,4,6,3,3,6,6,3,2,6,5,2,1,2,4,5,0,5,3,1,5,4,5,0,0,0,3,2,7,4,7,4,0,4,2,1,1,1,3,],
    [1,0,5,4,3,2,3,6,1,2,1,6,3,5,7,5,4,0,7,3,1,7,4,7,3,1,6,4,0,3,0,6,2,2,2,5,5,0,7,0,5,7,7,7,3,0,5,2,],
    [2,1,6,5,3,2,3,6,3,1,7,5,3,0,7,0,2,7,5,7,1,1,4,4,1,2,1,5,0,2,0,5,4,6,7,6,4,5,6,7,7,2,7,4,2,3,2,5,],
    [0,0,4,4,1,1,1,5,0,5,4,5,0,1,4,1,7,0,7,3,3,4,6,1,6,2,6,5,0,7,3,7,4,6,7,6,0,1,0,3,3,0,5,0,5,3,5,5,],
    [2,3,6,7,2,0,2,4,1,1,5,1,2,3,5,3,1,4,4,7,0,7,3,7,4,4,7,7,0,0,0,3,4,3,7,0,5,4,7,4,0,4,2,6,4,0,6,0,],
    [2,1,6,5,4,1,4,5,0,4,4,0,2,3,5,6,0,6,3,6,7,3,7,6,1,7,4,7,4,2,7,2,2,4,5,7,0,0,0,3,6,5,6,7,5,0,7,0,],
    [0,3,4,7,0,0,0,4,3,4,7,0,2,1,5,1,0,6,3,3,6,4,6,7,7,4,7,7,3,7,6,4,0,5,3,2,2,0,4,0,2,6,4,4,5,3,7,3,],
    [1,0,5,4,2,1,2,5,1,5,5,5,1,1,5,1,4,2,7,5,3,4,6,7,0,7,3,7,3,0,6,3,1,1,1,4,1,6,3,6,6,0,6,2,0,3,2,5,],
    [0,0,4,4,3,2,3,6,1,3,5,3,2,6,6,6,4,0,7,3,4,4,7,4,1,4,1,7,0,2,0,5,2,7,5,7,5,5,5,7,2,5,4,3,3,2,5,0,],
    [3,1,7,5,5,3,5,7,0,6,4,6,3,0,7,4,4,0,7,0,2,0,2,3,1,2,1,5,0,2,0,5,3,2,3,5,2,7,4,5,7,1,7,3,2,5,4,7,],
    [0,1,4,5,4,2,4,6,2,7,6,7,4,1,7,4,5,3,5,6,0,3,3,6,3,0,6,0,0,6,3,3,0,2,3,5,7,0,7,2,5,1,7,3,0,0,2,0,],
    [1,2,5,6,2,0,2,4,1,0,5,0,3,1,7,5,1,4,1,7,0,3,0,6,3,2,6,5,7,0,7,3,2,7,5,7,5,5,7,3,4,1,6,3,6,0,6,2,],
    [0,2,4,6,1,0,1,4,2,7,6,3,0,0,3,0,2,1,5,1,6,4,6,7,0,7,3,4,2,2,5,5,7,4,7,7,5,2,7,2,5,0,7,0,0,4,2,6,],
    [1,2,5,6,3,0,3,4,3,0,7,0,1,4,4,4,5,1,5,4,7,4,7,7,0,1,0,4,4,6,7,3,3,7,6,7,4,1,4,3,1,5,3,5,0,5,2,7,],
    [2,1,6,5,6,2,6,6,2,5,6,5,3,6,7,6,0,4,3,7,3,1,6,1,4,7,7,7,1,1,1,4,7,2,7,5,2,4,4,4,0,0,2,0,4,2,6,2,],
    [2,2,6,6,3,3,3,7,1,6,5,6,3,0,7,4,1,0,1,3,2,1,5,4,4,0,7,3,0,4,0,7,0,0,0,3,5,7,7,7,5,3,7,5,5,0,7,2,],
    [3,1,7,5,6,1,6,5,3,4,7,4,1,2,1,6,0,4,0,7,4,7,7,7,0,0,0,3,1,0,4,3,3,6,6,6,5,0,5,2,1,7,3,5,7,0,7,2,],
    [1,1,5,5,4,0,4,4,1,0,5,0,3,4,7,4,2,7,5,4,7,0,7,3,1,2,1,5,0,1,0,4,6,0,6,3,2,4,5,7,0,7,2,5,4,7,6,5,],
    [3,0,7,4,7,1,7,5,3,3,7,7,1,6,4,3,1,0,1,3,3,1,6,4,3,7,6,7,2,0,2,3,2,7,5,4,0,3,0,5,0,0,0,2,1,7,3,5,],
    [1,1,5,5,1,0,1,4,2,0,6,0,0,0,0,3,4,3,7,0,0,7,3,4,4,6,7,6,3,7,6,7,2,7,5,4,5,3,7,5,0,4,2,6,3,1,5,1,],
    [0,2,4,6,4,3,4,7,3,4,7,4,3,7,7,7,2,0,5,3,7,0,7,3,0,3,3,6,2,3,5,0,3,0,6,3,4,0,6,2,5,6,7,6,4,3,6,5,],
    [0,0,4,4,3,3,3,7,6,0,6,4,3,6,7,6,2,1,5,4,0,3,0,6,2,3,2,6,7,2,7,5,1,2,1,5,2,0,5,3,0,7,2,7,5,7,7,7,],
    [3,2,7,6,6,1,6,5,0,0,4,4,3,5,7,5,2,0,5,0,4,1,7,4,0,3,0,6,1,3,1,6,2,4,2,7,7,0,7,2,4,7,6,7,0,1,2,3,],
    [0,1,4,5,2,1,2,5,3,7,7,3,0,3,0,6,4,4,7,1,4,3,7,6,3,1,6,1,1,4,1,7,3,0,6,0,4,7,6,7,0,2,2,0,3,2,5,2,],
    [1,2,5,6,4,2,4,6,3,0,7,4,0,3,0,7,4,0,7,0,3,7,6,7,1,3,1,6,0,0,3,3,5,1,5,4,0,1,2,1,1,7,3,5,6,4,6,6,],
    [1,0,5,4,4,3,4,7,1,5,5,1,0,7,3,7,0,3,3,6,2,6,5,3,7,2,7,5,0,1,3,4,6,4,6,7,0,4,3,1,0,2,2,0,4,1,6,3,],
    [3,2,7,6,5,0,5,4,2,0,6,0,1,1,5,1,2,6,5,6,0,3,3,3,7,0,7,3,4,4,7,7,2,7,5,7,0,7,2,5,0,6,2,4,6,2,6,4,],
    [0,2,4,6,1,0,1,4,6,0,6,4,1,1,5,1,7,4,7,7,0,7,3,4,2,7,5,7,3,3,6,6,2,2,5,2,0,4,0,6,3,6,5,4,5,0,7,2,],
    [2,3,6,7,3,1,3,5,5,1,5,5,6,1,6,4,1,6,4,6,1,0,1,3,1,7,4,7,4,0,4,3,7,3,7,6,0,2,2,0,7,0,7,2,2,1,2,3,],
    [1,3,5,7,3,3,3,7,3,4,7,4,2,2,6,2,1,1,4,1,4,5,7,5,4,0,7,0,1,4,1,7,0,4,0,7,1,0,3,0,0,1,2,3,4,3,6,3,],
    [2,1,6,5,2,0,2,4,1,0,1,4,0,7,3,7,4,6,7,6,3,3,6,0,4,4,7,1,4,1,7,4,1,5,4,5,0,0,0,2,0,6,2,6,5,7,7,5,],
    [3,2,7,6,6,2,6,6,0,4,4,0,1,6,4,6,2,5,5,5,2,4,5,1,0,0,0,3,3,0,6,3,4,7,7,4,2,1,2,3,0,4,0,6,5,0,7,2,],
    [0,2,4,6,3,1,3,5,1,2,5,2,2,5,5,5,4,0,7,0,1,4,1,7,4,4,7,1,7,3,7,6,4,7,7,7,0,5,0,7,4,3,6,5,4,1,6,1,],
    [1,0,5,4,4,3,4,7,2,6,6,6,3,5,6,5,6,1,6,4,0,7,3,7,1,4,4,4,0,3,3,3,2,0,5,3,4,0,6,0,3,0,5,2,5,7,7,7,],
    [2,0,6,4,6,1,6,5,7,3,7,7,0,6,3,6,0,7,3,7,2,2,5,5,0,1,0,4,1,4,4,1,2,4,5,7,3,0,5,0,1,5,3,7,2,5,4,3,],
    [0,3,4,7,1,0,1,4,3,5,7,1,1,1,5,1,4,3,7,3,0,6,3,3,2,2,5,2,3,0,6,0,0,7,3,7,7,5,7,7,4,6,6,6,1,6,3,4,],
    [1,0,5,4,3,2,3,6,2,3,2,7,3,5,7,5,0,4,0,7,7,1,7,4,6,0,6,3,2,0,5,3,1,4,1,7,3,0,5,2,0,0,0,2,1,0,1,2,],
    [2,1,6,5,3,2,3,6,2,7,6,7,2,6,5,6,0,4,3,1,2,4,5,1,4,1,7,4,3,5,6,2,1,4,1,7,5,0,7,2,0,1,2,3,5,5,7,3,],
    [3,1,7,5,4,1,4,5,0,3,4,7,5,2,5,6,6,1,6,4,1,3,4,6,0,0,3,3,3,0,6,0,0,1,3,4,7,0,7,2,1,5,3,7,5,7,7,7,],
    [0,0,4,4,3,2,3,6,1,3,5,3,2,6,6,6,0,1,0,4,4,5,7,2,1,3,1,6,2,0,5,0,3,7,6,7,5,2,7,0,5,0,7,0,5,5,7,3,],
    [3,0,7,4,4,1,4,5,1,3,5,3,0,3,0,7,4,6,7,3,4,7,7,7,2,4,2,7,3,1,3,4,4,0,7,0,0,1,2,1,1,0,3,0,1,7,3,5,],
    [0,1,4,5,4,2,4,6,3,3,7,3,3,6,7,6,0,0,3,0,1,3,1,6,4,0,7,0,0,4,0,7,2,7,5,7,1,7,3,5,5,2,7,2,4,2,6,4,],
    [0,1,4,5,1,2,1,6,0,3,0,7,0,2,3,2,4,7,7,7,6,3,6,6,1,3,4,6,2,0,5,3,4,3,7,0,5,1,7,3,7,3,7,5,3,3,5,5,],
    [2,0,6,4,5,3,5,7,1,6,5,6,1,7,4,7,0,2,0,5,1,1,4,4,4,3,7,0,1,2,1,5,4,0,7,3,2,1,4,3,5,0,7,0,2,3,4,5,],
    [3,2,7,6,5,0,5,4,1,5,5,5,1,1,5,1,4,2,7,2,0,0,3,0,0,1,0,4,3,4,6,7,2,1,2,4,2,7,5,7,0,5,0,7,2,6,4,6,],
    [3,0,7,4,5,0,5,4,2,1,2,5,3,4,6,4,7,0,7,3,3,5,6,5,1,6,4,6,0,5,3,2,6,0,6,3,0,2,0,4,5,7,7,5,0,0,2,0,],
    [1,0,5,4,5,1,5,5,6,1,6,5,1,1,1,5,3,7,6,7,7,1,7,4,2,3,5,6,2,3,5,0,1,7,4,4,0,5,2,7,2,0,4,2,0,1,0,3,],
    [2,0,6,4,5,2,5,6,3,3,7,3,2,6,6,6,7,4,7,7,0,1,0,4,2,1,2,4,1,7,4,7,1,5,4,5,3,2,5,0,1,2,1,4,5,2,7,0,],
    [2,1,6,5,4,1,4,5,0,2,0,6,0,6,4,6,7,2,7,5,1,3,4,0,2,5,5,2,0,7,3,7,6,1,6,4,5,6,7,6,1,0,3,0,5,0,7,0,],
    [2,0,6,4,4,2,4,6,1,6,5,6,0,1,3,4,0,4,0,7,0,0,3,3,0,2,3,5,7,4,7,7,3,0,6,3,5,0,7,0,5,0,7,2,1,0,3,2,],
    [0,3,4,7,1,0,1,4,0,0,4,0,0,4,3,4,3,7,6,4,3,3,6,0,3,5,6,2,7,1,7,4,3,2,6,5,0,7,2,7,4,1,6,3,5,7,7,5,],
    [3,1,7,5,6,0,6,4,0,5,4,5,3,4,7,4,1,0,4,3,4,7,7,7,0,7,3,7,1,1,1,4,4,6,7,6,7,0,7,3,2,2,2,4,0,0,0,2,],
    [3,2,7,6,5,2,5,6,1,5,5,1,2,6,6,6,0,3,3,0,0,4,3,1,0,7,3,4,7,2,7,5,2,7,5,7,4,0,7,0,0,0,2,0,0,5,2,3,],
    [3,2,7,6,7,3,7,7,3,0,7,0,1,3,1,6,0,0,3,3,1,7,4,7,2,1,5,1,3,4,6,7,0,3,0,6,2,4,2,6,3,3,5,5,3,5,5,7,],
    [2,3,6,7,5,2,5,6,2,2,6,2,2,6,6,6,1,7,4,7,4,3,7,6,0,3,0,6,3,3,6,0,2,0,5,0,7,0,7,3,0,7,2,5,0,0,0,2,],
    [2,2,6,6,3,0,3,4,7,2,7,6,2,4,5,4,0,3,0,6,1,4,1,7,6,0,6,3,4,0,4,3,2,6,5,6,5,0,5,2,3,7,5,7,0,2,2,2,],
    [1,1,5,5,4,0,4,4,2,1,6,1,3,4,6,4,4,7,7,4,1,2,1,5,0,3,0,6,2,4,5,7,0,0,3,0,7,5,7,7,5,1,7,3,0,7,2,5,],
    [1,2,5,6,1,1,1,5,3,0,7,4,1,2,4,2,1,7,4,7,0,4,0,7,4,4,7,1,4,6,7,3,4,3,7,6,4,0,6,0,1,6,3,6,0,0,2,0,],
    [1,1,5,5,2,2,2,6,3,1,7,5,1,4,4,4,4,3,7,0,3,0,6,0,3,6,6,6,0,4,0,7,4,7,7,7,4,1,6,3,1,7,3,7,5,1,7,3,],
    [1,1,5,5,4,0,4,4,3,0,3,4,6,3,6,6,7,0,7,3,5,0,5,3,1,2,1,5,7,4,7,7,0,4,0,7,1,6,4,6,6,0,6,2,3,7,5,7,],
    [3,2,7,6,4,3,4,7,1,5,5,5,4,1,7,4,0,6,3,6,0,1,3,4,4,7,7,7,3,3,6,0,0,0,3,0,7,1,7,3,5,3,7,5,0,2,2,4,],
    [1,1,5,5,2,2,2,6,3,1,7,5,1,2,5,2,3,2,6,5,3,6,6,3,7,0,7,3,1,4,1,7,0,0,3,0,3,5,5,7,2,7,4,7,5,6,7,6,],
    [1,3,5,7,4,2,4,6,1,2,5,2,3,6,7,6,7,2,7,5,0,4,0,7,4,1,7,1,0,0,0,3,4,0,7,0,6,3,6,5,3,1,5,3,1,5,3,7,],
    [3,0,7,4,4,1,4,5,3,7,7,3,0,2,3,2,1,4,4,7,0,6,3,3,1,1,4,1,1,7,4,4,4,1,7,1,5,4,7,6,5,7,7,7,0,3,2,3,],
    [0,1,4,5,3,1,3,5,2,4,6,4,3,2,7,2,7,4,7,7,0,2,0,5,1,6,4,6,4,0,7,0,4,3,7,3,2,7,4,7,5,5,5,7,4,1,6,1,],
    [2,0,6,4,3,1,3,5,0,7,4,7,2,1,6,1,4,5,7,2,2,3,2,6,7,4,7,7,4,4,7,1,1,0,1,3,3,0,6,0,0,0,0,2,5,5,5,7,],
    [1,2,5,6,4,2,4,6,0,1,0,5,2,6,5,6,6,4,6,7,5,2,5,5,1,4,1,7,3,1,6,1,0,0,3,0,1,3,4,6,7,1,7,3,3,7,5,7,],
    [1,0,5,4,2,1,2,5,3,5,7,1,0,3,0,7,4,5,7,5,3,1,6,1,3,7,6,4,1,1,1,4,4,0,7,0,4,7,6,7,7,2,7,4,5,6,7,6,],
    [3,3,7,7,6,3,6,7,1,0,5,0,2,3,2,7,0,3,3,6,4,5,7,2,1,2,4,2,1,6,4,3,1,3,4,6,4,1,6,1,0,5,0,7,7,4,7,6,],
    [1,2,5,6,4,1,4,5,3,7,7,3,3,7,6,7,0,3,3,6,0,2,3,5,7,4,7,7,0,0,3,3,6,3,6,6,3,1,5,1,0,6,2,6,2,0,4,0,],
    [1,2,5,6,2,3,2,7,1,7,5,7,1,3,5,3,0,2,0,5,4,0,7,0,7,4,7,7,2,2,5,2,6,1,6,4,1,5,3,5,3,1,5,1,0,1,2,1,],
    [0,0,4,4,4,1,4,5,7,2,7,6,1,2,5,6,0,5,3,5,0,6,3,6,1,0,4,0,5,1,5,4,6,4,6,7,2,7,4,7,5,0,7,0,1,4,3,2,],
    [0,2,4,6,2,2,2,6,2,2,6,2,0,3,3,0,4,5,7,2,7,3,7,6,0,4,0,7,4,3,7,0,2,7,5,7,1,5,1,7,1,1,3,1,0,0,2,0,],
    [1,0,5,4,2,1,2,5,0,4,4,4,1,3,4,3,4,0,7,3,4,1,7,4,0,4,0,7,4,2,7,5,4,7,7,7,0,1,0,3,3,7,5,5,5,6,7,6,],
    [3,0,7,4,7,1,7,5,3,7,7,7,3,2,7,6,2,0,5,3,1,7,4,4,0,3,3,3,0,6,3,3,3,6,6,6,0,2,2,2,0,7,2,5,6,0,6,2,],
    [2,0,6,4,6,1,6,5,3,0,7,0,1,0,4,3,3,7,6,7,4,6,7,6,0,2,3,5,0,7,3,4,2,7,5,4,7,1,7,3,3,3,5,5,0,5,2,3,],
    [2,3,6,7,4,3,4,7,0,4,4,0,3,2,7,2,0,6,3,3,4,1,7,1,0,7,3,7,7,4,7,7,0,3,3,6,0,0,0,2,6,4,6,6,5,3,5,5,],
    [3,1,7,5,4,2,4,6,0,5,4,5,4,0,7,3,0,2,3,2,2,7,5,7,3,3,6,6,0,6,3,6,7,1,7,4,5,2,7,0,5,4,7,6,0,3,2,3,],
    [1,2,5,6,1,1,1,5,2,2,6,2,0,1,4,1,7,3,7,6,0,7,3,7,4,7,7,7,7,0,7,3,3,3,6,0,6,4,6,6,2,0,4,0,0,3,0,5,],
    [1,2,5,6,1,1,1,5,3,2,7,6,4,0,7,3,0,3,0,6,2,7,5,7,2,0,5,3,3,3,3,6,4,1,7,4,5,0,7,2,4,6,6,4,0,7,2,5,],
    [0,3,4,7,1,1,1,5,3,5,7,1,1,2,5,2,6,4,6,7,2,3,5,6,0,4,3,7,2,0,5,0,3,1,6,1,5,2,7,4,0,5,0,7,7,5,7,7,],
    [0,1,4,5,0,0,0,4,3,7,7,3,6,0,6,3,4,1,4,4,0,6,3,6,4,7,7,7,1,0,4,0,5,0,5,3,5,6,7,6,1,1,3,3,1,3,1,5,],
    [2,1,6,5,4,1,4,5,3,0,7,0,2,5,5,5,0,0,0,3,1,3,1,6,2,7,5,7,2,1,2,4,4,6,7,6,7,3,7,5,5,2,7,2,5,3,7,5,],
    [3,1,7,5,6,0,6,4,1,1,1,5,4,4,7,4,3,5,6,5,2,5,5,2,7,0,7,3,0,0,0,3,0,7,3,7,1,0,3,2,4,6,6,6,4,7,6,7,],
    [0,1,4,5,1,1,1,5,3,3,7,7,4,3,7,3,3,7,6,7,0,0,3,0,4,0,7,0,4,2,7,2,0,6,3,6,2,2,4,0,2,1,4,1,5,4,7,6,],
    [3,3,7,7,6,3,6,7,3,6,7,6,0,5,3,2,1,3,4,0,7,2,7,5,1,6,4,3,1,7,4,7,0,1,0,4,6,0,6,2,5,2,5,4,1,0,1,2,],
    [3,3,7,7,6,3,6,7,0,7,4,7,2,2,6,2,1,2,4,5,7,0,7,3,1,3,4,6,3,1,6,1,0,6,3,6,0,1,2,1,0,0,2,0,0,5,2,5,],
    [2,3,6,7,3,0,3,4,1,1,5,1,2,4,6,4,7,0,7,3,1,3,1,6,0,3,0,6,2,7,5,7,5,0,5,3,6,1,6,3,7,5,7,7,2,6,4,6,],
    [2,2,6,6,5,1,5,5,0,2,4,6,4,5,7,5,0,3,0,6,1,4,4,1,3,7,6,7,3,0,6,0,1,4,1,7,0,0,2,0,6,1,6,3,1,2,3,4,],
    [1,1,5,5,3,1,3,5,3,2,7,2,1,5,4,5,3,6,6,6,7,4,7,7,4,3,7,3,1,7,4,7,0,2,3,5,0,4,0,7,4,0,6,0,1,2,3,0,],
    [2,3,6,7,5,3,5,7,3,6,7,6,4,4,7,1,1,5,4,2,4,0,4,3,0,0,3,0,0,4,0,7,1,7,4,7,3,1,5,1,5,2,7,4,0,1,0,3,],
    [0,1,4,5,4,2,4,6,7,3,7,7,5,3,5,6,0,6,3,6,0,5,3,5,3,0,3,3,0,0,3,3,2,7,5,7,4,1,6,3,4,0,6,2,0,2,0,4,],
    [2,3,6,7,3,0,3,4,2,1,6,1,2,2,5,2,6,2,6,5,2,6,5,3,0,3,0,6,1,7,4,7,7,0,7,3,0,7,2,5,0,2,2,0,7,5,7,7,],
    [3,1,7,5,6,0,6,4,1,1,5,5,3,6,7,6,2,5,5,2,0,3,3,0,1,4,1,7,4,7,7,7,2,3,5,0,1,3,3,5,5,4,7,6,0,0,2,0,],
    [1,0,5,4,3,2,3,6,0,6,4,6,2,2,6,2,3,0,6,0,7,0,7,3,4,4,7,7,1,1,1,4,0,1,0,4,0,5,2,5,4,7,6,7,1,7,3,7,],
    [3,0,7,4,4,1,4,5,3,2,3,6,3,1,7,1,3,7,6,4,1,4,1,7,0,1,0,4,2,2,2,5,4,0,7,0,5,6,7,6,5,7,7,7,0,5,0,7,],
    [1,2,5,6,1,1,1,5,3,7,7,7,0,1,3,1,3,3,6,6,3,0,6,0,0,4,0,7,1,6,4,3,3,2,6,2,6,2,6,5,0,0,2,0,5,1,5,3,],
    [3,1,7,5,6,0,6,4,0,3,4,3,4,4,7,4,1,0,4,0,0,5,3,5,4,7,7,7,3,6,6,6,0,7,3,7,0,1,2,1,5,0,5,2,0,2,2,2,],
    [3,3,7,7,5,3,5,7,2,0,2,4,0,3,3,0,4,0,7,0,7,1,7,4,1,6,4,3,0,7,3,7,6,4,6,7,0,4,0,6,1,0,3,2,3,1,5,1,],
    [2,1,6,5,6,2,6,6,2,5,6,5,4,6,7,6,2,4,5,1,0,0,0,3,0,4,3,1,3,7,6,7,1,0,4,0,5,0,7,0,0,5,2,3,2,6,4,6,],
    [1,2,5,6,2,3,2,7,0,6,4,6,1,3,4,3,4,0,7,3,4,1,7,4,0,2,0,5,4,7,7,7,2,0,2,3,0,0,0,2,5,5,7,5,4,4,6,4,],
    [2,0,6,4,4,2,4,6,0,3,4,7,2,2,5,2,0,4,3,4,7,0,7,3,6,0,6,3,1,3,1,6,7,4,7,7,5,5,5,7,2,3,4,3,0,5,0,7,],
    [0,1,4,5,3,1,3,5,2,4,6,4,1,5,4,5,7,3,7,6,5,0,5,3,3,6,6,6,4,7,7,7,0,4,0,7,4,0,4,3,6,0,6,2,3,7,5,5,],
    [1,2,5,6,5,3,5,7,2,4,6,0,2,7,6,7,1,1,4,4,1,3,1,6,3,0,6,3,0,0,0,3,6,4,6,7,7,0,7,2,1,7,3,5,7,3,7,5,],
    [3,3,7,7,6,2,6,6,3,2,7,2,4,6,7,6,0,3,3,0,1,6,4,3,2,7,5,4,0,4,3,7,0,2,3,5,0,5,0,7,2,2,4,0,5,1,7,1,],
    [3,2,7,6,6,2,6,6,1,0,1,4,5,0,5,3,4,7,7,7,0,2,0,5,1,7,4,4,0,1,3,1,2,5,5,5,4,0,4,2,7,1,7,3,2,4,4,6,],
    [3,1,7,5,6,0,6,4,1,5,5,5,3,4,7,4,0,4,0,7,1,3,4,3,2,7,5,7,2,0,5,0,0,0,0,3,1,0,3,2,5,6,7,6,4,1,6,3,],
    [2,2,6,6,4,2,4,6,3,4,7,4,2,3,5,0,1,4,1,7,0,2,3,5,0,1,3,1,3,7,6,7,1,0,4,0,6,0,6,2,2,5,2,7,5,3,7,3,],
    [1,3,5,7,4,3,4,7,6,1,6,5,3,0,6,0,2,0,2,3,7,4,7,7,7,0,7,3,0,1,3,1,0,3,0,6,1,4,3,6,3,2,5,2,5,4,5,6,],
    [0,1,4,5,3,0,3,4,1,1,5,1,2,2,5,2,4,3,7,6,4,4,7,1,0,5,3,5,3,7,6,4,4,0,7,0,4,7,6,7,0,2,2,4,7,3,7,5,],
    [1,1,5,5,3,1,3,5,2,3,2,7,3,2,7,2,0,0,0,3,4,3,7,3,3,0,6,0,4,6,7,6,2,7,5,7,2,7,4,5,4,1,6,1,1,2,1,4,],
    [0,0,4,4,3,2,3,6,2,3,6,3,0,5,3,5,0,7,3,7,7,4,7,7,2,0,5,0,7,0,7,3,0,1,0,4,1,2,1,4,0,6,2,6,3,1,5,1,],
    [0,2,4,6,1,3,1,7,0,7,4,7,0,3,4,3,4,2,7,2,1,0,4,0,3,4,6,4,7,3,7,6,2,5,5,5,0,1,2,1,5,0,7,2,3,1,5,1,],
    [0,2,4,6,3,1,3,5,6,0,6,4,2,5,6,5,7,2,7,5,0,3,3,0,4,0,4,3,0,7,3,7,5,3,5,6,0,6,2,6,0,0,2,2,4,4,6,6,],
  ];
  static List<List<String>> all_words=[
    ["chief","grade","worth","below","folk","jump","deny","cook","bone","bad","jet","dog",],
    ["quiet","twice","limit","feed","lift","jump","wave","cook","bone","bad","buy","pig",],
    ["dress","grade","limit","below","lift","jump","gift","suit","shoe","wine","buy","pig",],
    ["quiet","grade","limit","feed","lift","warm","deny","suit","shoe","wine","jet","pig",],
    ["dress","grade","broad","below","lift","warm","wave","blow","burn","wine","cat","pig",],
    ["chief","aware","broad","feed","shop","warm","wave","cook","burn","bad","cat","pig",],
    ["quiet","aware","worth","path","shop","warm","deny","suit","shoe","boy","buy","and",],
    ["quiet","aware","broad","feed","lift","jump","gift","suit","bone","boy","buy","dog",],
    ["dress","grade","worth","path","lift","jump","gift","suit","bone","bad","cat","and",],
    ["chief","twice","limit","path","lift","jump","deny","cook","burn","boy","cat","pig",],
    ["dress","aware","limit","feed","lift","jump","gift","suit","bone","boy","jet","pig",],
    ["dress","twice","limit","path","folk","warm","wave","cook","shoe","bad","jet","pig",],
    ["dress","twice","worth","below","lift","warm","wave","suit","bone","boy","cat","dog",],
    ["quiet","aware","limit","feed","shop","warm","wave","cook","bone","bad","jet","and",],
    ["chief","grade","broad","path","lift","soft","wave","cook","burn","bad","cat","pig",],
    ["chief","twice","limit","path","shop","soft","wave","cook","shoe","boy","buy","dog",],
    ["chief","twice","worth","path","lift","jump","gift","blow","bone","boy","jet","pig",],
    ["dress","twice","limit","feed","folk","soft","deny","suit","bone","bad","cat","and",],
    ["quiet","aware","worth","below","folk","warm","gift","cook","shoe","boy","jet","and",],
    ["dress","twice","worth","feed","shop","soft","deny","cook","shoe","wine","buy","and",],
    ["quiet","twice","limit","path","shop","jump","gift","suit","shoe","boy","cat","dog",],
    ["quiet","grade","limit","below","lift","soft","wave","suit","bone","wine","buy","dog",],
    ["chief","twice","broad","path","lift","jump","wave","suit","burn","bad","jet","pig",],
    ["quiet","aware","limit","feed","shop","soft","wave","suit","shoe","wine","cat","pig",],
    ["quiet","grade","broad","feed","shop","warm","deny","cook","shoe","bad","buy","and",],
    ["quiet","grade","broad","path","lift","soft","gift","cook","shoe","bad","cat","dog",],
    ["chief","aware","broad","path","shop","warm","gift","suit","shoe","boy","jet","pig",],
    ["quiet","grade","broad","below","shop","warm","deny","suit","shoe","boy","cat","dog",],
    ["chief","aware","broad","feed","lift","jump","wave","suit","bone","boy","cat","pig",],
    ["quiet","aware","worth","below","folk","warm","deny","suit","shoe","boy","cat","dog",],
    ["quiet","aware","worth","path","shop","warm","deny","cook","shoe","bad","cat","pig",],
    ["chief","twice","worth","below","lift","jump","wave","blow","burn","bad","cat","pig",],
    ["quiet","aware","worth","below","folk","warm","gift","suit","shoe","boy","cat","dog",],
    ["dress","grade","worth","feed","folk","soft","wave","blow","bone","bad","buy","and",],
    ["chief","grade","broad","below","lift","warm","deny","blow","burn","wine","buy","and",],
    ["quiet","aware","broad","path","folk","soft","deny","suit","burn","bad","buy","dog",],
    ["dress","grade","worth","feed","shop","warm","deny","cook","burn","boy","buy","dog",],
    ["chief","twice","limit","path","shop","jump","gift","blow","shoe","bad","jet","dog",],
    ["quiet","grade","limit","path","shop","warm","wave","suit","bone","boy","cat","pig",],
    ["quiet","twice","worth","feed","shop","soft","deny","cook","bone","boy","buy","pig",],
    ["quiet","grade","worth","below","shop","warm","wave","blow","burn","bad","jet","and",],
    ["dress","aware","worth","path","lift","jump","gift","suit","bone","bad","jet","pig",],
    ["chief","aware","worth","feed","lift","jump","wave","cook","burn","boy","buy","and",],
    ["quiet","aware","worth","below","lift","warm","gift","suit","bone","boy","cat","pig",],
    ["chief","aware","broad","feed","folk","warm","gift","suit","shoe","wine","jet","and",],
    ["chief","aware","broad","below","folk","warm","gift","blow","shoe","boy","cat","and",],
    ["quiet","aware","worth","feed","folk","warm","wave","cook","shoe","bad","cat","pig",],
    ["dress","twice","limit","feed","shop","soft","gift","suit","bone","bad","jet","dog",],
    ["quiet","twice","limit","feed","folk","soft","wave","suit","burn","bad","cat","dog",],
    ["chief","twice","limit","below","folk","jump","deny","cook","burn","boy","buy","and",],
    ["quiet","grade","limit","below","lift","warm","wave","suit","shoe","boy","jet","dog",],
    ["quiet","grade","worth","below","lift","soft","wave","blow","burn","bad","jet","and",],
    ["quiet","grade","broad","feed","shop","soft","deny","cook","bone","bad","buy","pig",],
    ["quiet","grade","worth","feed","shop","soft","deny","suit","bone","wine","cat","dog",],
    ["chief","twice","worth","feed","lift","soft","deny","blow","bone","boy","cat","dog",],
    ["chief","twice","limit","path","lift","jump","gift","suit","shoe","wine","jet","pig",],
    ["quiet","grade","broad","path","folk","jump","deny","blow","shoe","bad","cat","dog",],
    ["quiet","aware","broad","feed","folk","soft","deny","cook","bone","bad","cat","pig",],
    ["chief","grade","broad","feed","shop","jump","gift","blow","shoe","boy","jet","and",],
    ["dress","aware","limit","path","shop","soft","wave","cook","burn","wine","cat","dog",],
    ["chief","grade","broad","below","lift","jump","wave","blow","shoe","bad","buy","and",],
    ["chief","grade","worth","path","folk","jump","deny","suit","shoe","boy","buy","dog",],
    ["quiet","twice","broad","feed","folk","warm","gift","cook","burn","bad","jet","and",],
    ["chief","grade","broad","below","folk","jump","wave","suit","bone","wine","cat","and",],
    ["quiet","aware","broad","feed","folk","warm","gift","suit","shoe","boy","cat","pig",],
    ["quiet","twice","broad","feed","shop","jump","gift","suit","burn","wine","buy","and",],
    ["quiet","twice","worth","feed","lift","warm","wave","blow","burn","bad","cat","pig",],
    ["chief","aware","worth","path","lift","warm","deny","cook","shoe","bad","jet","pig",],
    ["quiet","grade","worth","below","lift","soft","wave","suit","shoe","boy","jet","dog",],
    ["chief","twice","limit","below","lift","warm","gift","blow","burn","wine","cat","dog",],
    ["dress","aware","broad","path","folk","soft","deny","blow","shoe","bad","jet","and",],
    ["chief","grade","worth","below","shop","soft","deny","suit","shoe","bad","jet","dog",],
    ["chief","grade","worth","path","shop","soft","wave","suit","bone","bad","cat","and",],
    ["quiet","grade","limit","below","lift","warm","gift","cook","burn","boy","buy","dog",],
    ["chief","twice","worth","below","lift","soft","wave","blow","shoe","wine","cat","and",],
    ["dress","twice","limit","below","folk","soft","deny","suit","burn","bad","jet","pig",],
    ["dress","grade","broad","feed","shop","soft","gift","blow","bone","bad","jet","pig",],
    ["chief","aware","broad","path","lift","warm","gift","blow","burn","bad","buy","and",],
    ["chief","aware","broad","below","lift","warm","deny","blow","bone","wine","cat","pig",],
    ["chief","grade","limit","feed","lift","warm","gift","blow","burn","bad","buy","dog",],
    ["quiet","aware","limit","below","lift","warm","deny","suit","shoe","bad","jet","and",],
    ["quiet","aware","broad","feed","shop","soft","gift","suit","bone","wine","cat","pig",],
    ["chief","grade","limit","feed","lift","soft","gift","suit","bone","bad","jet","dog",],
    ["dress","aware","worth","path","lift","warm","wave","blow","bone","boy","jet","pig",],
    ["dress","aware","broad","path","lift","soft","gift","suit","shoe","bad","cat","dog",],
    ["dress","twice","limit","feed","folk","jump","gift","cook","shoe","wine","buy","and",],
    ["dress","grade","broad","feed","shop","soft","gift","suit","bone","bad","buy","and",],
    ["quiet","twice","broad","below","shop","soft","wave","cook","shoe","bad","cat","dog",],
    ["dress","twice","limit","feed","folk","jump","deny","suit","burn","wine","cat","and",],
    ["quiet","grade","broad","below","shop","warm","deny","cook","burn","bad","buy","and",],
    ["quiet","twice","worth","below","shop","jump","wave","suit","bone","boy","cat","pig",],
    ["quiet","aware","limit","path","lift","soft","wave","cook","shoe","boy","cat","dog",],
    ["dress","aware","worth","path","folk","warm","gift","cook","burn","bad","jet","pig",],
    ["dress","twice","limit","path","folk","jump","wave","blow","shoe","boy","jet","pig",],
    ["dress","grade","limit","feed","lift","jump","gift","cook","burn","bad","buy","and",],
    ["quiet","twice","limit","path","lift","warm","gift","suit","shoe","boy","buy","and",],
    ["quiet","twice","worth","below","folk","jump","deny","suit","shoe","boy","buy","and",],
    ["chief","aware","broad","path","lift","warm","gift","blow","shoe","bad","jet","pig",],
    ["dress","aware","broad","feed","folk","jump","deny","suit","bone","bad","cat","dog",],
    ["chief","twice","limit","feed","lift","jump","gift","cook","burn","bad","jet","dog",],
    ["dress","grade","limit","below","folk","soft","wave","suit","bone","bad","buy","and",],
    ["quiet","twice","limit","below","folk","soft","gift","suit","bone","boy","cat","pig",],
    ["dress","twice","limit","below","lift","warm","gift","suit","burn","boy","cat","pig",],
    ["quiet","aware","broad","path","shop","soft","gift","cook","burn","bad","cat","and",],
    ["quiet","aware","broad","path","shop","jump","deny","cook","burn","wine","buy","pig",],
    ["chief","grade","worth","below","folk","jump","deny","suit","shoe","boy","buy","and",],
    ["dress","aware","broad","below","shop","warm","deny","cook","burn","bad","jet","dog",],
    ["chief","grade","worth","feed","shop","jump","gift","cook","burn","wine","jet","pig",],
    ["dress","grade","broad","feed","shop","warm","wave","suit","shoe","bad","cat","pig",],
    ["quiet","aware","broad","below","shop","soft","wave","suit","burn","bad","cat","dog",],
    ["quiet","aware","limit","path","lift","soft","deny","cook","shoe","boy","jet","and",],
    ["dress","aware","broad","feed","lift","jump","deny","suit","shoe","boy","buy","dog",],
    ["chief","grade","broad","feed","lift","warm","wave","blow","burn","boy","jet","pig",],
    ["chief","twice","broad","path","lift","soft","wave","cook","burn","boy","buy","pig",],
    ["quiet","aware","broad","feed","shop","warm","gift","suit","burn","boy","buy","and",],
    ["chief","grade","broad","below","shop","soft","deny","suit","bone","boy","buy","and",],
    ["quiet","twice","worth","feed","lift","warm","wave","blow","shoe","wine","cat","and",],
    ["chief","twice","worth","path","folk","warm","wave","blow","burn","bad","jet","and",],
    ["quiet","grade","worth","path","lift","jump","deny","suit","burn","boy","cat","dog",],
    ["chief","twice","broad","path","folk","jump","deny","cook","bone","wine","buy","dog",],
    ["dress","aware","broad","feed","shop","soft","deny","suit","bone","bad","cat","and",],
    ["dress","grade","worth","feed","folk","soft","wave","blow","burn","bad","cat","and",],
    ["dress","aware","worth","path","shop","soft","wave","cook","bone","bad","buy","dog",],
    ["quiet","grade","broad","path","lift","warm","gift","cook","burn","bad","buy","and",],
    ["quiet","aware","broad","feed","shop","warm","deny","suit","shoe","boy","jet","dog",],
    ["chief","grade","worth","path","lift","warm","wave","blow","bone","boy","buy","and",],
    ["dress","twice","worth","below","folk","jump","wave","blow","shoe","wine","buy","and",],
    ["chief","grade","worth","path","folk","warm","deny","suit","shoe","boy","buy","and",],
    ["quiet","grade","broad","below","shop","jump","wave","cook","shoe","bad","jet","pig",],
    ["dress","grade","limit","path","shop","soft","wave","suit","shoe","boy","cat","and",],
    ["chief","twice","worth","path","folk","soft","wave","cook","burn","bad","jet","dog",],
    ["quiet","twice","limit","path","lift","jump","gift","blow","burn","wine","jet","and",],
    ["dress","aware","broad","path","folk","soft","wave","blow","shoe","bad","cat","pig",],
    ["quiet","grade","broad","feed","lift","soft","deny","blow","bone","boy","jet","pig",],
    ["quiet","grade","worth","path","shop","jump","wave","suit","bone","wine","jet","and",],
    ["quiet","grade","broad","path","lift","warm","deny","cook","bone","boy","cat","and",],
    ["quiet","grade","limit","path","folk","jump","deny","cook","bone","boy","cat","pig",],
    ["chief","grade","worth","feed","folk","soft","gift","cook","burn","bad","jet","dog",],
    ["dress","aware","limit","feed","folk","soft","wave","cook","shoe","bad","cat","dog",],
    ["quiet","aware","broad","below","shop","jump","gift","blow","burn","boy","jet","and",],
    ["dress","aware","broad","feed","lift","warm","wave","blow","bone","bad","buy","dog",],
    ["dress","grade","worth","below","shop","soft","deny","blow","shoe","boy","cat","and",],
    ["dress","twice","worth","feed","shop","warm","gift","suit","bone","boy","cat","and",],
    ["chief","grade","broad","path","lift","soft","deny","cook","bone","boy","buy","dog",],
    ["dress","grade","worth","feed","folk","soft","gift","suit","bone","bad","cat","and",],
    ["quiet","grade","broad","path","lift","warm","wave","suit","shoe","wine","buy","and",],
    ["dress","twice","worth","below","folk","jump","gift","suit","bone","boy","jet","pig",],
    ["dress","aware","limit","path","lift","soft","gift","cook","bone","boy","jet","dog",],
    ["quiet","twice","broad","path","folk","warm","gift","suit","shoe","boy","cat","dog",],
    ["quiet","aware","limit","feed","folk","soft","deny","blow","burn","bad","buy","pig",],
    ["chief","twice","worth","feed","folk","jump","gift","cook","shoe","boy","cat","dog",],
    ["quiet","twice","limit","below","shop","jump","wave","suit","shoe","bad","jet","pig",],
    ["chief","grade","worth","feed","folk","warm","deny","cook","burn","bad","jet","and",],
    ["dress","twice","limit","feed","folk","warm","gift","suit","bone","bad","cat","dog",],
    ["chief","grade","worth","feed","lift","jump","wave","blow","bone","boy","buy","pig",],
    ["dress","aware","worth","feed","lift","soft","deny","blow","shoe","bad","cat","pig",],
    ["dress","grade","broad","feed","folk","warm","deny","suit","burn","wine","buy","pig",],
    ["dress","twice","limit","feed","folk","soft","deny","blow","bone","bad","jet","dog",],
    ["quiet","grade","limit","below","lift","jump","wave","cook","burn","boy","jet","and",],
    ["dress","aware","broad","below","lift","jump","wave","cook","shoe","boy","buy","dog",],
    ["dress","grade","worth","feed","folk","jump","gift","suit","shoe","wine","cat","dog",],
    ["quiet","aware","broad","path","folk","warm","deny","suit","shoe","bad","jet","and",],
    ["quiet","twice","limit","below","folk","jump","gift","suit","bone","bad","buy","and",],
    ["dress","aware","broad","path","lift","jump","wave","cook","burn","boy","jet","and",],
    ["dress","aware","broad","path","lift","warm","deny","suit","bone","boy","jet","and",],
    ["dress","aware","limit","path","lift","jump","deny","suit","burn","bad","jet","and",],
    ["chief","aware","worth","below","folk","warm","deny","suit","bone","bad","cat","pig",],
    ["quiet","grade","worth","below","folk","soft","wave","suit","bone","wine","jet","and",],
    ["quiet","twice","worth","below","folk","jump","gift","cook","burn","boy","buy","pig",],
    ["quiet","grade","worth","feed","shop","warm","wave","suit","bone","bad","jet","pig",],
    ["quiet","aware","worth","below","lift","soft","wave","suit","burn","boy","jet","pig",],
    ["dress","twice","limit","feed","shop","jump","deny","cook","shoe","boy","jet","dog",],
    ["chief","grade","worth","path","folk","jump","deny","cook","burn","boy","cat","and",],
    ["chief","grade","worth","path","lift","jump","gift","blow","bone","bad","buy","and",],
    ["chief","aware","limit","feed","lift","warm","deny","suit","bone","bad","jet","pig",],
    ["chief","aware","broad","feed","folk","warm","gift","blow","burn","boy","buy","pig",],
    ["chief","grade","broad","feed","shop","jump","wave","cook","shoe","boy","cat","pig",],
    ["chief","twice","broad","feed","shop","jump","wave","suit","bone","boy","cat","pig",],
    ["quiet","grade","limit","feed","lift","warm","gift","suit","bone","boy","jet","dog",],
    ["chief","twice","worth","below","folk","soft","gift","suit","bone","bad","jet","dog",],
    ["dress","grade","broad","path","lift","jump","deny","cook","shoe","boy","cat","pig",],
    ["chief","grade","worth","path","shop","jump","gift","cook","bone","bad","jet","dog",],
    ["chief","aware","broad","below","shop","jump","gift","cook","shoe","bad","jet","and",],
    ["dress","twice","limit","path","folk","soft","deny","blow","bone","bad","cat","pig",],
    ["chief","twice","broad","below","folk","jump","wave","suit","burn","boy","buy","pig",],
    ["dress","aware","broad","path","folk","jump","gift","blow","shoe","bad","jet","and",],
    ["dress","aware","broad","below","folk","jump","gift","blow","bone","boy","jet","pig",],
    ["quiet","twice","limit","below","lift","soft","deny","suit","bone","boy","cat","pig",],
    ["chief","aware","broad","below","lift","warm","gift","blow","burn","bad","cat","pig",],
    ["dress","grade","limit","feed","shop","warm","deny","blow","shoe","bad","cat","pig",],
    ["quiet","aware","worth","feed","folk","jump","gift","blow","burn","boy","buy","dog",],
    ["quiet","twice","limit","path","shop","warm","wave","blow","shoe","boy","jet","dog",],
    ["dress","twice","worth","feed","lift","jump","gift","blow","burn","bad","jet","pig",],
    ["quiet","twice","limit","feed","folk","jump","deny","suit","bone","wine","jet","dog",],
    ["chief","twice","limit","below","folk","jump","deny","cook","bone","boy","jet","and",],
    ["chief","twice","limit","below","shop","soft","deny","cook","shoe","boy","jet","dog",],
    ["dress","twice","worth","below","shop","warm","wave","suit","shoe","boy","buy","dog",],
    ["dress","aware","broad","feed","shop","soft","wave","suit","shoe","bad","buy","dog",],
    ["dress","twice","limit","below","folk","jump","deny","blow","shoe","boy","jet","dog",],
    ["chief","grade","worth","below","shop","jump","deny","cook","bone","bad","cat","pig",],
    ["chief","grade","broad","below","shop","jump","gift","blow","bone","boy","jet","pig",],
    ["dress","twice","limit","feed","shop","soft","deny","cook","shoe","boy","buy","and",],
    ["dress","aware","worth","path","lift","soft","deny","blow","bone","bad","buy","dog",],
    ["dress","grade","broad","path","shop","warm","deny","blow","bone","bad","jet","dog",],
    ["dress","aware","broad","path","lift","jump","gift","suit","burn","bad","jet","dog",],
    ["dress","aware","worth","path","folk","jump","wave","blow","burn","wine","cat","pig",],
    ["quiet","twice","broad","feed","folk","jump","deny","cook","burn","boy","jet","dog",],
    ["chief","twice","worth","below","lift","jump","wave","cook","burn","bad","cat","pig",],
    ["dress","grade","worth","below","shop","soft","deny","suit","shoe","wine","cat","dog",],
    ["chief","grade","broad","path","shop","soft","gift","cook","burn","bad","cat","dog",],
    ["quiet","twice","limit","feed","shop","jump","gift","blow","shoe","wine","buy","pig",],
    ["chief","twice","worth","path","shop","warm","deny","blow","shoe","wine","cat","pig",],
    ["chief","twice","broad","below","lift","soft","deny","blow","bone","boy","cat","pig",],
    ["dress","aware","broad","path","folk","warm","wave","cook","bone","bad","jet","and",],
    ["dress","twice","limit","path","lift","jump","wave","blow","burn","boy","buy","dog",],
    ["quiet","aware","worth","path","shop","warm","deny","cook","bone","wine","buy","and",],
    ["chief","twice","limit","path","folk","warm","wave","suit","shoe","bad","jet","and",],
    ["chief","grade","worth","path","shop","soft","deny","suit","bone","bad","buy","dog",],
    ["chief","twice","limit","feed","lift","soft","wave","blow","burn","boy","cat","dog",],
    ["dress","aware","broad","path","lift","jump","deny","suit","shoe","wine","cat","and",],
    ["dress","grade","broad","feed","folk","jump","deny","suit","shoe","boy","cat","and",],
    ["quiet","aware","broad","below","lift","jump","wave","cook","bone","boy","cat","pig",],
    ["dress","aware","limit","feed","lift","soft","wave","cook","burn","bad","jet","and",],
    ["quiet","grade","worth","feed","folk","soft","deny","blow","shoe","boy","buy","and",],
    ["dress","twice","worth","feed","folk","jump","gift","cook","bone","bad","cat","pig",],
    ["dress","aware","broad","feed","lift","warm","deny","blow","shoe","boy","jet","pig",],
    ["quiet","grade","broad","path","shop","soft","deny","suit","shoe","bad","jet","dog",],
    ["dress","twice","limit","feed","lift","warm","wave","suit","shoe","boy","buy","pig",],
    ["chief","aware","limit","feed","lift","warm","gift","suit","burn","bad","buy","and",],
    ["quiet","aware","worth","below","shop","soft","deny","cook","burn","boy","cat","pig",],
    ["quiet","grade","limit","feed","folk","soft","deny","suit","burn","wine","buy","and",],
    ["dress","aware","broad","below","folk","jump","deny","blow","burn","bad","jet","and",],
    ["quiet","aware","limit","below","shop","warm","deny","blow","burn","boy","jet","and",],
    ["chief","aware","broad","path","shop","jump","gift","cook","shoe","bad","buy","and",],
    ["quiet","twice","worth","path","folk","jump","deny","blow","bone","bad","jet","dog",],
    ["quiet","aware","worth","feed","lift","jump","gift","blow","shoe","boy","jet","dog",],
    ["dress","aware","broad","path","shop","warm","gift","suit","shoe","bad","buy","and",],
    ["quiet","grade","worth","below","shop","warm","deny","blow","bone","bad","buy","dog",],
    ["dress","grade","broad","feed","folk","jump","wave","blow","shoe","bad","jet","pig",],
    ["chief","aware","worth","below","shop","soft","deny","blow","shoe","boy","buy","dog",],
    ["chief","grade","broad","below","folk","soft","gift","blow","bone","boy","cat","and",],
    ["dress","aware","worth","path","lift","warm","wave","suit","burn","bad","jet","pig",],
    ["quiet","grade","worth","path","lift","soft","wave","cook","bone","boy","buy","pig",],
    ["chief","grade","worth","feed","folk","warm","wave","cook","shoe","wine","buy","dog",],
    ["chief","aware","broad","path","shop","soft","deny","cook","shoe","bad","buy","pig",],
    ["dress","grade","broad","feed","lift","warm","gift","cook","shoe","bad","buy","dog",],
    ["dress","aware","limit","below","shop","jump","deny","suit","burn","wine","cat","and",],
    ["dress","aware","broad","path","folk","warm","wave","blow","shoe","wine","buy","and",],
    ["dress","twice","worth","path","shop","warm","wave","blow","shoe","boy","cat","dog",],
    ["dress","grade","limit","path","shop","warm","deny","suit","shoe","boy","jet","pig",],
    ["quiet","aware","limit","feed","folk","jump","wave","suit","burn","wine","buy","pig",],
    ["dress","grade","broad","below","shop","jump","wave","cook","bone","bad","jet","and",],
    ["chief","grade","limit","feed","folk","jump","wave","blow","burn","bad","jet","and",],
    ["dress","aware","broad","path","lift","jump","wave","cook","shoe","bad","cat","dog",],
    ["chief","grade","broad","below","lift","warm","wave","blow","shoe","boy","buy","dog",],
    ["quiet","grade","worth","below","shop","soft","deny","suit","bone","bad","jet","dog",],
    ["chief","twice","broad","below","shop","warm","deny","blow","shoe","boy","buy","dog",],
    ["chief","grade","broad","path","folk","jump","gift","blow","bone","bad","jet","pig",],
    ["dress","twice","limit","feed","folk","soft","wave","suit","burn","bad","cat","and",],
    ["chief","grade","broad","below","folk","jump","wave","cook","bone","boy","cat","and",],
    ["dress","aware","broad","path","shop","warm","wave","cook","shoe","wine","buy","and",],
    ["chief","aware","broad","feed","folk","soft","wave","blow","shoe","wine","jet","dog",],
    ["dress","aware","worth","path","folk","jump","deny","cook","bone","bad","buy","pig",],
    ["dress","twice","limit","below","shop","soft","wave","suit","burn","bad","jet","pig",],
    ["quiet","twice","worth","path","lift","warm","gift","blow","burn","bad","cat","and",],
    ["chief","aware","broad","feed","shop","soft","deny","suit","bone","boy","cat","and",],
    ["chief","aware","worth","feed","lift","soft","wave","blow","shoe","bad","cat","dog",],
    ["dress","grade","broad","feed","shop","warm","wave","suit","burn","boy","buy","pig",],
    ["chief","aware","broad","path","shop","warm","gift","cook","burn","boy","buy","pig",],
    ["chief","grade","worth","path","lift","warm","wave","suit","burn","bad","cat","pig",],
    ["chief","twice","limit","path","shop","jump","gift","cook","bone","bad","jet","and",],
    ["dress","grade","broad","below","shop","soft","gift","suit","shoe","bad","jet","dog",],
    ["quiet","grade","worth","below","folk","warm","gift","suit","shoe","boy","jet","dog",],
    ["dress","grade","broad","below","shop","warm","wave","cook","bone","boy","jet","dog",],
    ["quiet","twice","worth","feed","folk","jump","wave","cook","shoe","wine","cat","dog",],
    ["chief","twice","worth","feed","folk","soft","gift","suit","burn","bad","buy","pig",],
    ["chief","twice","worth","feed","shop","soft","wave","blow","bone","boy","jet","dog",],
    ["quiet","aware","broad","path","lift","soft","gift","blow","bone","boy","buy","and",],
    ["dress","aware","broad","below","shop","warm","deny","suit","burn","bad","jet","dog",],
    ["quiet","twice","broad","path","folk","jump","wave","cook","shoe","boy","buy","and",],
    ["dress","aware","limit","feed","shop","soft","wave","suit","shoe","bad","buy","pig",],
    ["quiet","twice","worth","below","lift","warm","gift","blow","shoe","wine","cat","dog",],
    ["dress","twice","limit","feed","folk","warm","gift","blow","shoe","bad","jet","pig",],
    ["chief","grade","broad","path","lift","warm","deny","cook","bone","boy","cat","and",],
    ["dress","aware","broad","below","folk","jump","wave","cook","shoe","boy","buy","and",],
    ["quiet","twice","limit","below","shop","jump","wave","blow","bone","bad","buy","pig",],
    ["quiet","grade","worth","below","folk","warm","wave","blow","bone","boy","buy","dog",],
    ["chief","grade","worth","feed","folk","soft","wave","blow","bone","bad","buy","and",],
    ["chief","twice","limit","below","shop","warm","deny","cook","shoe","bad","jet","pig",],
    ["dress","aware","broad","path","folk","soft","deny","cook","bone","wine","cat","pig",],
    ["quiet","aware","broad","path","lift","jump","gift","suit","shoe","boy","buy","pig",],
    ["quiet","aware","limit","below","folk","warm","deny","suit","burn","boy","jet","and",],
    ["dress","aware","worth","path","lift","warm","wave","blow","bone","bad","jet","and",],
    ["chief","grade","worth","path","shop","jump","gift","blow","bone","wine","jet","pig",],
    ["dress","aware","worth","below","shop","warm","wave","suit","shoe","boy","jet","and",],
    ["quiet","aware","broad","below","folk","soft","gift","suit","bone","boy","cat","and",],
    ["quiet","grade","broad","path","lift","soft","wave","blow","bone","wine","buy","and",],
    ["quiet","aware","broad","feed","shop","soft","wave","suit","burn","boy","jet","dog",],
    ["quiet","aware","worth","path","folk","soft","wave","suit","bone","boy","buy","and",],
    ["quiet","twice","limit","feed","folk","jump","deny","blow","burn","bad","jet","dog",],
    ["chief","aware","broad","path","shop","jump","wave","suit","burn","bad","jet","pig",],
    ["dress","grade","broad","below","shop","soft","wave","blow","shoe","boy","cat","dog",],
    ["dress","twice","worth","feed","lift","soft","wave","suit","bone","wine","jet","pig",],
    ["chief","twice","worth","below","lift","warm","gift","blow","burn","bad","cat","pig",],
    ["chief","grade","broad","below","lift","soft","wave","cook","shoe","bad","cat","and",],
    ["quiet","twice","limit","path","lift","jump","gift","suit","bone","wine","jet","pig",],
    ["dress","grade","limit","feed","lift","warm","wave","suit","burn","boy","jet","and",],
    ["quiet","twice","limit","path","folk","warm","wave","blow","shoe","boy","buy","pig",],
    ["chief","grade","broad","path","shop","soft","gift","suit","burn","bad","cat","pig",],
    ["chief","grade","worth","feed","lift","jump","wave","suit","bone","wine","jet","dog",],
    ["quiet","aware","limit","path","lift","warm","gift","suit","bone","wine","jet","pig",],
    ["chief","grade","limit","feed","shop","soft","deny","suit","shoe","boy","buy","pig",],
    ["chief","grade","broad","below","shop","warm","wave","suit","burn","bad","jet","and",],
    ["quiet","twice","worth","path","shop","warm","wave","cook","bone","boy","jet","pig",],
    ["dress","twice","limit","feed","lift","soft","gift","suit","burn","boy","jet","pig",],
    ["chief","twice","broad","below","folk","jump","wave","cook","bone","boy","jet","pig",],
    ["chief","twice","limit","feed","lift","jump","deny","blow","bone","bad","buy","and",],
    ["dress","grade","broad","below","folk","jump","wave","cook","bone","bad","buy","and",],
    ["chief","twice","limit","path","folk","warm","deny","suit","shoe","wine","cat","and",],
    ["chief","aware","worth","path","lift","jump","deny","cook","burn","bad","cat","and",],
    ["chief","aware","broad","path","folk","jump","gift","blow","burn","boy","buy","pig",],
    ["dress","grade","worth","path","folk","soft","wave","suit","shoe","wine","buy","and",],
    ["dress","twice","limit","below","folk","jump","wave","blow","bone","boy","cat","and",],
    ["dress","twice","broad","feed","shop","soft","deny","suit","bone","boy","buy","and",],
    ["dress","aware","broad","below","folk","warm","deny","suit","shoe","bad","buy","and",],
    ["dress","aware","worth","feed","shop","warm","gift","cook","bone","bad","buy","dog",],
    ["quiet","twice","limit","path","shop","soft","deny","blow","bone","bad","buy","dog",],
    ["quiet","aware","broad","feed","lift","soft","gift","blow","burn","wine","buy","and",],
    ["quiet","grade","broad","path","folk","jump","gift","blow","shoe","boy","cat","dog",],
    ["quiet","twice","limit","path","lift","soft","gift","cook","bone","boy","buy","dog",],
    ["quiet","twice","worth","path","shop","warm","wave","blow","shoe","bad","jet","and",],
    ["dress","grade","broad","feed","lift","soft","gift","blow","burn","boy","buy","and",],
    ["chief","aware","broad","below","folk","soft","wave","cook","bone","boy","cat","pig",],
    ["dress","grade","broad","below","shop","warm","wave","suit","bone","boy","buy","dog",],
    ["dress","aware","broad","feed","shop","jump","deny","suit","shoe","wine","jet","dog",],
    ["quiet","twice","broad","below","shop","soft","deny","blow","shoe","boy","jet","dog",],
    ["quiet","twice","limit","below","lift","warm","wave","blow","shoe","wine","cat","dog",],
    ["quiet","grade","broad","feed","folk","warm","deny","cook","shoe","bad","cat","dog",],
    ["dress","twice","limit","below","lift","warm","wave","blow","burn","wine","jet","and",],
    ["dress","grade","worth","feed","folk","jump","gift","blow","shoe","bad","jet","and",],
    ["chief","aware","worth","path","lift","soft","wave","suit","bone","boy","buy","and",],
    ["quiet","twice","limit","feed","lift","warm","wave","cook","burn","bad","jet","and",],
    ["chief","aware","broad","path","lift","soft","gift","blow","bone","boy","cat","pig",],
    ["quiet","aware","limit","feed","folk","soft","gift","suit","bone","bad","jet","dog",],
    ["chief","grade","broad","feed","lift","soft","deny","cook","burn","bad","jet","and",],
    ["dress","twice","limit","feed","folk","warm","deny","blow","bone","bad","buy","and",],
    ["chief","aware","worth","path","lift","warm","wave","blow","burn","wine","jet","dog",],
    ["chief","aware","broad","path","lift","soft","deny","suit","shoe","boy","cat","dog",],
    ["chief","grade","worth","feed","folk","soft","gift","cook","bone","bad","cat","and",],
    ["dress","aware","worth","below","shop","jump","gift","blow","burn","bad","jet","pig",],
    ["quiet","grade","worth","feed","lift","warm","wave","blow","bone","boy","cat","and",],
    ["quiet","twice","limit","feed","lift","jump","wave","cook","shoe","boy","cat","and",],
    ["quiet","twice","worth","feed","lift","jump","wave","blow","burn","bad","jet","pig",],
    ["dress","aware","broad","path","shop","warm","deny","cook","burn","boy","cat","and",],
    ["dress","grade","worth","path","folk","soft","wave","blow","bone","bad","jet","and",],
    ["chief","grade","worth","path","shop","jump","deny","cook","burn","wine","jet","dog",],
    ["dress","aware","limit","path","lift","jump","deny","blow","burn","wine","cat","and",],
    ["quiet","grade","worth","below","folk","soft","wave","blow","burn","boy","buy","dog",],
    ["chief","grade","broad","below","lift","jump","gift","cook","shoe","bad","buy","and",],
    ["chief","aware","broad","below","lift","warm","wave","cook","bone","bad","jet","dog",],
    ["chief","twice","broad","feed","folk","warm","deny","blow","burn","bad","cat","dog",],
    ["quiet","twice","broad","below","lift","warm","deny","blow","burn","wine","jet","dog",],
    ["dress","aware","worth","path","lift","soft","deny","cook","shoe","boy","buy","and",],
    ["quiet","grade","broad","below","folk","warm","gift","cook","bone","boy","buy","pig",],
    ["dress","twice","limit","feed","lift","jump","deny","suit","shoe","wine","jet","pig",],
    ["dress","grade","worth","feed","lift","soft","gift","blow","bone","wine","cat","pig",],
    ["quiet","aware","worth","below","lift","soft","gift","blow","shoe","bad","jet","dog",],
    ["dress","aware","broad","path","shop","jump","wave","suit","bone","wine","cat","pig",],
    ["quiet","grade","broad","below","folk","warm","wave","blow","bone","wine","buy","dog",],
    ["quiet","aware","limit","below","lift","soft","gift","suit","burn","bad","cat","pig",],
    ["quiet","twice","limit","feed","folk","warm","deny","cook","burn","bad","cat","dog",],
    ["dress","aware","limit","path","lift","jump","deny","cook","burn","wine","cat","and",],
    ["quiet","grade","worth","below","folk","soft","gift","cook","burn","boy","cat","pig",],
    ["quiet","grade","worth","below","lift","jump","gift","blow","burn","wine","buy","pig",],
    ["dress","aware","broad","feed","folk","warm","deny","cook","bone","bad","jet","dog",],
    ["dress","grade","worth","feed","shop","warm","gift","suit","shoe","wine","jet","dog",],
    ["quiet","aware","worth","path","folk","warm","wave","suit","bone","boy","buy","pig",],
    ["dress","grade","broad","below","lift","jump","deny","suit","bone","boy","jet","and",],
    ["quiet","twice","limit","below","folk","soft","deny","cook","burn","wine","buy","and",],
    ["chief","aware","limit","feed","shop","jump","gift","cook","bone","boy","jet","pig",],
    ["quiet","aware","worth","path","lift","jump","gift","blow","burn","bad","buy","dog",],
    ["dress","twice","worth","feed","lift","warm","wave","blow","shoe","boy","buy","dog",],
    ["quiet","grade","worth","below","lift","soft","deny","blow","bone","bad","buy","and",],
    ["dress","aware","limit","feed","lift","jump","gift","suit","burn","wine","cat","dog",],
    ["dress","twice","limit","below","folk","jump","wave","blow","shoe","boy","buy","dog",],
    ["dress","aware","broad","path","folk","warm","deny","suit","bone","wine","jet","dog",],
    ["quiet","twice","limit","below","shop","warm","gift","suit","shoe","wine","jet","and",],
    ["quiet","grade","broad","path","shop","soft","wave","blow","shoe","bad","cat","and",],
    ["dress","twice","limit","below","shop","soft","gift","blow","bone","bad","cat","dog",],
    ["chief","grade","worth","path","lift","soft","wave","blow","bone","boy","buy","and",],
    ["quiet","twice","limit","feed","lift","warm","gift","blow","bone","bad","cat","pig",],
    ["dress","aware","worth","path","lift","jump","gift","blow","shoe","bad","jet","pig",],
    ["chief","aware","broad","below","shop","warm","deny","cook","burn","bad","cat","dog",],
    ["dress","grade","worth","feed","folk","soft","deny","suit","bone","bad","cat","and",],
    ["chief","aware","broad","feed","lift","soft","gift","cook","bone","wine","buy","pig",],
    ["quiet","aware","broad","feed","shop","soft","deny","blow","shoe","boy","cat","and",],
    ["chief","aware","limit","below","shop","soft","gift","blow","burn","bad","cat","pig",],
    ["chief","aware","broad","below","lift","warm","deny","blow","burn","bad","buy","dog",],
    ["quiet","grade","worth","path","lift","warm","wave","suit","burn","bad","buy","pig",],
    ["dress","twice","worth","feed","lift","warm","wave","suit","bone","boy","jet","dog",],
    ["quiet","twice","limit","below","lift","warm","deny","blow","burn","boy","jet","and",],
    ["chief","grade","worth","path","shop","warm","deny","blow","shoe","boy","cat","dog",],
    ["quiet","aware","broad","below","shop","warm","deny","cook","bone","boy","cat","and",],
    ["quiet","aware","worth","below","lift","warm","gift","blow","bone","boy","jet","pig",],
    ["chief","twice","limit","feed","shop","soft","gift","cook","shoe","wine","cat","pig",],
    ["dress","grade","worth","below","folk","soft","gift","cook","shoe","bad","jet","and",],
    ["quiet","aware","broad","feed","lift","jump","deny","suit","shoe","wine","buy","and",],
    ["dress","grade","broad","below","folk","warm","wave","suit","bone","boy","jet","and",],
    ["chief","aware","broad","feed","lift","warm","gift","blow","bone","bad","buy","pig",],
    ["dress","twice","worth","below","shop","jump","gift","cook","bone","bad","buy","and",],
    ["dress","aware","worth","path","shop","soft","wave","cook","shoe","boy","jet","and",],
    ["dress","twice","worth","below","folk","warm","wave","blow","bone","bad","buy","pig",],
    ["dress","aware","broad","feed","folk","soft","deny","cook","bone","boy","cat","dog",],
    ["chief","grade","worth","below","lift","soft","deny","cook","shoe","wine","cat","pig",],
    ["chief","twice","worth","feed","lift","jump","gift","suit","burn","wine","buy","pig",],
    ["dress","aware","broad","path","lift","soft","wave","cook","shoe","boy","cat","and",],
    ["quiet","grade","broad","feed","folk","jump","wave","cook","shoe","bad","cat","dog",],
    ["chief","aware","worth","below","lift","warm","deny","cook","bone","boy","jet","dog",],
    ["quiet","twice","limit","feed","shop","warm","deny","blow","shoe","boy","buy","pig",],
    ["chief","twice","worth","feed","shop","jump","wave","cook","shoe","bad","buy","and",],
    ["chief","grade","broad","path","shop","warm","gift","blow","shoe","bad","buy","dog",],
    ["dress","aware","broad","feed","lift","warm","deny","suit","burn","bad","cat","pig",],
    ["quiet","twice","worth","feed","shop","warm","wave","blow","burn","wine","jet","and",],
    ["dress","aware","limit","path","lift","warm","gift","cook","bone","wine","buy","pig",],
    ["dress","twice","worth","path","lift","jump","wave","cook","bone","bad","buy","and",],
    ["dress","grade","limit","feed","lift","soft","wave","blow","shoe","bad","cat","and",],
    ["chief","aware","broad","feed","lift","soft","deny","suit","bone","bad","buy","and",],
    ["dress","aware","worth","feed","folk","warm","deny","suit","burn","bad","cat","and",],
    ["chief","aware","broad","feed","folk","soft","wave","blow","bone","wine","cat","dog",],
    ["chief","twice","broad","feed","shop","warm","gift","suit","bone","boy","jet","dog",],
    ["chief","twice","limit","path","shop","soft","deny","blow","shoe","boy","jet","and",],
    ["chief","grade","limit","path","lift","warm","deny","cook","burn","bad","cat","and",],
    ["dress","twice","limit","path","folk","jump","gift","suit","shoe","bad","jet","and",],
    ["dress","twice","broad","path","folk","warm","deny","blow","bone","bad","jet","dog",],
    ["dress","twice","worth","below","folk","warm","deny","blow","shoe","boy","buy","pig",],
    ["quiet","grade","broad","below","folk","jump","wave","suit","shoe","wine","buy","pig",],
    ["quiet","aware","limit","below","folk","jump","gift","suit","shoe","boy","jet","dog",],
    ["chief","aware","limit","path","shop","jump","wave","blow","shoe","wine","jet","dog",],
    ["dress","grade","broad","path","folk","jump","gift","cook","burn","boy","buy","dog",],
    ["dress","twice","limit","feed","folk","soft","gift","suit","bone","wine","buy","pig",],
    ["dress","twice","worth","feed","folk","jump","gift","suit","shoe","boy","cat","pig",],
    ["dress","aware","worth","path","folk","jump","deny","blow","shoe","boy","cat","dog",],
    ["chief","twice","broad","below","shop","soft","gift","cook","bone","boy","buy","and",],
    ["chief","aware","worth","path","lift","warm","gift","blow","bone","boy","jet","pig",],
    ["quiet","aware","broad","path","lift","jump","deny","suit","bone","bad","jet","and",],
    ["dress","twice","limit","feed","folk","jump","gift","cook","bone","wine","cat","and",],
    ["dress","aware","broad","feed","shop","warm","gift","suit","shoe","wine","jet","dog",],
    ["dress","grade","limit","path","folk","jump","gift","blow","shoe","bad","jet","pig",],
    ["dress","twice","limit","below","lift","jump","gift","cook","bone","boy","cat","pig",],
    ["chief","grade","worth","path","folk","soft","wave","suit","burn","wine","buy","dog",],
    ["quiet","aware","broad","path","lift","soft","wave","cook","shoe","bad","cat","pig",],
    ["chief","aware","broad","path","folk","soft","deny","cook","bone","boy","buy","pig",],
    ["quiet","twice","limit","path","lift","soft","gift","cook","bone","wine","cat","and",],
    ["chief","twice","limit","feed","lift","warm","wave","blow","bone","bad","buy","pig",],
    ["dress","grade","broad","below","lift","jump","wave","cook","shoe","bad","buy","pig",],
    ["chief","grade","broad","feed","shop","warm","gift","suit","burn","bad","jet","and",],
    ["dress","aware","broad","path","folk","warm","wave","blow","burn","boy","cat","and",],
    ["chief","aware","limit","feed","shop","warm","deny","suit","shoe","boy","jet","pig",],
    ["chief","aware","limit","path","folk","soft","gift","cook","burn","boy","buy","dog",],
    ["dress","twice","limit","below","lift","warm","deny","cook","burn","bad","buy","and",],
    ["dress","twice","worth","below","lift","jump","deny","suit","bone","boy","cat","dog",],
    ["quiet","aware","broad","path","lift","warm","deny","blow","shoe","boy","jet","pig",],
    ["quiet","grade","limit","path","lift","warm","gift","suit","burn","bad","cat","dog",],
    ["dress","grade","broad","below","shop","warm","wave","blow","bone","boy","cat","dog",],
    ["dress","aware","limit","path","lift","soft","gift","suit","bone","boy","buy","pig",],
    ["quiet","grade","limit","path","shop","warm","gift","suit","shoe","boy","jet","and",],
    ["chief","aware","worth","below","lift","warm","deny","blow","bone","boy","buy","and",],
    ["quiet","twice","limit","feed","lift","jump","wave","suit","shoe","wine","jet","pig",],
    ["chief","grade","worth","below","lift","soft","deny","cook","bone","boy","buy","dog",],
    ["dress","grade","broad","below","lift","soft","gift","cook","bone","boy","cat","and",],
    ["dress","twice","broad","path","shop","jump","gift","suit","bone","bad","jet","pig",],
    ["dress","twice","worth","path","folk","jump","gift","suit","shoe","wine","jet","dog",],
    ["dress","aware","worth","feed","folk","jump","gift","cook","bone","bad","jet","pig",],
    ["chief","aware","worth","feed","shop","jump","deny","suit","shoe","boy","jet","pig",],
    ["dress","aware","broad","below","shop","soft","wave","suit","bone","bad","jet","dog",],
    ["quiet","aware","limit","path","folk","warm","gift","suit","bone","boy","buy","and",],
    ["quiet","aware","worth","feed","folk","soft","gift","blow","burn","boy","jet","pig",],
    ["quiet","twice","limit","below","lift","soft","wave","blow","bone","boy","jet","dog",],
    ["chief","grade","limit","path","lift","warm","gift","suit","burn","boy","buy","dog",],
    ["quiet","aware","broad","path","lift","warm","gift","cook","shoe","boy","buy","and",],
    ["dress","grade","broad","path","shop","soft","wave","cook","bone","boy","buy","pig",],
    ["dress","twice","limit","feed","shop","soft","deny","cook","shoe","boy","cat","dog",],
    ["quiet","grade","worth","feed","folk","soft","deny","blow","burn","boy","jet","pig",],
    ["quiet","aware","limit","below","folk","warm","wave","suit","bone","boy","jet","and",],
    ["quiet","aware","worth","feed","folk","warm","wave","suit","burn","boy","cat","pig",],
    ["dress","twice","limit","path","shop","soft","wave","blow","bone","bad","jet","pig",],
    ["dress","twice","limit","feed","shop","jump","deny","cook","burn","bad","jet","pig",],
    ["quiet","grade","worth","path","lift","soft","deny","blow","shoe","wine","buy","dog",],
    ["quiet","twice","limit","feed","lift","jump","deny","cook","bone","wine","jet","and",],
    ["chief","grade","limit","below","folk","jump","wave","cook","shoe","boy","jet","dog",],
    ["quiet","grade","limit","below","folk","jump","deny","cook","burn","wine","jet","pig",],
    ["quiet","twice","limit","below","folk","jump","deny","cook","shoe","boy","jet","dog",],
    ["chief","grade","broad","feed","lift","warm","wave","cook","burn","boy","cat","and",],
    ["dress","twice","broad","path","lift","soft","wave","cook","burn","boy","buy","and",],
    ["dress","grade","broad","path","shop","jump","gift","suit","shoe","bad","cat","dog",],
    ["dress","aware","limit","below","folk","warm","wave","blow","shoe","boy","jet","dog",],
    ["chief","grade","worth","feed","lift","jump","deny","cook","bone","boy","jet","dog",],
    ["quiet","aware","worth","path","lift","soft","gift","blow","shoe","bad","jet","pig",],
    ["quiet","grade","limit","feed","folk","warm","gift","cook","shoe","boy","buy","and",],
    ["quiet","grade","worth","below","lift","jump","wave","blow","burn","bad","cat","pig",],
    ["dress","grade","broad","feed","folk","warm","deny","suit","shoe","bad","cat","dog",],
    ["dress","aware","worth","feed","shop","soft","deny","suit","burn","boy","jet","and",],
    ["chief","aware","worth","path","lift","soft","deny","cook","bone","bad","cat","dog",],
    ["dress","grade","broad","below","lift","soft","deny","suit","burn","boy","jet","dog",],
    ["quiet","aware","broad","path","shop","warm","wave","cook","shoe","boy","jet","pig",],
    ["chief","twice","limit","feed","shop","warm","wave","suit","shoe","bad","cat","and",],
    ["dress","twice","limit","feed","shop","jump","deny","suit","burn","boy","cat","pig",],
    ["dress","twice","worth","path","shop","jump","deny","suit","bone","boy","buy","dog",],
    ["quiet","aware","broad","below","lift","warm","wave","suit","shoe","bad","buy","and",],
    ["chief","aware","broad","path","lift","warm","gift","suit","bone","wine","buy","pig",],
    ["quiet","aware","broad","path","lift","warm","wave","cook","burn","boy","buy","dog",],
    ["chief","grade","worth","path","folk","warm","deny","cook","bone","bad","cat","dog",],
    ["quiet","grade","worth","feed","lift","soft","gift","blow","bone","boy","jet","dog",],
    ["dress","aware","limit","path","shop","jump","gift","cook","shoe","wine","cat","dog",],
    ["quiet","twice","broad","feed","lift","soft","gift","suit","bone","boy","cat","pig",],
    ["dress","aware","broad","feed","lift","warm","deny","blow","shoe","wine","jet","and",],
    ["quiet","twice","limit","feed","shop","jump","gift","cook","burn","wine","buy","dog",],
    ["quiet","grade","broad","feed","lift","jump","deny","suit","burn","boy","buy","and",],
    ["dress","twice","limit","below","lift","jump","gift","suit","shoe","wine","cat","dog",],
    ["dress","twice","worth","below","shop","soft","gift","blow","burn","wine","buy","pig",],
    ["quiet","twice","worth","below","folk","warm","deny","blow","bone","boy","buy","pig",],
    ["dress","twice","limit","feed","shop","warm","deny","blow","burn","boy","buy","pig",],
    ["quiet","twice","limit","feed","shop","warm","gift","blow","bone","wine","buy","pig",],
    ["dress","grade","worth","feed","lift","jump","deny","suit","bone","bad","jet","and",],
    ["chief","twice","limit","path","lift","jump","gift","blow","burn","boy","cat","pig",],
    ["chief","aware","broad","path","shop","soft","deny","suit","shoe","bad","jet","and",],
    ["chief","twice","broad","below","lift","jump","wave","suit","shoe","bad","cat","and",],
    ["chief","aware","broad","path","folk","jump","gift","cook","burn","boy","buy","and",],
    ["chief","aware","broad","below","folk","jump","wave","suit","shoe","boy","jet","and",],
    ["quiet","twice","limit","feed","lift","warm","wave","blow","bone","bad","buy","dog",],
    ["dress","grade","worth","feed","lift","soft","deny","cook","burn","bad","cat","and",],
    ["dress","aware","worth","feed","folk","soft","deny","suit","bone","boy","cat","pig",],
    ["quiet","twice","limit","path","shop","soft","gift","cook","shoe","bad","buy","pig",],
    ["dress","grade","limit","below","lift","jump","deny","cook","bone","bad","buy","pig",],
    ["chief","aware","broad","path","shop","jump","wave","blow","shoe","boy","jet","dog",],
    ["dress","grade","broad","below","folk","soft","gift","blow","bone","bad","jet","dog",],
    ["quiet","aware","worth","feed","lift","jump","wave","cook","shoe","bad","cat","dog",],
    ["quiet","aware","worth","path","folk","soft","wave","blow","shoe","boy","cat","dog",],
    ["dress","aware","broad","feed","lift","warm","wave","suit","bone","wine","jet","and",],
    ["dress","twice","worth","path","lift","soft","gift","cook","burn","bad","cat","dog",],
    ["dress","aware","broad","below","folk","soft","deny","cook","bone","bad","buy","pig",],
    ["dress","aware","worth","below","shop","soft","gift","suit","bone","bad","buy","pig",],
    ["quiet","twice","limit","feed","lift","warm","deny","suit","shoe","boy","buy","and",],
    ["dress","grade","broad","feed","shop","warm","gift","suit","shoe","wine","buy","and",],
    ["quiet","grade","worth","below","folk","jump","gift","blow","burn","wine","buy","pig",],
    ["chief","grade","limit","feed","shop","jump","gift","suit","bone","bad","jet","dog",],
    ["chief","grade","worth","feed","shop","jump","wave","cook","bone","bad","cat","dog",],
    ["chief","twice","limit","below","lift","soft","wave","blow","shoe","boy","jet","dog",],
    ["quiet","grade","broad","feed","lift","soft","deny","cook","burn","boy","buy","pig",],
    ["chief","grade","broad","below","lift","jump","wave","cook","bone","bad","cat","dog",],
    ["quiet","grade","worth","feed","lift","jump","gift","suit","bone","bad","buy","and",],
    ["quiet","twice","limit","feed","lift","warm","wave","cook","burn","wine","buy","pig",],
    ["chief","aware","broad","path","shop","warm","gift","suit","burn","boy","jet","pig",],
    ["chief","twice","broad","feed","lift","soft","deny","suit","shoe","boy","jet","dog",],
    ["quiet","aware","limit","path","shop","soft","gift","blow","shoe","wine","cat","dog",],
    ["dress","twice","limit","below","lift","soft","gift","cook","burn","boy","cat","and",],
    ["quiet","grade","broad","below","shop","warm","gift","suit","bone","boy","buy","dog",],
    ["chief","twice","worth","path","lift","soft","gift","suit","bone","boy","buy","dog",],
    ["quiet","twice","broad","path","folk","warm","wave","suit","shoe","wine","jet","pig",],
    ["quiet","grade","broad","path","lift","warm","gift","suit","shoe","boy","buy","pig",],
    ["quiet","twice","limit","feed","folk","soft","wave","blow","burn","boy","cat","dog",],
    ["quiet","twice","limit","feed","lift","jump","wave","blow","shoe","boy","jet","pig",],
    ["dress","grade","worth","feed","folk","warm","wave","cook","bone","wine","cat","dog",],
    ["dress","grade","worth","below","folk","warm","gift","cook","shoe","boy","cat","pig",],
    ["dress","twice","limit","path","shop","warm","gift","suit","shoe","boy","jet","pig",],
    ["dress","twice","limit","path","shop","warm","deny","suit","shoe","wine","jet","and",],
    ["chief","twice","limit","below","folk","jump","wave","cook","bone","boy","cat","and",],
    ["dress","aware","worth","feed","shop","warm","gift","cook","burn","boy","jet","pig",],
    ["quiet","twice","limit","feed","lift","warm","gift","blow","burn","wine","cat","pig",],
    ["quiet","grade","broad","below","lift","warm","gift","suit","burn","bad","buy","dog",],
    ["dress","aware","limit","feed","folk","soft","wave","cook","bone","boy","jet","dog",],
    ["dress","aware","worth","path","lift","soft","gift","suit","bone","wine","jet","dog",],
    ["dress","aware","limit","feed","folk","warm","deny","blow","bone","bad","cat","and",],
    ["chief","grade","broad","path","folk","soft","gift","suit","shoe","wine","cat","dog",],
    ["quiet","grade","broad","path","folk","warm","wave","cook","burn","wine","buy","and",],
    ["quiet","twice","broad","below","folk","warm","wave","suit","bone","boy","jet","and",],
    ["dress","aware","worth","feed","shop","jump","deny","blow","shoe","boy","cat","dog",],
    ["chief","grade","worth","feed","folk","warm","deny","blow","bone","bad","jet","pig",],
    ["dress","aware","broad","below","lift","soft","deny","cook","bone","wine","jet","dog",],
    ["chief","grade","worth","path","shop","soft","wave","suit","shoe","bad","jet","dog",],
    ["quiet","grade","worth","path","shop","soft","gift","cook","bone","bad","jet","dog",],
    ["chief","aware","worth","path","folk","jump","wave","blow","bone","boy","jet","and",],
    ["chief","grade","worth","path","shop","warm","gift","blow","burn","bad","cat","pig",],
    ["quiet","twice","limit","feed","folk","warm","wave","blow","bone","boy","buy","and",],
    ["chief","twice","worth","feed","folk","warm","gift","blow","bone","bad","buy","and",],
    ["dress","aware","broad","path","lift","warm","wave","blow","burn","boy","cat","dog",],
    ["quiet","aware","worth","feed","shop","soft","wave","suit","shoe","bad","jet","and",],
    ["chief","twice","broad","feed","folk","jump","gift","suit","shoe","wine","buy","dog",],
    ["chief","twice","limit","feed","lift","soft","deny","cook","shoe","boy","cat","pig",],
    ["quiet","twice","limit","feed","shop","warm","wave","blow","shoe","wine","buy","pig",],
    ["quiet","grade","limit","feed","folk","jump","deny","blow","shoe","boy","cat","dog",],
    ["dress","grade","broad","below","folk","jump","gift","suit","shoe","boy","jet","pig",],
    ["chief","aware","broad","below","lift","warm","wave","suit","shoe","wine","buy","pig",],
    ["dress","grade","worth","below","lift","soft","gift","cook","bone","boy","buy","pig",],
    ["chief","grade","worth","path","shop","warm","wave","blow","burn","bad","cat","pig",],
    ["chief","aware","broad","path","folk","soft","wave","suit","shoe","bad","buy","and",],
    ["dress","twice","limit","below","folk","soft","gift","suit","bone","wine","cat","pig",],
    ["dress","twice","worth","feed","shop","soft","gift","suit","shoe","boy","jet","pig",],
    ["quiet","grade","worth","path","lift","warm","wave","cook","shoe","boy","cat","dog",],
    ["chief","twice","worth","path","shop","warm","deny","suit","burn","wine","jet","pig",],
    ["dress","grade","worth","below","shop","jump","wave","suit","burn","bad","buy","dog",],
    ["quiet","grade","broad","feed","folk","soft","deny","cook","burn","boy","jet","and",],
    ["dress","twice","worth","below","shop","jump","deny","suit","bone","wine","cat","pig",],
    ["chief","twice","limit","feed","shop","warm","deny","blow","burn","bad","jet","dog",],
    ["dress","grade","worth","feed","lift","jump","deny","blow","burn","boy","jet","pig",],
    ["dress","grade","limit","path","lift","jump","gift","suit","bone","wine","jet","dog",],
    ["chief","twice","worth","below","shop","soft","deny","blow","shoe","wine","jet","dog",],
    ["chief","grade","worth","path","shop","jump","wave","suit","shoe","bad","buy","pig",],
    ["dress","aware","worth","feed","shop","warm","wave","blow","bone","bad","cat","and",],
    ["dress","aware","broad","feed","folk","jump","wave","blow","shoe","wine","cat","and",],
    ["dress","grade","broad","path","folk","jump","deny","cook","shoe","boy","cat","and",],
    ["chief","twice","worth","path","shop","warm","deny","blow","bone","wine","buy","and",],
    ["quiet","grade","limit","feed","folk","jump","deny","suit","burn","bad","cat","and",],
    ["dress","twice","limit","below","shop","jump","gift","suit","burn","boy","jet","dog",],
    ["chief","twice","worth","below","lift","soft","deny","cook","shoe","boy","cat","and",],
    ["dress","twice","limit","below","lift","jump","wave","blow","burn","bad","jet","pig",],
    ["quiet","grade","broad","path","folk","soft","wave","suit","bone","bad","buy","and",],
    ["dress","twice","worth","feed","shop","soft","wave","cook","bone","boy","jet","dog",],
    ["quiet","grade","broad","feed","shop","warm","gift","blow","bone","bad","cat","and",],
    ["quiet","aware","broad","feed","folk","jump","deny","blow","burn","bad","jet","dog",],
    ["dress","aware","broad","path","folk","jump","wave","blow","burn","wine","buy","dog",],
    ["chief","twice","worth","path","shop","jump","deny","cook","bone","boy","cat","and",],
    ["dress","aware","worth","path","shop","jump","gift","suit","burn","boy","cat","dog",],
    ["dress","grade","limit","below","folk","soft","deny","suit","bone","wine","jet","and",],
    ["chief","aware","limit","path","folk","warm","deny","cook","shoe","boy","cat","dog",],
    ["chief","aware","limit","feed","lift","warm","gift","suit","shoe","wine","buy","and",],
    ["quiet","grade","worth","path","lift","jump","gift","suit","shoe","boy","jet","dog",],
    ["quiet","aware","limit","below","lift","jump","deny","cook","bone","boy","jet","dog",],
    ["quiet","aware","worth","path","folk","warm","deny","cook","burn","bad","cat","and",],
    ["quiet","aware","broad","path","folk","jump","deny","cook","bone","boy","jet","pig",],
    ["chief","grade","worth","below","lift","jump","wave","cook","shoe","bad","cat","and",],
    ["chief","aware","broad","feed","lift","soft","gift","cook","shoe","bad","cat","and",],
    ["quiet","aware","broad","path","shop","warm","gift","cook","shoe","bad","cat","pig",],
    ["dress","aware","broad","path","folk","soft","wave","blow","burn","bad","buy","and",],
    ["chief","aware","worth","path","lift","soft","deny","blow","shoe","bad","buy","pig",],
    ["chief","aware","worth","feed","folk","jump","gift","blow","burn","bad","buy","pig",],
    ["quiet","twice","worth","feed","shop","warm","deny","blow","bone","boy","cat","dog",],
    ["quiet","aware","broad","path","lift","warm","wave","blow","bone","bad","cat","and",],
    ["chief","grade","broad","path","folk","jump","wave","suit","burn","boy","buy","and",],
    ["chief","twice","worth","feed","folk","soft","wave","cook","shoe","bad","buy","and",],
    ["quiet","twice","worth","path","lift","soft","wave","suit","bone","bad","buy","and",],
    ["chief","aware","worth","below","shop","soft","gift","suit","burn","wine","jet","dog",],
    ["quiet","grade","worth","below","shop","soft","gift","suit","burn","wine","jet","dog",],
    ["dress","twice","limit","path","folk","soft","deny","cook","burn","boy","buy","dog",],
    ["quiet","twice","limit","feed","lift","jump","gift","suit","bone","boy","jet","and",],
    ["dress","twice","limit","below","folk","jump","deny","blow","bone","bad","cat","pig",],
    ["dress","aware","worth","path","folk","jump","gift","cook","bone","wine","cat","and",],
    ["quiet","grade","worth","below","folk","soft","deny","blow","bone","boy","buy","pig",],
    ["dress","twice","worth","path","lift","jump","wave","suit","bone","wine","cat","and",],
    ["quiet","twice","limit","path","lift","warm","wave","suit","shoe","boy","cat","pig",],
    ["chief","grade","broad","path","lift","warm","deny","cook","bone","boy","buy","and",],
    ["chief","grade","worth","path","folk","soft","deny","suit","bone","wine","jet","pig",],
    ["dress","grade","worth","path","folk","soft","deny","cook","shoe","boy","cat","and",],
    ["dress","grade","broad","feed","shop","soft","wave","blow","shoe","bad","buy","dog",],
    ["quiet","aware","worth","below","lift","warm","gift","cook","burn","wine","jet","and",],
    ["dress","aware","worth","below","shop","warm","deny","blow","burn","bad","jet","pig",],
    ["dress","grade","worth","feed","lift","soft","wave","cook","bone","wine","jet","dog",],
    ["chief","twice","worth","below","shop","jump","wave","cook","bone","boy","cat","and",],
    ["quiet","grade","broad","feed","lift","warm","gift","blow","burn","wine","cat","dog",],
    ["quiet","twice","limit","feed","folk","soft","gift","blow","burn","boy","buy","dog",],
    ["quiet","grade","broad","feed","lift","soft","gift","cook","burn","wine","buy","dog",],
    ["quiet","grade","broad","feed","folk","soft","deny","blow","shoe","bad","buy","pig",],
    ["dress","aware","broad","path","folk","jump","deny","suit","shoe","boy","buy","dog",],
    ["quiet","twice","limit","feed","lift","warm","wave","blow","shoe","bad","jet","dog",],
    ["dress","grade","broad","below","folk","jump","deny","cook","bone","boy","buy","dog",],
    ["dress","grade","worth","feed","lift","soft","deny","suit","shoe","boy","cat","dog",],
    ["quiet","grade","worth","feed","folk","warm","deny","suit","bone","bad","jet","and",],
    ["dress","twice","limit","feed","shop","warm","gift","suit","bone","boy","buy","and",],
    ["chief","grade","broad","path","shop","warm","wave","cook","burn","boy","cat","dog",],
    ["chief","grade","broad","below","folk","warm","deny","blow","burn","boy","jet","pig",],
    ["dress","aware","worth","path","shop","soft","gift","cook","burn","boy","buy","pig",],
    ["dress","twice","broad","path","lift","soft","deny","blow","bone","boy","jet","and",],
    ["chief","aware","worth","path","lift","jump","gift","blow","burn","boy","buy","dog",],
    ["dress","grade","broad","feed","lift","soft","gift","suit","burn","wine","buy","dog",],
    ["quiet","aware","broad","path","lift","warm","deny","blow","shoe","bad","cat","and",],
    ["dress","aware","broad","feed","shop","soft","wave","blow","bone","bad","cat","and",],
    ["chief","aware","limit","path","folk","warm","wave","blow","bone","bad","cat","and",],
    ["chief","grade","worth","feed","shop","jump","wave","cook","burn","boy","jet","pig",],
    ["chief","aware","broad","path","shop","jump","wave","blow","bone","boy","cat","and",],
    ["chief","twice","broad","below","lift","jump","wave","blow","bone","boy","buy","dog",],
    ["quiet","twice","limit","below","folk","soft","wave","cook","bone","boy","buy","dog",],
    ["dress","aware","broad","path","folk","warm","deny","cook","shoe","boy","buy","dog",],
    ["dress","twice","worth","feed","shop","soft","wave","blow","shoe","boy","buy","dog",],
    ["dress","grade","worth","path","shop","jump","gift","suit","burn","wine","jet","dog",],
    ["quiet","grade","limit","path","lift","warm","gift","blow","burn","boy","cat","dog",],
    ["chief","grade","broad","feed","lift","jump","deny","blow","bone","boy","jet","and",],
    ["chief","grade","worth","path","shop","jump","gift","cook","shoe","wine","jet","pig",],
    ["quiet","aware","worth","path","folk","warm","wave","cook","shoe","boy","buy","pig",],
    ["quiet","grade","worth","path","lift","jump","gift","blow","shoe","bad","cat","and",],
    ["chief","twice","broad","path","folk","warm","wave","cook","shoe","boy","buy","pig",],
    ["chief","twice","worth","path","shop","soft","gift","suit","burn","boy","buy","pig",],
    ["quiet","aware","worth","path","folk","soft","wave","suit","shoe","wine","jet","pig",],
    ["chief","aware","worth","path","lift","jump","wave","cook","shoe","boy","cat","pig",],
    ["quiet","twice","worth","feed","folk","soft","gift","suit","shoe","wine","buy","dog",],
    ["quiet","aware","worth","path","folk","jump","gift","suit","shoe","bad","cat","and",],
    ["dress","aware","worth","path","lift","soft","gift","suit","burn","bad","jet","and",],
    ["chief","grade","worth","path","shop","jump","gift","suit","burn","boy","cat","pig",],
    ["quiet","grade","broad","feed","folk","soft","gift","blow","shoe","bad","jet","and",],
    ["quiet","grade","broad","below","folk","warm","deny","suit","shoe","boy","jet","dog",],
    ["chief","aware","broad","path","lift","warm","deny","blow","burn","bad","buy","and",],
    ["chief","aware","broad","path","shop","warm","deny","blow","burn","boy","cat","and",],
    ["quiet","twice","worth","below","shop","soft","deny","cook","bone","bad","cat","pig",],
    ["dress","aware","worth","path","lift","warm","wave","blow","shoe","bad","buy","pig",],
    ["dress","aware","limit","feed","lift","warm","wave","cook","burn","bad","buy","pig",],
    ["dress","twice","broad","feed","shop","jump","deny","suit","bone","bad","buy","pig",],
    ["chief","aware","limit","below","folk","jump","wave","cook","burn","bad","buy","pig",],
    ["quiet","aware","worth","below","folk","soft","wave","suit","shoe","boy","jet","dog",],
    ["dress","aware","worth","path","folk","warm","wave","blow","burn","bad","jet","and",],
    ["chief","aware","broad","path","lift","warm","gift","suit","bone","bad","jet","pig",],
    ["chief","aware","broad","path","lift","jump","gift","suit","shoe","wine","jet","dog",],
    ["chief","grade","broad","below","shop","warm","gift","suit","bone","boy","cat","dog",],
    ["chief","aware","broad","path","lift","soft","deny","blow","burn","boy","cat","and",],
    ["quiet","aware","broad","below","shop","warm","deny","blow","burn","wine","cat","and",],
    ["chief","aware","worth","below","folk","warm","deny","cook","shoe","boy","jet","and",],
    ["chief","twice","limit","feed","lift","warm","wave","blow","shoe","wine","jet","pig",],
    ["chief","twice","limit","below","shop","warm","deny","cook","burn","bad","jet","pig",],
    ["quiet","grade","broad","feed","lift","warm","wave","blow","bone","bad","buy","and",],
    ["dress","aware","broad","feed","lift","soft","deny","suit","burn","wine","buy","pig",],
    ["chief","aware","limit","below","shop","soft","gift","cook","shoe","boy","buy","and",],
    ["quiet","grade","limit","path","shop","soft","wave","suit","bone","boy","buy","and",],
    ["dress","twice","worth","path","shop","soft","deny","suit","bone","bad","buy","and",],
    ["chief","twice","limit","path","folk","jump","deny","cook","shoe","bad","jet","pig",],
    ["chief","aware","limit","below","lift","warm","gift","suit","burn","boy","buy","and",],
    ["dress","twice","worth","path","folk","soft","deny","suit","shoe","wine","jet","pig",],
    ["quiet","twice","worth","feed","folk","jump","gift","blow","shoe","boy","jet","dog",],
    ["quiet","aware","broad","below","shop","soft","deny","blow","shoe","bad","jet","dog",],
    ["quiet","twice","broad","below","shop","jump","wave","suit","bone","boy","cat","pig",],
    ["chief","grade","broad","below","lift","jump","wave","blow","burn","bad","cat","dog",],
    ["chief","twice","limit","path","lift","warm","deny","cook","bone","boy","jet","and",],
    ["quiet","aware","broad","path","lift","warm","wave","cook","bone","wine","buy","pig",],
    ["chief","twice","limit","path","shop","jump","gift","blow","shoe","bad","cat","pig",],
    ["quiet","grade","broad","feed","folk","warm","wave","blow","burn","boy","cat","pig",],
    ["dress","aware","broad","path","lift","warm","wave","suit","bone","boy","cat","and",],
    ["quiet","twice","worth","feed","lift","soft","gift","suit","bone","boy","buy","pig",],
    ["dress","grade","worth","below","folk","warm","deny","blow","burn","boy","cat","and",],
    ["quiet","twice","broad","path","shop","warm","gift","blow","bone","boy","buy","and",],
    ["chief","grade","limit","feed","folk","warm","wave","cook","shoe","bad","buy","pig",],
    ["chief","grade","broad","path","lift","soft","gift","suit","bone","bad","jet","dog",],
    ["chief","grade","limit","below","folk","jump","deny","suit","shoe","boy","jet","pig",],
    ["chief","grade","limit","below","lift","jump","gift","blow","burn","bad","jet","and",],
    ["chief","aware","limit","path","lift","warm","gift","blow","bone","boy","buy","dog",],
    ["dress","aware","worth","feed","shop","warm","gift","suit","bone","boy","cat","and",],
    ["quiet","twice","broad","below","lift","soft","deny","suit","bone","boy","buy","pig",],
    ["dress","twice","limit","path","shop","warm","wave","suit","burn","bad","jet","pig",],
    ["quiet","aware","worth","feed","shop","warm","wave","suit","shoe","boy","jet","pig",],
    ["quiet","grade","worth","path","folk","soft","deny","cook","bone","wine","buy","and",],
    ["quiet","aware","broad","below","lift","soft","gift","suit","bone","boy","cat","and",],
    ["quiet","aware","worth","path","lift","jump","gift","cook","burn","bad","cat","pig",],
    ["dress","aware","broad","feed","lift","soft","deny","suit","burn","bad","cat","dog",],
    ["chief","aware","worth","below","shop","warm","deny","blow","bone","boy","jet","dog",],
    ["dress","grade","limit","below","lift","warm","gift","blow","burn","wine","buy","dog",],
    ["quiet","grade","worth","path","lift","jump","wave","blow","burn","boy","cat","dog",],
    ["dress","aware","broad","path","lift","soft","gift","cook","bone","boy","buy","and",],
    ["dress","grade","broad","feed","shop","warm","wave","blow","burn","boy","jet","dog",],
    ["chief","grade","broad","below","shop","jump","deny","blow","bone","boy","buy","pig",],
    ["dress","aware","limit","below","lift","warm","wave","blow","shoe","bad","buy","dog",],
    ["chief","aware","broad","below","folk","warm","deny","blow","burn","wine","cat","and",],
    ["quiet","aware","worth","feed","lift","soft","deny","suit","shoe","boy","buy","pig",],
    ["quiet","twice","limit","path","folk","soft","wave","blow","bone","bad","cat","and",],
    ["dress","aware","broad","below","folk","warm","deny","blow","bone","bad","jet","and",],
    ["quiet","aware","limit","feed","shop","warm","gift","suit","burn","bad","cat","and",],
    ["chief","aware","broad","below","folk","soft","wave","suit","bone","bad","jet","and",],
    ["chief","twice","worth","feed","lift","warm","gift","blow","shoe","bad","jet","and",],
    ["dress","twice","broad","feed","folk","soft","deny","suit","burn","bad","jet","and",],
    ["dress","twice","limit","path","lift","jump","deny","suit","shoe","boy","jet","dog",],
    ["chief","aware","broad","below","folk","soft","gift","cook","shoe","boy","buy","dog",],
    ["dress","grade","broad","path","folk","warm","deny","cook","burn","boy","buy","dog",],
    ["dress","grade","worth","feed","shop","jump","deny","cook","shoe","bad","buy","and",],
    ["quiet","aware","broad","path","lift","soft","gift","cook","shoe","boy","cat","dog",],
    ["quiet","twice","limit","feed","lift","soft","wave","suit","burn","boy","buy","pig",],
    ["dress","aware","broad","path","lift","soft","deny","suit","shoe","bad","cat","dog",],
    ["quiet","grade","worth","feed","lift","warm","wave","cook","burn","boy","jet","dog",],
    ["chief","aware","worth","feed","lift","warm","wave","suit","bone","boy","jet","dog",],
    ["dress","twice","limit","feed","shop","jump","gift","cook","shoe","boy","jet","dog",],
    ["quiet","aware","broad","feed","lift","warm","wave","suit","bone","bad","cat","dog",],
    ["chief","aware","limit","below","lift","warm","deny","suit","shoe","boy","jet","dog",],
    ["quiet","aware","worth","path","shop","soft","deny","blow","bone","bad","buy","and",],
    ["chief","grade","broad","feed","shop","jump","wave","blow","shoe","bad","buy","pig",],
    ["dress","twice","worth","feed","shop","warm","deny","suit","burn","bad","buy","and",],
    ["chief","twice","worth","feed","shop","warm","wave","blow","burn","bad","buy","dog",],
    ["chief","twice","limit","feed","lift","jump","gift","blow","bone","boy","cat","and",],
    ["quiet","twice","limit","path","lift","warm","wave","blow","bone","bad","buy","pig",],
    ["dress","aware","broad","path","folk","warm","wave","suit","shoe","boy","cat","and",],
    ["chief","grade","worth","path","lift","warm","wave","cook","bone","boy","cat","and",],
    ["chief","aware","worth","feed","shop","warm","deny","blow","burn","bad","jet","pig",],
    ["quiet","grade","broad","below","folk","jump","gift","suit","burn","wine","cat","pig",],
    ["chief","aware","worth","path","lift","soft","gift","cook","shoe","bad","jet","pig",],
    ["dress","aware","broad","feed","lift","soft","deny","blow","bone","bad","cat","dog",],
    ["quiet","twice","limit","path","lift","warm","wave","blow","shoe","boy","cat","and",],
    ["quiet","aware","worth","feed","lift","warm","wave","cook","burn","bad","buy","pig",],
    ["dress","twice","limit","path","shop","soft","wave","blow","burn","wine","buy","dog",],
    ["chief","grade","limit","below","folk","soft","gift","blow","burn","boy","buy","dog",],
    ["chief","twice","broad","path","lift","soft","deny","blow","bone","bad","cat","pig",],
    ["chief","twice","worth","path","folk","warm","wave","suit","bone","bad","cat","dog",],
    ["dress","aware","broad","below","shop","warm","gift","blow","bone","wine","jet","and",],
    ["quiet","grade","broad","path","folk","warm","wave","suit","shoe","bad","buy","dog",],
    ["dress","twice","limit","feed","shop","soft","gift","suit","shoe","boy","cat","pig",],
    ["quiet","twice","worth","feed","lift","warm","wave","suit","burn","boy","jet","dog",],
    ["chief","grade","broad","feed","folk","soft","gift","blow","shoe","boy","buy","pig",],
    ["chief","twice","limit","below","lift","jump","deny","cook","bone","boy","jet","pig",],
    ["dress","twice","limit","below","folk","warm","deny","suit","burn","bad","cat","and",],
    ["quiet","grade","worth","feed","folk","warm","gift","blow","bone","boy","cat","and",],
    ["dress","aware","broad","path","shop","warm","gift","blow","shoe","boy","cat","dog",],
    ["chief","twice","worth","path","lift","jump","deny","blow","shoe","bad","buy","and",],
    ["dress","grade","broad","below","lift","jump","wave","suit","shoe","bad","buy","and",],
    ["chief","aware","broad","feed","shop","warm","gift","suit","burn","boy","cat","and",],
    ["quiet","grade","limit","feed","folk","soft","wave","suit","burn","wine","buy","dog",],
    ["dress","grade","broad","path","shop","warm","deny","suit","shoe","wine","cat","dog",],
    ["dress","grade","broad","below","folk","warm","gift","cook","shoe","boy","jet","and",],
    ["chief","aware","broad","feed","lift","warm","deny","blow","burn","wine","cat","and",],
    ["quiet","twice","limit","feed","shop","warm","gift","blow","burn","bad","cat","dog",],
    ["chief","aware","limit","below","folk","warm","wave","cook","shoe","wine","jet","and",],
    ["chief","aware","worth","path","lift","soft","wave","cook","shoe","boy","buy","dog",],
    ["chief","aware","broad","below","shop","warm","gift","blow","shoe","boy","cat","dog",],
    ["quiet","grade","worth","path","lift","jump","deny","suit","bone","boy","buy","dog",],
    ["quiet","grade","limit","feed","lift","soft","deny","blow","bone","boy","buy","and",],
    ["chief","grade","broad","path","lift","soft","wave","suit","burn","bad","buy","pig",],
    ["dress","twice","limit","path","lift","soft","wave","suit","shoe","boy","jet","and",],
    ["dress","twice","worth","feed","shop","jump","gift","suit","shoe","bad","jet","and",],
    ["dress","grade","broad","feed","lift","jump","wave","blow","shoe","boy","buy","pig",],
    ["dress","twice","limit","feed","shop","jump","deny","cook","shoe","bad","buy","pig",],
    ["quiet","twice","worth","feed","folk","warm","gift","blow","shoe","boy","buy","dog",],
    ["quiet","grade","broad","below","folk","soft","gift","cook","shoe","boy","jet","dog",],
    ["quiet","grade","worth","path","shop","soft","gift","cook","burn","wine","buy","and",],
    ["dress","twice","broad","path","shop","jump","wave","suit","burn","bad","cat","pig",],
    ["dress","aware","broad","path","lift","soft","gift","suit","shoe","wine","jet","pig",],
    ["chief","grade","worth","feed","lift","jump","wave","cook","burn","bad","jet","pig",],
    ["chief","grade","broad","feed","folk","soft","wave","cook","shoe","boy","jet","dog",],
    ["dress","aware","broad","path","lift","jump","deny","suit","bone","boy","jet","and",],
    ["chief","aware","limit","feed","folk","soft","gift","suit","shoe","boy","cat","pig",],
    ["quiet","twice","broad","feed","folk","soft","wave","suit","shoe","boy","jet","pig",],
    ["dress","twice","broad","feed","lift","jump","deny","suit","shoe","bad","buy","pig",],
    ["dress","twice","broad","path","shop","soft","gift","blow","burn","boy","cat","dog",],
    ["chief","twice","worth","feed","folk","jump","gift","suit","shoe","bad","buy","pig",],
    ["dress","aware","worth","feed","folk","warm","deny","cook","burn","boy","jet","and",],
    ["chief","aware","worth","below","lift","warm","gift","cook","bone","wine","cat","and",],
    ["chief","grade","worth","below","folk","jump","gift","blow","burn","bad","jet","pig",],
    ["dress","twice","limit","below","lift","warm","gift","blow","shoe","boy","jet","and",],
    ["dress","grade","broad","below","lift","warm","wave","blow","bone","wine","cat","and",],
    ["quiet","grade","worth","feed","lift","jump","wave","blow","shoe","bad","buy","pig",],
    ["quiet","twice","limit","feed","lift","jump","gift","suit","burn","boy","jet","dog",],
    ["dress","grade","broad","feed","folk","soft","gift","blow","burn","wine","cat","and",],
    ["chief","grade","worth","feed","lift","soft","gift","blow","shoe","boy","cat","dog",],
    ["dress","twice","limit","below","shop","jump","wave","suit","bone","wine","cat","and",],
    ["dress","aware","worth","path","lift","jump","wave","blow","bone","boy","jet","and",],
    ["quiet","grade","worth","below","folk","warm","deny","suit","shoe","boy","jet","pig",],
    ["chief","grade","limit","feed","folk","warm","deny","suit","bone","bad","jet","and",],
    ["chief","twice","worth","feed","lift","jump","gift","cook","burn","boy","jet","pig",],
    ["chief","aware","broad","feed","folk","warm","wave","blow","burn","bad","buy","dog",],
    ["quiet","twice","limit","path","lift","soft","wave","blow","bone","boy","cat","and",],
    ["chief","twice","limit","below","lift","soft","deny","suit","shoe","bad","cat","and",],
    ["chief","grade","limit","path","folk","jump","deny","suit","bone","bad","jet","pig",],
    ["dress","aware","worth","path","lift","jump","deny","cook","bone","wine","jet","and",],
    ["dress","grade","worth","feed","folk","warm","gift","blow","burn","boy","buy","dog",],
    ["dress","grade","broad","path","lift","warm","gift","blow","shoe","boy","jet","pig",],
    ["quiet","twice","broad","below","lift","jump","wave","suit","bone","boy","buy","dog",],
    ["quiet","grade","worth","below","folk","warm","deny","cook","burn","boy","buy","pig",],
    ["dress","twice","limit","below","folk","soft","gift","suit","burn","bad","buy","pig",],
    ["dress","grade","limit","feed","shop","soft","wave","blow","shoe","boy","cat","pig",],
    ["dress","aware","worth","path","folk","warm","wave","suit","shoe","bad","buy","pig",],
    ["dress","grade","broad","below","shop","warm","gift","blow","shoe","bad","cat","and",],
    ["dress","aware","worth","feed","shop","warm","deny","blow","shoe","boy","jet","and",],
    ["quiet","twice","worth","below","folk","soft","deny","blow","shoe","bad","cat","and",],
    ["quiet","grade","limit","path","shop","soft","deny","cook","shoe","boy","cat","and",],
    ["chief","grade","worth","feed","shop","warm","gift","suit","burn","bad","jet","pig",],
    ["dress","aware","limit","feed","folk","soft","wave","cook","shoe","bad","cat","pig",],
    ["quiet","grade","broad","path","lift","soft","gift","cook","shoe","wine","jet","dog",],
    ["quiet","aware","broad","below","folk","warm","wave","blow","bone","bad","buy","and",],
    ["chief","aware","limit","below","folk","warm","wave","cook","burn","wine","jet","dog",],
    ["chief","grade","broad","path","folk","soft","deny","suit","burn","wine","jet","dog",],
    ["quiet","grade","worth","path","lift","warm","wave","suit","bone","boy","buy","pig",],
    ["dress","grade","worth","below","lift","warm","gift","cook","bone","bad","cat","pig",],
    ["quiet","grade","worth","path","folk","jump","deny","suit","shoe","bad","buy","pig",],
    ["quiet","grade","limit","path","shop","warm","gift","blow","burn","bad","buy","pig",],
    ["quiet","aware","broad","feed","lift","warm","wave","suit","bone","boy","jet","pig",],
    ["chief","aware","broad","path","shop","jump","wave","cook","burn","bad","buy","pig",],
    ["chief","aware","broad","below","folk","jump","gift","cook","burn","boy","cat","dog",],
    ["quiet","aware","broad","feed","lift","warm","deny","cook","bone","wine","jet","and",],
    ["chief","twice","limit","feed","folk","jump","deny","blow","bone","wine","cat","pig",],
    ["quiet","twice","worth","feed","shop","jump","wave","suit","bone","boy","jet","dog",],
    ["chief","aware","broad","feed","folk","soft","wave","suit","bone","boy","buy","pig",],
    ["quiet","twice","worth","feed","lift","jump","wave","suit","bone","boy","jet","and",],
    ["quiet","twice","limit","feed","shop","soft","deny","blow","burn","bad","buy","pig",],
    ["dress","aware","broad","path","lift","soft","deny","blow","shoe","boy","buy","dog",],
    ["quiet","aware","limit","path","shop","warm","gift","blow","burn","boy","jet","and",],
    ["quiet","grade","broad","below","lift","soft","gift","suit","shoe","bad","jet","pig",],
    ["chief","twice","limit","feed","folk","jump","gift","cook","burn","boy","jet","dog",],
    ["dress","twice","worth","below","lift","jump","wave","suit","burn","boy","jet","dog",],
    ["quiet","aware","worth","below","folk","warm","gift","suit","shoe","boy","jet","and",],
    ["quiet","aware","broad","below","folk","soft","deny","suit","bone","boy","jet","dog",],
    ["dress","grade","broad","feed","folk","soft","wave","cook","bone","boy","jet","dog",],
    ["quiet","twice","limit","feed","folk","warm","deny","blow","burn","wine","cat","pig",],
    ["dress","grade","worth","path","shop","warm","gift","blow","burn","boy","cat","dog",],
    ["quiet","aware","broad","below","folk","warm","wave","cook","burn","boy","cat","and",],
    ["dress","grade","worth","below","lift","soft","deny","suit","burn","boy","cat","dog",],
    ["dress","twice","worth","below","lift","soft","wave","cook","bone","boy","buy","dog",],
    ["dress","grade","worth","feed","shop","warm","deny","cook","shoe","boy","cat","pig",],
    ["dress","aware","broad","below","lift","soft","gift","blow","shoe","boy","cat","pig",],
    ["dress","aware","broad","path","shop","warm","wave","cook","bone","bad","cat","dog",],
    ["dress","twice","limit","feed","folk","soft","gift","blow","burn","boy","buy","and",],
    ["dress","grade","broad","below","lift","warm","deny","blow","shoe","boy","jet","pig",],
    ["quiet","grade","worth","below","shop","soft","wave","cook","shoe","bad","cat","and",],
    ["dress","aware","broad","below","folk","jump","gift","cook","bone","boy","buy","pig",],
    ["chief","aware","broad","below","lift","soft","gift","suit","burn","wine","cat","dog",],
    ["chief","twice","limit","path","shop","jump","gift","cook","bone","boy","cat","dog",],
    ["chief","twice","worth","feed","folk","soft","gift","suit","burn","boy","jet","and",],
    ["dress","grade","broad","below","lift","soft","wave","cook","shoe","boy","jet","dog",],
    ["quiet","aware","broad","below","shop","soft","deny","suit","bone","wine","cat","and",],
    ["quiet","grade","limit","below","shop","warm","gift","cook","shoe","bad","buy","pig",],
    ["quiet","twice","broad","path","lift","jump","deny","suit","bone","bad","jet","pig",],
    ["dress","aware","broad","below","folk","warm","wave","blow","bone","boy","buy","dog",],
    ["quiet","aware","worth","path","folk","warm","wave","blow","burn","wine","cat","and",],
    ["dress","twice","worth","below","shop","warm","gift","blow","bone","bad","cat","pig",],
    ["dress","aware","limit","below","folk","warm","wave","cook","bone","bad","buy","pig",],
    ["dress","aware","broad","path","shop","soft","wave","suit","burn","boy","cat","and",],
    ["quiet","twice","worth","below","shop","warm","deny","suit","shoe","bad","cat","dog",],
    ["chief","twice","limit","path","folk","jump","deny","cook","burn","boy","buy","dog",],
    ["dress","aware","broad","feed","folk","jump","gift","blow","burn","boy","buy","and",],
    ["chief","grade","worth","feed","lift","jump","wave","blow","shoe","bad","jet","and",],
    ["quiet","grade","worth","path","folk","jump","deny","suit","burn","boy","jet","dog",],
    ["dress","grade","worth","feed","lift","soft","deny","suit","bone","boy","jet","dog",],
    ["quiet","aware","broad","below","folk","jump","deny","suit","burn","bad","jet","pig",],
    ["dress","twice","worth","below","shop","soft","wave","blow","burn","bad","cat","dog",],
    ["chief","aware","limit","path","folk","warm","gift","blow","shoe","bad","jet","and",],
    ["dress","aware","broad","below","shop","warm","deny","suit","bone","bad","cat","dog",],
    ["dress","grade","worth","below","folk","jump","wave","blow","bone","boy","buy","and",],
    ["quiet","grade","broad","below","folk","soft","gift","cook","shoe","bad","jet","pig",],
    ["dress","grade","broad","below","shop","jump","gift","cook","bone","bad","jet","dog",],
    ["quiet","grade","broad","feed","lift","warm","deny","suit","shoe","bad","buy","pig",],
    ["quiet","aware","worth","feed","shop","warm","deny","blow","bone","bad","buy","dog",],
    ["dress","twice","limit","below","lift","warm","deny","suit","bone","wine","buy","dog",],
    ["quiet","twice","broad","feed","shop","soft","wave","cook","bone","boy","jet","pig",],
    ["chief","twice","limit","below","shop","jump","gift","suit","bone","bad","jet","dog",],
    ["dress","grade","worth","below","lift","soft","deny","suit","burn","boy","buy","pig",],
    ["quiet","twice","worth","below","shop","soft","gift","cook","burn","boy","jet","pig",],
    ["dress","twice","worth","feed","lift","soft","deny","blow","burn","boy","buy","pig",],
    ["chief","aware","broad","feed","lift","jump","gift","cook","bone","boy","cat","dog",],
    ["chief","aware","worth","below","shop","soft","wave","cook","shoe","wine","cat","and",],
    ["quiet","twice","broad","below","shop","jump","gift","suit","shoe","wine","buy","pig",],
    ["dress","grade","limit","feed","lift","warm","wave","suit","bone","bad","jet","dog",],
    ["chief","aware","broad","below","shop","warm","gift","cook","bone","wine","buy","and",],
    ["dress","aware","limit","feed","shop","soft","deny","blow","bone","boy","buy","and",],
    ["quiet","grade","worth","feed","folk","jump","gift","blow","burn","boy","jet","and",],
    ["dress","grade","broad","feed","lift","jump","deny","cook","shoe","boy","cat","dog",],
    ["chief","aware","limit","path","shop","warm","gift","cook","bone","boy","jet","pig",],
    ["quiet","aware","limit","feed","lift","soft","deny","suit","bone","wine","cat","pig",],
    ["chief","grade","broad","path","lift","soft","gift","cook","bone","bad","jet","and",],
    ["quiet","grade","worth","below","lift","soft","gift","suit","burn","boy","jet","and",],
    ["chief","aware","broad","below","lift","soft","deny","suit","shoe","bad","cat","dog",],
    ["quiet","aware","limit","feed","lift","jump","wave","blow","bone","bad","jet","dog",],
    ["dress","aware","broad","below","folk","jump","gift","cook","shoe","bad","buy","and",],
    ["quiet","grade","worth","below","lift","soft","wave","suit","bone","wine","cat","dog",],
    ["dress","aware","broad","feed","lift","jump","gift","suit","burn","wine","buy","pig",],
    ["quiet","aware","broad","below","lift","jump","gift","blow","bone","boy","cat","pig",],
    ["dress","aware","limit","below","folk","warm","deny","blow","bone","boy","buy","dog",],
    ["chief","aware","worth","path","lift","soft","gift","cook","shoe","bad","buy","dog",],
    ["chief","aware","broad","below","folk","jump","gift","blow","shoe","bad","cat","pig",],
    ["chief","twice","limit","below","shop","warm","deny","blow","burn","boy","jet","dog",],
    ["quiet","twice","limit","feed","folk","jump","gift","suit","burn","boy","jet","dog",],
    ["chief","grade","worth","path","lift","warm","wave","suit","burn","boy","cat","and",],
    ["chief","twice","broad","below","folk","warm","gift","suit","burn","bad","buy","pig",],
    ["dress","grade","limit","feed","lift","jump","deny","cook","burn","bad","cat","dog",],
    ["chief","twice","limit","below","folk","jump","wave","suit","burn","bad","cat","dog",],
    ["chief","aware","worth","path","folk","soft","wave","cook","shoe","bad","buy","pig",],
    ["dress","grade","broad","below","shop","soft","gift","suit","bone","bad","cat","pig",],
    ["chief","twice","limit","path","lift","jump","deny","suit","shoe","boy","jet","and",],
    ["dress","aware","worth","below","lift","jump","deny","blow","burn","bad","jet","and",],
    ["chief","twice","worth","feed","lift","jump","gift","cook","burn","boy","buy","and",],
    ["quiet","twice","broad","feed","folk","warm","gift","suit","burn","bad","buy","dog",],
    ["quiet","aware","worth","feed","lift","soft","wave","cook","burn","boy","buy","and",],
    ["dress","aware","worth","path","folk","jump","deny","cook","bone","bad","cat","and",],
    ["dress","grade","broad","path","lift","soft","wave","cook","burn","boy","buy","and",],
    ["dress","aware","worth","below","shop","jump","deny","suit","bone","boy","cat","dog",],
    ["chief","grade","worth","below","lift","soft","deny","cook","shoe","bad","jet","and",],
    ["quiet","aware","limit","feed","shop","soft","gift","blow","shoe","bad","cat","dog",],
    ["quiet","twice","worth","feed","folk","soft","wave","suit","shoe","wine","jet","and",],
    ["dress","grade","worth","feed","folk","soft","deny","suit","shoe","boy","jet","dog",],
    ["dress","grade","broad","path","folk","soft","gift","suit","shoe","boy","cat","dog",],
    ["quiet","grade","broad","path","lift","warm","wave","blow","bone","boy","buy","and",],
    ["quiet","aware","worth","below","folk","warm","deny","suit","shoe","boy","buy","and",],
    ["dress","twice","worth","below","shop","jump","wave","cook","shoe","boy","cat","and",],
    ["chief","grade","broad","below","folk","soft","deny","blow","shoe","bad","cat","and",],
    ["chief","twice","broad","feed","lift","soft","wave","suit","bone","wine","buy","and",],
    ["chief","grade","broad","feed","shop","jump","gift","suit","shoe","bad","jet","and",],
    ["chief","twice","broad","path","shop","jump","deny","suit","shoe","bad","cat","and",],
    ["dress","grade","broad","feed","shop","soft","gift","suit","shoe","bad","cat","dog",],
    ["chief","grade","worth","feed","lift","jump","deny","suit","shoe","bad","cat","dog",],
    ["dress","twice","limit","feed","lift","jump","gift","suit","shoe","bad","cat","dog",],
    ["dress","aware","broad","feed","lift","jump","deny","suit","burn","wine","cat","and",],
    ["dress","grade","limit","below","lift","warm","gift","blow","burn","bad","jet","pig",],
    ["quiet","aware","broad","feed","lift","soft","gift","cook","shoe","bad","buy","and",],
    ["dress","aware","limit","path","folk","warm","deny","suit","bone","bad","jet","and",],
    ["chief","grade","limit","below","shop","jump","deny","cook","shoe","boy","cat","and",],
    ["quiet","twice","limit","feed","lift","jump","deny","cook","bone","boy","jet","dog",],
    ["dress","aware","worth","path","shop","soft","deny","blow","shoe","boy","buy","dog",],
    ["quiet","grade","worth","path","shop","warm","wave","blow","burn","boy","jet","and",],
    ["quiet","twice","broad","below","shop","warm","wave","cook","burn","bad","buy","pig",],
    ["dress","grade","broad","feed","lift","soft","deny","suit","shoe","bad","cat","and",],
    ["chief","aware","broad","below","lift","warm","gift","cook","shoe","boy","cat","pig",],
    ["chief","grade","limit","below","shop","warm","gift","blow","shoe","bad","buy","dog",],
  ];
  List<String> puzzle=['','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',''];

  bool created_puzzle=false;
  int no_connection_one_count=0;
  int no_connection_two_count=0;
  int no_connection_three_count=0;
  int no_connection_four_count=0;
  Random random = new Random();
  List<String> words = ['', '', '', '', '','','','','','','',''];
  int num_rows_and_columns = 8;
  bool word_one_scratch = false;
  bool word_two_scratch = false;
  bool word_three_scratch = false;
  bool word_four_scratch = false;
  bool word_five_scratch = false;
  bool word_six_scratch = false;
  bool word_seven_scratch=false;
  bool word_eight_scratch=false;
  bool word_nine_scratch=false;
  bool word_ten_scratch=false;
  bool word_eleven_scratch=false;
  bool word_twelve_scratch=false;
  int sorted_Num_Words;

//Paint
  bool first_Point_Drawed = false;
  bool init_Pan_Update;
  int number_Of_Words_Selected = 0;
  List<int> solution_positions = [
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
  ];
  int row_start;
  int column_start;
  int row_end = 0;
  int column_end = 0;
  double start_Of_Selection_dx;
  double start_Of_Selection_dy;
  double end_Of_Selection_dx;
  double end_Of_Selection_dy;
  List<DrawingPoints> points = List();
  StrokeCap strokeCap = (Platform.isAndroid) ? StrokeCap.butt : StrokeCap.round;
  Color selected_color;
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

  int _seconds = 0;
  int _minutes =0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home:Scaffold(
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
                            .width / 9 && local.dx < MediaQuery
                        .of(context)
                        .size
                        .width / 18.4 + (column + 1) * MediaQuery
                        .of(context)
                        .size
                        .width / 9

                        && local.dy > MediaQuery
                            .of(context)
                            .size
                            .height / 3.732 + row * MediaQuery
                            .of(context)
                            .size
                            .height / 15 && local.dy < MediaQuery
                        .of(context)
                        .size
                        .height / 3.732 + (row + 1) * MediaQuery
                        .of(context)
                        .size
                        .height / 15) {
                      end_Of_Selection_dx = MediaQuery
                          .of(context)
                          .size
                          .width / 18.4 + (column + 1 / 2) * MediaQuery
                          .of(context)
                          .size
                          .width / 9;
                      end_Of_Selection_dy = MediaQuery
                          .of(context)
                          .size
                          .height / 3.732 + (row + 1 / 2) * MediaQuery
                          .of(context)
                          .size
                          .height / 15;
                      if(row_end!=row || column_end!=column){
                        play_Selection_Sound();
                      }
                      row_end=row;
                      column_end=column;
                      if(!first_Point_Drawed) {
                        points.removeAt(2*number_Of_Words_Selected + 1);
                      }
                      first_Point_Drawed=false;
                      setState(() {
                        points.add(DrawingPoints(
                          radius: MediaQuery
                              .of(context)
                              .size
                              .height / 15,
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
                                .height / 15,
                        ));
                      });
                    }
                  }
                }

              },
              onPanStart: (details)  {
                RenderBox box = context.findRenderObject();
                if(!first_Point_Drawed) {
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
                              .width / 9 && local.dx < MediaQuery
                          .of(context)
                          .size
                          .width / 18.4 + (column + 1) * MediaQuery
                          .of(context)
                          .size
                          .width / 9

                          && local.dy > MediaQuery
                              .of(context)
                              .size
                              .height / 3.732 + row * MediaQuery
                              .of(context)
                              .size
                              .height / 15 && local.dy < MediaQuery
                          .of(context)
                          .size
                          .height / 3.732 + (row + 1) * MediaQuery
                          .of(context)
                          .size
                          .height / 15) {

                        play_Selection_Sound();

                        setState(() {
                          start_Of_Selection_dx=MediaQuery
                              .of(context)
                              .size
                              .width / 18.4 +
                              (column + 1 / 2) * MediaQuery
                                  .of(context)
                                  .size
                                  .width / 9;
                          start_Of_Selection_dy=MediaQuery
                              .of(context)
                              .size
                              .height / 3.732 +
                              (row + 1 / 2) * MediaQuery
                                  .of(context)
                                  .size
                                  .height / 15;

                          row_start=row;
                          column_start=column;
                          points.add(DrawingPoints(
                            radius: MediaQuery
                                .of(context)
                                .size
                                .height / 15,
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
                                  .height / 15,


                          ));
                        });
                      }
                    }
                  }
                }
                first_Point_Drawed=true;
              },

              onPanEnd: (details) {
                bool found_word = false;
                for (int i = 0; i < words.length; i++) {
                  if (
                  (
                      row_start == solution_positions[4 * i] &&
                          column_start == solution_positions[4 * i + 1] &&
                          row_end == solution_positions[4 * i + 2] &&
                          column_end == solution_positions[4 * i + 3])
                      ||
                      (row_start == solution_positions[4 * i + 2] &&
                          column_start == solution_positions[4 * i + 3] &&
                          row_end == solution_positions[4 * i] &&
                          column_end == solution_positions[4 * i + 1])) {
                    found_word = true;
                    play_Found_Sound();
                    number_Of_Words_Selected++;
                    if (i==0) {
                      if(word_one_scratch==true){
                        number_Of_Words_Selected--;
                        points.removeAt(2 * number_Of_Words_Selected + 1);
                        points.removeAt(2 * number_Of_Words_Selected);

                      }
                      setState(() {
                        word_one_scratch = true;
                      });

                    } else if (i==1) {
                      if(word_two_scratch==true){
                        number_Of_Words_Selected--;
                        points.removeAt(2 * number_Of_Words_Selected + 1);
                        points.removeAt(2 * number_Of_Words_Selected);

                      }
                      setState(() {
                        word_two_scratch = true;
                      });
                    } else if (i==2) {
                      if(word_three_scratch==true){
                        number_Of_Words_Selected--;
                        points.removeAt(2 * number_Of_Words_Selected + 1);
                        points.removeAt(2 * number_Of_Words_Selected);
                      }
                      setState(() {
                        word_three_scratch = true;
                      });
                    }
                    else if (i==3) {
                      if(word_four_scratch==true){
                        number_Of_Words_Selected--;
                        points.removeAt(2 * number_Of_Words_Selected + 1);
                        points.removeAt(2 * number_Of_Words_Selected);

                      }
                      setState(() {
                        word_four_scratch = true;
                      });
                    } else if (i==5) {
                      if(word_six_scratch==true){
                        number_Of_Words_Selected--;
                        points.removeAt(2 * number_Of_Words_Selected + 1);
                        points.removeAt(2 * number_Of_Words_Selected);

                      }
                      setState(() {
                        word_six_scratch = true;
                      });
                    }   else if (i==6) {
                      if(word_seven_scratch==true){
                        number_Of_Words_Selected--;
                        points.removeAt(2 * number_Of_Words_Selected + 1);
                        points.removeAt(2 * number_Of_Words_Selected);

                      }
                      setState(() {
                        word_seven_scratch = true;
                      });
                    } else if (i==7) {
                      if(word_eight_scratch==true){
                        number_Of_Words_Selected--;
                        points.removeAt(2 * number_Of_Words_Selected + 1);
                        points.removeAt(2 * number_Of_Words_Selected);

                      }
                      setState(() {
                        word_eight_scratch = true;
                      });
                    }  else if (i==8) {
                      if(word_nine_scratch==true){
                        number_Of_Words_Selected--;
                        points.removeAt(2 * number_Of_Words_Selected + 1);
                        points.removeAt(2 * number_Of_Words_Selected);

                      }
                      setState(() {
                        word_nine_scratch = true;
                      });
                    }else if(i==9){
                      if(word_ten_scratch==true){
                        number_Of_Words_Selected--;
                        points.removeAt(2 * number_Of_Words_Selected + 1);
                        points.removeAt(2 * number_Of_Words_Selected);
                      }
                      setState(() {
                        word_ten_scratch=true;
                      });
                    } else if(i==10){
                      if(word_eleven_scratch==true){
                        number_Of_Words_Selected--;
                        points.removeAt(2 * number_Of_Words_Selected + 1);
                        points.removeAt(2 * number_Of_Words_Selected);
                      }
                      setState(() {
                        word_eleven_scratch=true;
                      });
                    } else if(i==11){
                      if(word_twelve_scratch==true){
                        number_Of_Words_Selected--;
                        points.removeAt(2 * number_Of_Words_Selected + 1);
                        points.removeAt(2 * number_Of_Words_Selected);
                      }
                      setState(() {
                        word_twelve_scratch=true;
                      });
                    } else {
                      if(word_five_scratch==true){
                        number_Of_Words_Selected--;
                        points.removeAt(2 * number_Of_Words_Selected + 1);
                        points.removeAt(2 * number_Of_Words_Selected);

                      }
                      setState(() {
                        word_five_scratch = true;
                      });
                    }
                  }
                }
                if (!found_word) {
                  points.removeAt(2 * number_Of_Words_Selected + 1);
                  points.removeAt(2 * number_Of_Words_Selected);
                  play_Wrong_Sound();
                }
                if (word_one_scratch == true && word_two_scratch == true &&
                    word_three_scratch == true && word_four_scratch == true &&
                    word_five_scratch == true && word_six_scratch == true
                    &&word_seven_scratch==true && word_eight_scratch==true&&
                    word_nine_scratch==true && word_ten_scratch &&
                    word_eleven_scratch==true && word_twelve_scratch==true) {
                  set_Best_Time();
                  setState(() {
                    showAlertDialog(context);
                  });

                }
              },


              child: CustomPaint(
                size: Size.infinite,
                foregroundPainter: DrawingPainter(
                  pointsList: points,
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children:[
                          SizedBox(width:MediaQuery.of(context).size.width/5),
                          Icon(Icons.star,
                              color: GameColors.secondary,
                              size:MediaQuery.of(context).size.width/10),
                          SizedBox(width:MediaQuery.of(context).size.width/10),
                          Icon(
                        Icons.star,
                        color: GameColors.secondary,
                        size: MediaQuery
                            .of(context)
                            .size
                            .height / 7,
                      ),
                          SizedBox(width:MediaQuery.of(context).size.width/10),
                          Icon(Icons.star,
                              color: GameColors.secondary,
                              size:MediaQuery.of(context).size.width/10),
                ]
                      ),
                      Row(
                          children: [
                            SizedBox(width: MediaQuery
                                .of(context)
                                .size
                                .width / 10),
                            Text(AppLocalizations.of(context).translate("game_level_easy"),
                              style: TextStyle(fontSize: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 25,
                                color: Colors.white,),
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
                            return_Timer(),


                          ]
                      ),
                      SizedBox(height: MediaQuery
                          .of(context)
                          .size
                          .height / 25),
                      Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 8 / 10 * 1.1,
                        child: Table(
                          children: [
                            for (int i=0; i< num_rows_and_columns;i++) TableRow(
                              children: [
                                for (int j=0; j< num_rows_and_columns;j++ )
                                  Container(
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width / 10 * 1.1,
                                    height: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 15,
                                    alignment: Alignment.center,
                                    child:
                                    Text(write_Puzzle_Letter(i*num_rows_and_columns+j),
                                      style: TextStyle(fontSize: MediaQuery
                                          .of(context)
                                          .size
                                          .height / 35,fontWeight: FontWeight.bold),),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(MediaQuery
                                          .of(context)
                                          .size
                                          .height / 30),
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
                                  color: GameColors.primary,
                                  spreadRadius: MediaQuery
                                      .of(context)
                                      .size
                                      .height / 100),
                            ],
                            borderRadius: BorderRadius.circular(MediaQuery
                                .of(context)
                                .size
                                .height / 30)
                        ),
                      ),
                      SizedBox(height: MediaQuery
                          .of(context)
                          .size
                          .height / 25),
                      Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 5 / 6,
                        child: Table(
                            children: [
                              TableRow(children: [
                                Row(children: [
                                  SizedBox(width: MediaQuery
                                      .of(context)
                                      .size
                                      .width / 13),
                                  (word_twelve_scratch && sorted_Num_Words == 10)||(word_eleven_scratch && sorted_Num_Words == 9)
                                  ||(word_ten_scratch && sorted_Num_Words == 8)||(word_nine_scratch && sorted_Num_Words == 7) ||
                                      (word_eight_scratch && sorted_Num_Words == 6) ||(word_seven_scratch && sorted_Num_Words == 5) ||
                                      (word_six_scratch && sorted_Num_Words == 4) ||(word_one_scratch && sorted_Num_Words == 11) ||
                                      (word_two_scratch && sorted_Num_Words == 0) ||
                                      (word_three_scratch &&
                                          sorted_Num_Words == 1) ||
                                      (word_four_scratch &&
                                          sorted_Num_Words == 2) ||
                                      (word_five_scratch && sorted_Num_Words == 3)
                                      ? Center(
                                      child: Text(return_Sorted_Words() + ', ',
                                        style: TextStyle(
                                            decoration: TextDecoration.lineThrough,
                                            fontSize: MediaQuery
                                                .of(context)
                                                .size
                                                .height / 30,fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ))
                                      : Center(
                                    child: Text(return_Sorted_Words() + ',',
                                      style: TextStyle(fontSize: MediaQuery
                                          .of(context)
                                          .size
                                          .height / 30,fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),),
                                  SizedBox(width: MediaQuery
                                      .of(context)
                                      .size
                                      .width / 30),
                                  (word_twelve_scratch && sorted_Num_Words == 10)||(word_eleven_scratch && sorted_Num_Words == 9)
                                      ||(word_ten_scratch && sorted_Num_Words == 8)||(word_nine_scratch && sorted_Num_Words == 7) ||
                                      (word_eight_scratch && sorted_Num_Words == 6) ||(word_seven_scratch && sorted_Num_Words == 5) ||
                                      (word_six_scratch && sorted_Num_Words == 4) ||(word_one_scratch && sorted_Num_Words == 11) ||
                                      (word_two_scratch && sorted_Num_Words == 0) ||
                                      (word_three_scratch &&
                                          sorted_Num_Words == 1) ||
                                      (word_four_scratch &&
                                          sorted_Num_Words == 2) ||
                                      (word_five_scratch && sorted_Num_Words == 3)
                                      ? Center(
                                      child: Text(return_Sorted_Words() + ', ',
                                        style: TextStyle(
                                            decoration: TextDecoration.lineThrough,
                                            fontSize: MediaQuery
                                                .of(context)
                                                .size
                                                .height / 30,fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ))
                                      : Center(
                                    child: Text(return_Sorted_Words() + ',',
                                      style: TextStyle(fontSize: MediaQuery
                                          .of(context)
                                          .size
                                          .height / 30,fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),),
                                  SizedBox(width: MediaQuery
                                      .of(context)
                                      .size
                                      .width / 30),

                                  (word_twelve_scratch && sorted_Num_Words == 10)||(word_eleven_scratch && sorted_Num_Words == 9)
                                      ||(word_ten_scratch && sorted_Num_Words == 8)||(word_nine_scratch && sorted_Num_Words == 7) ||
                                      (word_eight_scratch && sorted_Num_Words == 6) ||(word_seven_scratch && sorted_Num_Words == 5) ||
                                      (word_six_scratch && sorted_Num_Words == 4) ||(word_one_scratch && sorted_Num_Words == 11) ||
                                      (word_two_scratch && sorted_Num_Words == 0) ||
                                      (word_three_scratch &&
                                          sorted_Num_Words == 1) ||
                                      (word_four_scratch &&
                                          sorted_Num_Words == 2) ||
                                      (word_five_scratch && sorted_Num_Words == 3)
                                      ? Center(child: Text(return_Sorted_Words()+',',
                                    style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        fontSize: MediaQuery
                                            .of(context)
                                            .size
                                            .height / 30,fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),)
                                      : Center(child: Text(return_Sorted_Words()+',',
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 30,fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  ),
                                  SizedBox(width: MediaQuery
                                      .of(context)
                                      .size
                                      .width / 30),
                                  (word_twelve_scratch && sorted_Num_Words == 10)||(word_eleven_scratch && sorted_Num_Words == 9)
                                      ||(word_ten_scratch && sorted_Num_Words == 8)||(word_nine_scratch && sorted_Num_Words == 7) ||
                                      (word_eight_scratch && sorted_Num_Words == 6) ||(word_seven_scratch && sorted_Num_Words == 5) ||
                                      (word_six_scratch && sorted_Num_Words == 4) ||(word_one_scratch && sorted_Num_Words == 11) ||
                                      (word_two_scratch && sorted_Num_Words == 0) ||
                                      (word_three_scratch &&
                                          sorted_Num_Words == 1) ||
                                      (word_four_scratch &&
                                          sorted_Num_Words == 2) ||
                                      (word_five_scratch && sorted_Num_Words == 3)
                                      ? Center(child: Text(return_Sorted_Words(),
                                    style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        fontSize: MediaQuery
                                            .of(context)
                                            .size
                                            .height / 30,fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),)
                                      : Center(child: Text(return_Sorted_Words(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 30,fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  ),
                                ]
                                ),
                              ]
                              ),



                              TableRow(children: [
                                Row(children: [
                                  SizedBox(width: MediaQuery
                                      .of(context)
                                      .size
                                      .width / 13),
                                  (word_twelve_scratch && sorted_Num_Words == 10)||(word_eleven_scratch && sorted_Num_Words == 9)
                                      ||(word_ten_scratch && sorted_Num_Words == 8)||(word_nine_scratch && sorted_Num_Words == 7) ||
                                      (word_eight_scratch && sorted_Num_Words == 6) ||(word_seven_scratch && sorted_Num_Words == 5) ||
                                      (word_six_scratch && sorted_Num_Words == 4) ||(word_one_scratch && sorted_Num_Words == 11) ||
                                      (word_two_scratch && sorted_Num_Words == 0) ||
                                      (word_three_scratch &&
                                          sorted_Num_Words == 1) ||
                                      (word_four_scratch &&
                                          sorted_Num_Words == 2) ||
                                      (word_five_scratch && sorted_Num_Words == 3)
                                      ? Center(
                                      child: Text(return_Sorted_Words() + ', ',
                                        style: TextStyle(
                                            decoration: TextDecoration.lineThrough,
                                            fontSize: MediaQuery
                                                .of(context)
                                                .size
                                                .height / 30,fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ))
                                      : Center(
                                    child: Text(return_Sorted_Words() + ',',
                                      style: TextStyle(fontSize: MediaQuery
                                          .of(context)
                                          .size
                                          .height / 30,fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),),
                                  SizedBox(width: MediaQuery
                                      .of(context)
                                      .size
                                      .width / 30),
                                  (word_twelve_scratch && sorted_Num_Words == 10)||(word_eleven_scratch && sorted_Num_Words == 9)
                                      ||(word_ten_scratch && sorted_Num_Words == 8)||(word_nine_scratch && sorted_Num_Words == 7) ||
                                      (word_eight_scratch && sorted_Num_Words == 6) ||(word_seven_scratch && sorted_Num_Words == 5) ||
                                      (word_six_scratch && sorted_Num_Words == 4) ||(word_one_scratch && sorted_Num_Words == 11) ||
                                      (word_two_scratch && sorted_Num_Words == 0) ||
                                      (word_three_scratch &&
                                          sorted_Num_Words == 1) ||
                                      (word_four_scratch &&
                                          sorted_Num_Words == 2) ||
                                      (word_five_scratch && sorted_Num_Words == 3)
                                      ? Center(
                                      child: Text(return_Sorted_Words() + ', ',
                                        style: TextStyle(
                                            decoration: TextDecoration.lineThrough,
                                            fontSize: MediaQuery
                                                .of(context)
                                                .size
                                                .height / 30,fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ))
                                      : Center(
                                    child: Text(return_Sorted_Words() + ',',
                                      style: TextStyle(fontSize: MediaQuery
                                          .of(context)
                                          .size
                                          .height / 30,fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),),
                                  SizedBox(width: MediaQuery
                                      .of(context)
                                      .size
                                      .width / 30),

                                  (word_twelve_scratch && sorted_Num_Words == 10)||(word_eleven_scratch && sorted_Num_Words == 9)
                                      ||(word_ten_scratch && sorted_Num_Words == 8)||(word_nine_scratch && sorted_Num_Words == 7) ||
                                      (word_eight_scratch && sorted_Num_Words == 6) ||(word_seven_scratch && sorted_Num_Words == 5) ||
                                      (word_six_scratch && sorted_Num_Words == 4) ||(word_one_scratch && sorted_Num_Words == 11) ||
                                      (word_two_scratch && sorted_Num_Words == 0) ||
                                      (word_three_scratch &&
                                          sorted_Num_Words == 1) ||
                                      (word_four_scratch &&
                                          sorted_Num_Words == 2) ||
                                      (word_five_scratch && sorted_Num_Words == 3)
                                      ? Center(child: Text(return_Sorted_Words()+',',
                                    style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        fontSize: MediaQuery
                                            .of(context)
                                            .size
                                            .height / 30,fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),)
                                      : Center(child: Text(return_Sorted_Words()+',',
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 30,fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  ),
                                  SizedBox(width: MediaQuery
                                      .of(context)
                                      .size
                                      .width / 30),
                                  (word_twelve_scratch && sorted_Num_Words == 10)||(word_eleven_scratch && sorted_Num_Words == 9)
                                      ||(word_ten_scratch && sorted_Num_Words == 8)||(word_nine_scratch && sorted_Num_Words == 7) ||
                                      (word_eight_scratch && sorted_Num_Words == 6) ||(word_seven_scratch && sorted_Num_Words == 5) ||
                                      (word_six_scratch && sorted_Num_Words == 4) ||(word_one_scratch && sorted_Num_Words == 11) ||
                                      (word_two_scratch && sorted_Num_Words == 0) ||
                                      (word_three_scratch &&
                                          sorted_Num_Words == 1) ||
                                      (word_four_scratch &&
                                          sorted_Num_Words == 2) ||
                                      (word_five_scratch && sorted_Num_Words == 3)
                                      ? Center(child: Text(return_Sorted_Words(),
                                    style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        fontSize: MediaQuery
                                            .of(context)
                                            .size
                                            .height / 30,fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),)
                                      : Center(child: Text(return_Sorted_Words(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 30,fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  ),
                                ]
                                ),
                              ]
                              ),

                              TableRow(children: [
                                Row(children: [
                                  SizedBox(width: MediaQuery
                                      .of(context)
                                      .size
                                      .width / 13),
                                  (word_twelve_scratch && sorted_Num_Words == 10)||(word_eleven_scratch && sorted_Num_Words == 9)
                                      ||(word_ten_scratch && sorted_Num_Words == 8)||(word_nine_scratch && sorted_Num_Words == 7) ||
                                      (word_eight_scratch && sorted_Num_Words == 6) ||(word_seven_scratch && sorted_Num_Words == 5) ||
                                      (word_six_scratch && sorted_Num_Words == 4) ||(word_one_scratch && sorted_Num_Words == 11) ||
                                      (word_two_scratch && sorted_Num_Words == 0) ||
                                      (word_three_scratch &&
                                          sorted_Num_Words == 1) ||
                                      (word_four_scratch &&
                                          sorted_Num_Words == 2) ||
                                      (word_five_scratch && sorted_Num_Words == 3)
                                      ? Center(
                                      child: Text(return_Sorted_Words() + ', ',
                                        style: TextStyle(
                                            decoration: TextDecoration.lineThrough,
                                            fontSize: MediaQuery
                                                .of(context)
                                                .size
                                                .height / 30,fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ))
                                      : Center(
                                    child: Text(return_Sorted_Words() + ',',
                                      style: TextStyle(fontSize: MediaQuery
                                          .of(context)
                                          .size
                                          .height / 30,fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),),
                                  SizedBox(width: MediaQuery
                                      .of(context)
                                      .size
                                      .width / 30),
                                  (word_twelve_scratch && sorted_Num_Words == 10)||(word_eleven_scratch && sorted_Num_Words == 9)
                                      ||(word_ten_scratch && sorted_Num_Words == 8)||(word_nine_scratch && sorted_Num_Words == 7) ||
                                      (word_eight_scratch && sorted_Num_Words == 6) ||(word_seven_scratch && sorted_Num_Words == 5) ||
                                      (word_six_scratch && sorted_Num_Words == 4) ||(word_one_scratch && sorted_Num_Words == 11) ||
                                      (word_two_scratch && sorted_Num_Words == 0) ||
                                      (word_three_scratch &&
                                          sorted_Num_Words == 1) ||
                                      (word_four_scratch &&
                                          sorted_Num_Words == 2) ||
                                      (word_five_scratch && sorted_Num_Words == 3)
                                      ? Center(
                                      child: Text(return_Sorted_Words() + ', ',
                                        style: TextStyle(
                                            decoration: TextDecoration.lineThrough,
                                            fontSize: MediaQuery
                                                .of(context)
                                                .size
                                                .height / 30,fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ))
                                      : Center(
                                    child: Text(return_Sorted_Words() + ',',
                                      style: TextStyle(fontSize: MediaQuery
                                          .of(context)
                                          .size
                                          .height / 30,fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),),
                                  SizedBox(width: MediaQuery
                                      .of(context)
                                      .size
                                      .width / 30),

                                  (word_twelve_scratch && sorted_Num_Words == 10)||(word_eleven_scratch && sorted_Num_Words == 9)
                                      ||(word_ten_scratch && sorted_Num_Words == 8)||(word_nine_scratch && sorted_Num_Words == 7) ||
                                      (word_eight_scratch && sorted_Num_Words == 6) ||(word_seven_scratch && sorted_Num_Words == 5) ||
                                      (word_six_scratch && sorted_Num_Words == 4) ||(word_one_scratch && sorted_Num_Words == 11) ||
                                      (word_two_scratch && sorted_Num_Words == 0) ||
                                      (word_three_scratch &&
                                          sorted_Num_Words == 1) ||
                                      (word_four_scratch &&
                                          sorted_Num_Words == 2) ||
                                      (word_five_scratch && sorted_Num_Words == 3)
                                      ? Center(child: Text(return_Sorted_Words()+',',
                                    style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        fontSize: MediaQuery
                                            .of(context)
                                            .size
                                            .height / 30,fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),)
                                      : Center(child: Text(return_Sorted_Words()+',',
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 30,fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  ),
                                  SizedBox(width: MediaQuery
                                      .of(context)
                                      .size
                                      .width / 30),
                                  (word_twelve_scratch && sorted_Num_Words == 10)||(word_eleven_scratch && sorted_Num_Words == 9)
                                      ||(word_ten_scratch && sorted_Num_Words == 8)||(word_nine_scratch && sorted_Num_Words == 7) ||
                                      (word_eight_scratch && sorted_Num_Words == 6) ||(word_seven_scratch && sorted_Num_Words == 5) ||
                                      (word_six_scratch && sorted_Num_Words == 4) ||(word_one_scratch && sorted_Num_Words == 11) ||
                                      (word_two_scratch && sorted_Num_Words == 0) ||
                                      (word_three_scratch &&
                                          sorted_Num_Words == 1) ||
                                      (word_four_scratch &&
                                          sorted_Num_Words == 2) ||
                                      (word_five_scratch && sorted_Num_Words == 3)
                                      ? Center(child: Text(return_Sorted_Words(),
                                    style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        fontSize: MediaQuery
                                            .of(context)
                                            .size
                                            .height / 30,fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),)
                                      : Center(child: Text(return_Sorted_Words(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 30,fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
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
                                color: GameColors.primary,
                                spreadRadius: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 100),

                          ],
                          borderRadius: BorderRadius.circular(MediaQuery
                              .of(context)
                              .size
                              .height / 30),
                        ),
                      ),
                    ]
                ),
              ),
            ),
          ),

        )
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

    return letters[random.nextInt(26)];
  }



  create_Puzzle_Random() {
    if(!created_puzzle) {
      created_puzzle=true;
      int i =random.nextInt(1000);
      puzzle=all_puzzles[i];
      solution_positions=all_solutions[i];
      words=all_words[i];
      sorted_Num_Words = random.nextInt(9) - 1;
      next_Color = random.nextInt(5);
    }
  }

  String return_Sorted_Words() {
    sorted_Num_Words++;
    if (sorted_Num_Words == 12) {
      sorted_Num_Words = 0;
    }
    return words[sorted_Num_Words].toUpperCase();
  }

  String write_Puzzle_Letter(int i) {
    create_Puzzle_Random();
    return puzzle[0][i].toUpperCase();
  }



  Color serie_Color() {
    next_Color++;
    if(next_Color==5){
      next_Color=0;
    }
    selected_color = colors[next_Color];
    return selected_color;
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
    if (!word_one_scratch || !word_two_scratch || !word_three_scratch ||
        !word_five_scratch || !word_six_scratch || !word_seven_scratch||!word_eight_scratch||!word_nine_scratch) {
      _seconds++;
      if (_seconds == 60) {
        _minutes++;
        _seconds = 0;
      }
      setState(() {});
    }
  }
  Text return_Timer() {

    Duration duration = Duration(seconds: _seconds + 60 * _minutes);
    return Text(_stringDuration(duration),
      style: TextStyle(fontSize: MediaQuery
          .of(context)
          .size
          .height / 25,
        color: Colors.white,),);

  }
  String _stringDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }
  set_Best_Time() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int time_now=_minutes*60+_seconds;
    int old_best_time_minutes = (prefs.getInt('best_time_easy_minutes') ?? null);
    int old_best_time_seconds=(prefs.getInt('best_time_easy_seconds') ?? null);
    int old_time;
    if(old_best_time_minutes==null ||old_best_time_seconds==null){
      old_time=0;
    }else {
      old_time = old_best_time_minutes * 60 + old_best_time_seconds;
    }
    if(time_now<old_time || old_time==0){
      prefs.setInt('best_time_easy_minutes', _minutes);
      prefs.setInt('best_time_easy_seconds', _seconds);
      String best_time=_stringDuration(Duration(seconds:60*_minutes+_seconds));
      prefs.setString('best_time_easy', best_time);
      Navigator.of(context).pushNamed("/stats");
    }
  }

  play_Found_Sound () async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool("has_Sounds") == true) {
      audioPlayer.play('sounds/foundsound.wav');
    }
  }
  play_Wrong_Sound() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool("has_Sounds") == true) {
      audioPlayer.play('sounds/wrongsound.wav');
    }
  }
  play_Selection_Sound() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getBool("has_Sounds")==true) {
      audioPlayer.play('sounds/selectionsound.wav');
    }
  }

  showAlertDialog(BuildContext context) {

    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () { Navigator.pop(navigatorKey.currentState.overlay.context,);
      Navigator.pop(context);},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("You won"),
      content:  Text('Congratulations your time was '+_stringDuration(Duration(seconds: _seconds + 60 * _minutes))),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: navigatorKey.currentState.overlay.context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}