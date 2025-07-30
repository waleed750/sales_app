import 'dart:developer';
import '/core/widgets/loader_widget.dart';

import '../core_export.dart';
import 'paginated_widget.dart';

class PaginatedGridWidget<T> extends StatefulWidget {
  const PaginatedGridWidget({
    super.key,
    required this.items,
    required this.itemBuilder,
    required this.loadMore,
    this.crossAxisCount = 2, // Default to 2 columns in the grid
    this.mainAxisSpacing = 5.0,
    this.crossAxisSpacing = 8.0,
    this.childAspectRatio = 0.72,
    this.loadingIndicator,
    this.emptyState,
  });

  final List<T> items;
  final ItemBuilder<T> itemBuilder;
  final LoadMoreCallback<T> loadMore;
  final int crossAxisCount;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final double childAspectRatio;
  final Widget? loadingIndicator;
  final Widget? emptyState;

  @override
  State<PaginatedGridWidget<T>> createState() => _PaginatedGridWidgetState<T>();
}

class _PaginatedGridWidgetState<T> extends State<PaginatedGridWidget<T>> {
  final ScrollController _scrollController = ScrollController();
  final List<T> _items = [];
  bool _isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    _items.addAll(widget.items);
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent) {
      _loadMore();
    }
  }

  Future<void> _loadMore() async {
    if (_isLoadingMore) return;

    setState(() {
      _isLoadingMore = true;
    });

    try {
      final newItems = await widget.loadMore();
      if (newItems.isNotEmpty) {
        setState(() {
          _items.addAll(newItems);
        });
      }
    } catch (e) {
      log('Error loading more items: $e');
    } finally {
      setState(() {
        _isLoadingMore = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_items.isEmpty) {
      return widget.emptyState ??
          Center(child: Text(AppStrings.tr.noItemsAvailable));
    }

    return GridView.builder(
      controller: _scrollController,
      physics: const BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: widget.crossAxisCount,
        mainAxisSpacing: widget.mainAxisSpacing,
        crossAxisSpacing: widget.crossAxisSpacing,
        childAspectRatio: widget.childAspectRatio,
      ),
      itemCount: _items.length + (_isLoadingMore ? 2 : 0),
      itemBuilder: (context, index) {
        if (index < _items.length) {
          return widget.itemBuilder(context, _items[index]);
        } else {
          return widget.loadingIndicator ?? LoaderWidget.circleProgressIndicator();
        }
      },
    );
  }
}
