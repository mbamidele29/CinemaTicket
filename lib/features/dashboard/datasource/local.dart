import 'package:cinema_ticket/core/entities/cast.dart';
import 'package:cinema_ticket/core/entities/crew.dart';
import 'package:cinema_ticket/core/entities/movie.dart';
import 'package:cinema_ticket/core/entities/show_date.dart';
import 'package:flutter/material.dart';

List<Movie> localDataMovies=[
  Movie(
    id: 1,
    title: 'Free',
    cost: 20.99,
    storyline: 'Quis amet quis laborum sit commodo ut magna amet aute incididunt esse occaecat ut. Velit consectetur et non nostrud fugiat eiusmod aliquip in enim incididunt in incididunt. Est laboris occaecat reprehenderit eiusmod quis aute nostrud aute exercitation duis adipisicing. Adipisicing ea dolor minim esse reprehenderit in anim occaecat occaecat.\n\nQuis ut sit consequat veniam aute. Reprehenderit esse commodo sint deserunt irure cupidatat consectetur sint officia aliquip. Ex esse mollit laboris dolore occaecat adipisicing nulla tempor sit commodo elit quis. Cupidatat qui cupidatat nostrud anim. Consectetur quis eu ut ut velit ea incididunt mollit aliquip quis eiusmod anim. Nulla aute in ipsum cupidatat exercitation amet nisi laborum enim magna.\n\nNostrud ea consectetur Lorem sit voluptate id. Officia cillum ad laboris voluptate commodo consectetur et eu do aute. Ullamco deserunt amet ex quis ea. Dolore quis non elit velit.\n\nAnim fugiat sunt amet proident cillum elit non magna proident dolor deserunt amet deserunt. Ex culpa ex magna nulla id aliqua cillum proident ea minim. Veniam ullamco consectetur commodo aliqua. Veniam nisi consectetur anim mollit ad cupidatat enim cupidatat aliqua consequat ad. Nostrud voluptate ex eu ullamco. Aliqua nulla sit pariatur amet adipisicing nulla labore. Exercitation do labore Lorem pariatur cupidatat excepteur ea ex irure.\n\nMagna mollit tempor nisi mollit ipsum. In est dolor fugiat qui dolor sint occaecat sit mollit fugiat eu proident aute commodo. Eu anim reprehenderit qui reprehenderit dolor elit nisi.\n\nFugiat est minim consequat non. Esse velit esse amet cillum velit mollit laborum sit dolore anim. Eiusmod consectetur officia ut officia reprehenderit nostrud veniam laboris.',
    review: 'Occaecat commodo ad mollit tempor. Aliqua fugiat magna amet consectetur esse ullamco. Aliqua dolore Lorem quis tempor enim laborum anim Lorem. Voluptate ex nostrud cupidatat et est. Lorem et duis qui ad nostrud consequat velit proident id. Est consectetur sint voluptate consequat adipisicing enim sint est adipisicing. Officia et ullamco incididunt esse sint sint cillum ea culpa nisi in proident.\nReprehenderit officia officia reprehenderit cillum fugiat laboris excepteur. Pariatur nulla veniam do culpa. Laborum aliquip laboris qui labore ut.',
    posterImage: 'assets/images/green_lantern_poster.jpg', 
    backgroundImage: 'assets/images/green_lantern.jpeg', 
    rating: 3.5,
    tags: ['Sci-fi', 'Fantasy', 'Comedy'],
    trailerUrl: 'assets/videos/jumanji.mp4',
    casts: [
      Cast('Firstname Lastname', 'assets/images/cast.jpeg'),
      Cast('Firstname Lastname', 'assets/images/cast.jpeg'),
      Cast('Firstname Lastname', 'assets/images/cast.jpeg'),
      Cast('Firstname Lastname', 'assets/images/cast.jpeg'),
    ],
    gallery: [
      'assets/images/jumanji.jpg',
      'assets/images/jumanji.jpg',
      'assets/images/jumanji.jpg',
      'assets/images/jumanji.jpg',
      'assets/images/jumanji.jpg',
    ],
    showDate: [
      ShowDate(1, DateTime.now(), [TimeOfDay.now(), TimeOfDay.now(), TimeOfDay.now(), TimeOfDay.now(), TimeOfDay.now()]),
      ShowDate(2, DateTime.now(), [TimeOfDay.now(), TimeOfDay.now(), TimeOfDay.now(), TimeOfDay.now(), TimeOfDay.now()]),
      ShowDate(3, DateTime.now(), [TimeOfDay.now(), TimeOfDay.now(), TimeOfDay.now(), TimeOfDay.now(), TimeOfDay.now()]),
      ShowDate(4, DateTime.now(), [TimeOfDay.now(), TimeOfDay.now(), TimeOfDay.now(), TimeOfDay.now(), TimeOfDay.now()]),
      ShowDate(5, DateTime.now(), [TimeOfDay.now(), TimeOfDay.now(), TimeOfDay.now(), TimeOfDay.now(), TimeOfDay.now()]),
      ShowDate(6, DateTime.now(), [TimeOfDay.now(), TimeOfDay.now(), TimeOfDay.now(), TimeOfDay.now(), TimeOfDay.now()]),
    ],
    crew: Crew(director: 'Dennis Villeneus', year: '2021', duration: '155 min', distribution: 'Warner Bros'),
  ),
  Movie(
    id: 2,
    title: 'Jumanji',
    cost: 29.99,
    storyline: 'Ea minim ad id pariatur culpa ad fugiat. Aute cillum amet ea laborum consectetur reprehenderit quis. Dolor consectetur aute excepteur ea. In quis laboris do veniam laboris ad in laborum non ea aliquip sunt culpa esse. Cillum Lorem qui tempor commodo Lorem nisi dolor velit nisi velit aliqua laborum ipsum. Aute cillum elit amet dolore irure qui cillum occaecat elit enim nostrud. Ipsum officia Lorem officia excepteur sint nisi duis eu ullamco.\n\nElit deserunt cupidatat consequat ullamco sint cillum voluptate ut duis id id commodo. Reprehenderit proident cillum consectetur esse anim qui ad duis. Velit sint consequat officia laboris exercitation. Reprehenderit ut eu proident nisi nisi cillum sint ullamco eiusmod do et aliquip ex velit. Commodo minim quis ea quis nostrud incididunt ipsum proident id incididunt excepteur ipsum commodo. Lorem dolor aliqua ex tempor culpa.\n\nMagna irure amet ad non irure sunt sint enim reprehenderit incididunt consectetur magna. Aliqua ex quis do in non aliqua tempor. Magna eiusmod amet Lorem reprehenderit. Dolore nulla velit quis nisi dolore sit esse labore cupidatat exercitation dolor sunt culpa. Eiusmod reprehenderit occaecat dolor ullamco sunt ad exercitation adipisicing incididunt culpa id.\n\nDolore cupidatat culpa esse duis reprehenderit anim cillum eiusmod occaecat magna veniam. Reprehenderit ipsum velit cillum pariatur officia eiusmod non quis aliquip anim qui. Do culpa amet voluptate anim aliquip ut commodo pariatur sit veniam eiusmod commodo. Commodo laboris incididunt consectetur sunt irure magna duis. Aliqua tempor velit officia ipsum tempor eiusmod tempor excepteur incididunt ex exercitation duis in. Qui dolore amet est pariatur non laboris non. Minim do cillum incididunt consequat ipsum amet eu.\n\nIrure cillum voluptate ea laboris sit aliquip officia eiusmod duis et non. Mollit minim veniam ullamco do tempor mollit amet. Aliquip eiusmod velit fugiat mollit dolor sit ipsum deserunt officia sit ad. Enim ad proident incididunt aliquip dolor voluptate eu est eiusmod id enim consequat aliqua. In ex in in ea dolor incididunt nisi. Minim minim duis reprehenderit ad labore sunt veniam do.\n\nTempor nulla veniam ex ut adipisicing irure nulla. Incididunt anim labore ea commodo proident cillum aliqua anim laborum. Velit ea eiusmod commodo nostrud tempor dolore ea laboris sit voluptate et mollit. Velit mollit deserunt nostrud dolor ullamco. Ex irure cillum enim nostrud laboris officia dolore proident ipsum ipsum duis sit consequat fugiat. Duis excepteur irure Lorem culpa labore duis aliquip pariatur consectetur nisi cillum.',
    review: 'Deserunt ad voluptate in duis Lorem laboris ut sit fugiat. Sunt exercitation nisi consectetur exercitation ad. Nulla voluptate cillum mollit irure culpa esse elit culpa reprehenderit veniam ea laboris cupidatat. Nulla nisi non anim Lorem ullamco ullamco non tempor incididunt nulla incididunt. Consectetur qui cupidatat ad duis sunt officia duis commodo eu Lorem duis. Id et aliquip cupidatat aliquip sit officia aliquip consequat quis. Dolore consequat est nisi ea ea ipsum proident irure sint mollit sit veniam aliquip.\nEu consequat aute duis cupidatat adipisicing nulla qui quis culpa. Tempor non quis exercitation magna ut sint velit veniam labore tempor sunt veniam do duis. Ullamco qui incididunt do magna sint aliqua nisi. Quis proident non adipisicing nisi sunt ex quis. Voluptate mollit culpa ex esse eu. Culpa quis magna commodo quis dolor ut nulla quis ad aliquip. Lorem enim ipsum enim labore in id est labore irure culpa nulla.',
    posterImage: 'assets/images/jumanji_poster.jpeg', 
    backgroundImage: 'assets/images/jumanji.jpg', 
    rating: 4,
    tags: ['Wild', 'Jungle', 'Drama'],
    trailerUrl: 'assets/videos/jumanji.mp4',
    casts: [
      Cast('Firstname Lastname', 'assets/images/cast.jpeg'),
      Cast('Firstname Lastname', 'assets/images/cast.jpeg'),
      Cast('Firstname Lastname', 'assets/images/cast.jpeg'),
      Cast('Firstname Lastname', 'assets/images/cast.jpeg'),
    ],
    gallery: [
      'assets/images/jumanji.jpg',
      'assets/images/jumanji.jpg',
      'assets/images/jumanji.jpg',
    ],
    showDate: [
      ShowDate(1, DateTime.now(), [TimeOfDay.now(), TimeOfDay.now(), TimeOfDay.now(), TimeOfDay.now(), TimeOfDay.now()]),
      ShowDate(2, DateTime.now(), [TimeOfDay.now(), TimeOfDay.now(), TimeOfDay.now(), TimeOfDay.now(), TimeOfDay.now()]),
      ShowDate(3, DateTime.now(), [TimeOfDay.now(), TimeOfDay.now(), TimeOfDay.now(), TimeOfDay.now(), TimeOfDay.now()]),
      ShowDate(4, DateTime.now(), [TimeOfDay.now(), TimeOfDay.now(), TimeOfDay.now(), TimeOfDay.now(), TimeOfDay.now()]),
      ShowDate(5, DateTime.now(), [TimeOfDay.now(), TimeOfDay.now(), TimeOfDay.now(), TimeOfDay.now(), TimeOfDay.now()]),
    ],
    crew: Crew(director: 'Dennis Villeneus', year: '2021', duration: '155 min', distribution: 'Warner Bros'),
  ),
  Movie(
    id: 4,
    title: 'Toy Story',
    cost: 9.99,
    storyline: 'Ullamco adipisicing minim dolor qui fugiat Lorem minim sunt ad ex. Nisi veniam minim deserunt sunt esse laborum fugiat dolor. Duis est do id laboris est officia velit magna mollit mollit.\n\nOfficia sit commodo et veniam enim culpa eu. Ex laborum id velit exercitation Lorem id qui aute esse proident mollit laboris. Dolor laboris tempor culpa amet sint et quis sint et aliqua.\n\nIrure laborum aute qui ex sunt mollit consequat. Minim Lorem sunt aliquip commodo proident proident nostrud incididunt fugiat. Sit qui consequat eiusmod est nostrud ex minim officia ut sit. Aute dolore laboris labore cupidatat labore excepteur velit do veniam sit. Elit aliqua duis cillum id exercitation consequat. Officia ex excepteur minim sint dolore minim.\n\nPariatur dolore reprehenderit est pariatur amet pariatur dolor amet ex reprehenderit do. Sint occaecat laboris dolor irure non sunt. Ad officia est culpa consectetur ea. Exercitation ad velit officia ullamco dolor reprehenderit.\n\nEiusmod sunt duis qui nostrud labore id amet quis. Minim sint nulla Lorem laboris cupidatat dolor sunt anim cillum qui est. Sint laboris dolore ut aliqua eu est voluptate non culpa eiusmod qui sunt. Est tempor id mollit aute irure est cillum laboris magna nulla eiusmod fugiat excepteur laboris. Labore est sunt laboris cupidatat incididunt dolor velit pariatur ex. Irure commodo irure amet enim ad. Cupidatat dolore aute eiusmod tempor commodo.\n\nOfficia elit qui culpa ut irure Lorem in adipisicing. Dolore consequat irure deserunt Lorem culpa magna id id cillum consequat nostrud ad. Nisi eu sint in id amet consectetur proident voluptate id sit ullamco aliquip quis voluptate. Irure qui ut consectetur ad velit occaecat. Duis Lorem laborum ea officia voluptate Lorem incididunt incididunt incididunt exercitation id.',
    review: 'Esse nostrud do id sit. Et in aliquip pariatur proident minim labore. Minim occaecat magna occaecat voluptate aute et qui mollit proident quis ad amet velit. Commodo officia incididunt mollit officia commodo pariatur voluptate irure sit in elit ut. Adipisicing ut cillum irure labore duis sunt nisi commodo amet. Mollit pariatur qui ex cillum fugiat sint aliqua anim tempor reprehenderit.\nConsequat culpa non qui nulla. Id proident ea tempor veniam duis officia consequat officia voluptate ea aliqua. Sint sunt aliquip labore ad in. Magna esse commodo ad esse mollit labore irure elit officia irure proident occaecat. Enim veniam nisi cupidatat nulla officia nulla ad ea culpa est nostrud mollit eu aliqua.',
    posterImage: 'assets/images/toy_story_poster.jpeg', 
    backgroundImage: 'assets/images/toy_story.jpeg', 
    rating: 5,
    tags: ['Fantasy', 'Animation'],
    trailerUrl: 'assets/videos/jumanji.mp4',
    casts: [
      Cast('Firstname Lastname', 'assets/images/cast.jpeg'),
      Cast('Firstname Lastname', 'assets/images/cast.jpeg'),
      Cast('Firstname Lastname', 'assets/images/cast.jpeg'),
      Cast('Firstname Lastname', 'assets/images/cast.jpeg'),
    ],
    gallery: [
      'assets/images/toy_story.jpeg',
      'assets/images/toy_story.jpeg',
      'assets/images/toy_story.jpeg',
      'assets/images/toy_story.jpeg',
    ],
    showDate: [
      ShowDate(1, DateTime.now(), [TimeOfDay.now(), TimeOfDay.now(), TimeOfDay.now(), TimeOfDay.now(), TimeOfDay.now()]),
      ShowDate(2, DateTime.now(), [TimeOfDay.now(), TimeOfDay.now(), TimeOfDay.now(), TimeOfDay.now(), TimeOfDay.now()]),
      ShowDate(3, DateTime.now(), [TimeOfDay.now(), TimeOfDay.now(), TimeOfDay.now(), TimeOfDay.now(), TimeOfDay.now()]),
    ],
    crew: Crew(director: 'Dennis Villeneus', year: '2021', duration: '155 min', distribution: 'Warner Bros'),
  ),
];