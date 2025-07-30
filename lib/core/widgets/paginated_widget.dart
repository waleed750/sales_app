import 'dart:developer';

import '../core_export.dart';

typedef ItemBuilder<T> = Widget Function(BuildContext context, T item);
typedef LoadMoreCallback<T> = Future<List<T>> Function();

class PaginatedWidget<T> extends StatefulWidget {
  const PaginatedWidget({
    super.key,
    required this.items,
    required this.itemBuilder,
    required this.loadMore,
    this.loadingIndicator,
    this.emptyState,
    this.shrinkWrap = false,
  });

  final List<T> items;
  final ItemBuilder<T> itemBuilder;
  final LoadMoreCallback<T> loadMore;
  final Widget? loadingIndicator;
  final Widget? emptyState;
  final bool shrinkWrap;

  @override
  State<PaginatedWidget<T>> createState() => _PaginatedWidgetState<T>();
}

class _PaginatedWidgetState<T> extends State<PaginatedWidget<T>> {
  final ScrollController _scrollController = ScrollController();
    bool _isLoadingMore = false;

    @override
    void initState() {
      super.initState();
      _scrollController.addListener(_scrollListener);
    }

    void _scrollListener() {
      if (!_isLoadingMore &&
          _scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent) {
        _loadMore();
      }
    }

  Future<void> _loadMore() async {
    setState(() => _isLoadingMore = true);

    try {
      await widget.loadMore();
    } catch (e) {
      log('Error loading more items: $e');
    } finally {
      setState(() => _isLoadingMore = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.items.isEmpty) {
      return widget.emptyState ??
          Center(child: Text(AppStrings.tr.noItemsAvailable));
    }

    return ListView.builder(
      controller: _scrollController,
      shrinkWrap: widget.shrinkWrap,
      itemCount: widget.items.length + (_isLoadingMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index < widget.items.length) {
          return widget.itemBuilder(context, widget.items[index]);
        } else {
          return widget.loadingIndicator ??
              const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
