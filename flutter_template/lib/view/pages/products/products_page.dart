import 'package:sample_project/core/core.dart';
import 'package:sample_project/view/pages/products/products_controller.dart';
import 'package:u/utilities.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> with ProductController {
  @override
  Widget build(final BuildContext context) => UScaffold(
        body: Obx(() {
          if (state.isLoading())
            return const CircularProgressIndicator();
          else if (state.isLoaded())
            return ListView();
          else if (state.isEmpty())
            return Text(s.emptyList).alignAtCenter();
          else if (state.isError())
            return Text(s.error).alignAtCenter();
          else
            return const SizedBox();
        }),
      );
}
