using {cuid} from '@sap/cds/common';

namespace newProject;

entity Books : cuid {
    name                : String(50);
    pageAmount          : Integer;
    unitPerPack         : Integer;
    ISBN                : String(15);
    @mandatory category : Association to Categories;
    @mandatory author   : Association to Authors;
}

entity Categories {
    key ID           : Integer;
        categoryName : String(50);
}

entity Authors {
    key ID                  : Integer;
        name                : String(50);
        @mandatory lastname : String(50);
        book                : Association to many Books
                                  on book.author = $self;
}
