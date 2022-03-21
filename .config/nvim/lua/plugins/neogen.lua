local neogen = require('neogen')

neogen.setup({
    snippet_engine = 'luasnip',
    input_after_comment = true,
    languages = {
        csharp = {
            template = {
                annotation_convention = 'xmldoc'
            }
        }
    }
})
