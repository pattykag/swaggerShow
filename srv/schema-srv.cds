using {newProject as my} from '../db/schema';

@Core         : {
    Description     : 'Exposición del servicio: Books',
    LongDescription : 'Este servicio está localizado en [/my/](/)'
}
@Capabilities : {BatchSupport : {Supported : false}}
service MyService {
    @Capabilities : {
        TopSupported       : false, // Disables Top
        SkipSupported      : false, // Disables Skip
        SortRestrictions   : {Sortable : false}, // Disables Sort
        ExpandRestrictions : {Expandable : false}, // Disables expand
        SelectSupport      : {Supported : false, }, // Disables select
        SearchRestrictions : {Searchable : false}, //Disables filter
        FilterRestrictions : {Filterable : false}, //Disables count
        CountRestrictions  : {Countable : false},
        ReadRestrictions   : { // READ
            Description           : 'Lista de Autor',
            ReadByKeyRestrictions : { // READ por ID
                Description : 'Obtener Autor por su ID',
                Readable    : true
            }
        },
        UpdateRestrictions : {
            Description  : 'Actualización de Autor por ID',
            UpdateMethod : #PATCH
        },
        InsertRestrictions : {Description : 'Ingresar un Autor'},
        DeleteRestrictions : {Description : 'Eliminar un Autor por su ID'},
        DeepInsertSupport  : {Supported : false}
    }
    entity Authors    as projection on my.Authors;

    @readonly
    @Capabilities : {SelectSupport : {Supported : false}}
    entity Categories as projection on my.Categories;

    @Capabilities : {
        TopSupported       : false, // Disables Top
        SkipSupported      : false, // Disables Skip
        SortRestrictions   : {Sortable : false}, // Disables Sort
        //ExpandRestrictions : {Expandable : false}, // Disables expand
        SelectSupport      : {Supported : false, }, // Disables select
        SearchRestrictions : {Searchable : false}, //Disables filter
        FilterRestrictions : {Filterable : false}, //Disables count
        CountRestrictions  : {Countable : false},
        ReadRestrictions   : { // READ
            Description           : 'Lista de Libros',
            ReadByKeyRestrictions : { // READ por ID
                Description : 'Obtener Libro por su ID',
                Readable    : true
            }
        },
        UpdateRestrictions : {
            Description  : 'Actualización de Libro por ID',
            UpdateMethod : #PATCH
        },
        InsertRestrictions : {Description : 'Ingresar un Libro'},
        DeleteRestrictions : {Description : 'Eliminar un Libro por su ID'},
        DeepInsertSupport  : {Supported : false}
    }
    entity Books      as projection on my.Books;

    @Core : {Description : 'Consulta de nombre de Libro y su ID' }
    function getBooksID()                       returns String;

    @Core : {Description : 'Almacena 1 o más libros' }
    action   batchBooks(value : array of Books) returns String;
}

type oMessage {
    code    : Integer;
    message : String(255);
}
