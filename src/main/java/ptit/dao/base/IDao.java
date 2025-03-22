package ptit.dao.base;

import java.util.List;

public interface IDao<T, O> {
    List<O> getAll();
    O findById(T id);
    boolean add(O entity);
    boolean update(O entity);
    boolean remote(T id);
}

