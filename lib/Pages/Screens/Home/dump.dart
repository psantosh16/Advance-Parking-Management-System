// Column(
// children: [
// // Username
// Container(
// padding: const EdgeInsets.all(20),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// // Menu Button
// Container(
// width: 40,
// decoration: BoxDecoration(
// color: Colors.grey[400],
// borderRadius: const BorderRadius.all(
// Radius.circular(12),
// ),
// ),
// child: GestureDetector(
// onTap: () {
// controller.openDrawer();
// },
// child: const Icon(
// Icons.menu,
// size: 35,
// ),
// ),
// ),
//
// // Username
// const Column(
// crossAxisAlignment: CrossAxisAlignment.end,
// children: [
// Text(
// 'Hi, John!',
// style: TextStyle(
// fontSize: 30,
// fontWeight: FontWeight.bold,
// color: Colors.white),
// ),
// Text(
// '23 Jan, 2023',
// style: TextStyle(
// color: Colors.white,
// fontSize: 12,
// fontWeight: FontWeight.w600),
// ),
// ],
// ),
// ],
// ),
// ),
// const SizedBox(height: 40),
//
// const Text(
// "Welcome to PARKIZA",
// style: TextStyle(
// color: Colors.white,
// fontSize: 28,
// fontWeight: FontWeight.w700),
// ),
//
// // Bottom
// const SizedBox(height: 50),
// // buildBottom(context),
// Expanded(
// child: DraggableScrollableSheet(
// initialChildSize: 1,
// // minChildSize: 0.9,
// builder: (BuildContext context,
// ScrollController scrollController) {
// return Container(
// decoration: const BoxDecoration(
// color: Colors.white,
// borderRadius: BorderRadius.only(
// topRight: Radius.circular(30),
// topLeft: Radius.circular(30),
// ),
// ),
// );
// }),
// )
// ],
// ),