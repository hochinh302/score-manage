package ptit.enums;

public enum ProcedureEnum {
    GET_ALL_CLASS("{ call sp_Class_GetAll() }"),
    ADD_CLASS("{ call sp_Class_Add(?, ?) }"),
    UPDATE_CLASS("{ call sp_Class_Update(?, ?, ?) }"),
    REMOVE_CLASS("{ call sp_Class_Remove(?) }"),
    FIND_CLASS_BY_ID("{ call sp_Class_FindId(?) }"),

    GET_ALL_STUDENT("{ call sp_Student_GetAll() }"),
    ADD_STUDENT("{ call sp_Student_Add(?, ?, ?, ?, ?, ?) }"),
    UPDATE_STUDENT("{ call sp_Student_Update(?, ?, ?, ?, ?, ?) }"),
    REMOVE_STUDENT("{ call sp_Student_Remove(?) }"),
    FIND_STUDENT_BY_ID("{ call sp_Student_FindId(?) }"),
    FIND_STUDENT_BY_CLASS("{ call sp_Student_FindClass(?) }"),

    GET_ALL_SUBJECT("{ call sp_Subject_GetAll() }"),
    ADD_SUBJECT("{ call sp_Subject_Add(?, ?, ?, ?) }"),
    UPDATE_SUBJECT("{ call sp_Subject_Update(?, ?, ?, ?, ?) }"),
    REMOVE_SUBJECT("{ call sp_Subject_Remove(?) }"),
    FIND_SUBJECT_BY_ID("{ call sp_Subject_FindId(?) }"),

    ADD_SUBSCORE("{ call sp_SubScore_Add(?, ?, ?, ?, ?) }"),
    FIND_SUBSCORE("{ call sp_SubScore_Find(?, ?, ?) }"),
    REMOVE_SUBSCORE("{ call sp_SubScore_Remove(?, ?) }"),

    REGISTER_ADMIN("{ call sp_Admin_Add(?, ?, ?) }"),
    UPDATE_TOKEN("{ call sp_Admin_Update(?, ?) }"),
    FIND_BY_TOKEN("{ call sp_Admin_FindByToken(?) }"),
    FIND_BY_INFO("{ call sp_Admin_FindInfo(?, ?) }"),

    SEARCH_SCORE("{ call sp_Search_Score(?) }");

    private String sql;
    ProcedureEnum(String sql) {
        this.sql = sql;
    }

    public String getSql() {
        return this.sql;
    }
}
