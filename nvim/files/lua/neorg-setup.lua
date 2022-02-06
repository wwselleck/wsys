require('neorg').setup {
    load = {
        ["core.defaults"] = {},
        ["core.norg.dirman"] = {
            config = {
                workspaces = {
                    main = "~/Dropbox/_notes/neorg",
                    work = "~/Dropbox/_notes/neorg/work",
                    hobbies = "~/Dropbox/_notes/neorg/hobbies"
                },
                index = "index.norg"
            }
        },
        ["core.gtd.base"] = {
            config = {
                workspace = "main"
            }
        },
    }
}
