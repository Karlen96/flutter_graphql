import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../../../core/constants/constants.dart';

final graphQlClient = GraphQLClient(
  cache: GraphQLCache(),
  link: HttpLink(GraphQl.link),
);
