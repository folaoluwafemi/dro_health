List<M> castListTo<M>({
  required List<dynamic> list,
  required Caster<M> caster,
}){
  return list.map<M>(caster).toList();
}

typedef Caster<M> = M Function(dynamic e);
