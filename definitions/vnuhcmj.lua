--[[
- create_author is a function that creates an author object with the given name, email, affiliations, and corresponding author status.
- name: string, the name of the author
- email: string, the email of the author
- affiliations: array of string, the affiliations of the author
- corresponding_author: boolean, whether the author is the corresponding author
]]
function create_author(name, email, affiliations, corresponding_author)
    return {
        name=name,
        email=email,
        affiliations=affiliations,
        corresponding_author=corresponding_author
    }
end

function list_affiliations(authors)
    local affiliation_set = {}  -- to ensure the uniqueness of affiliations
    local affiliations = {}     -- to maintain the order of affiliations

    for _,author in ipairs(authors) do
        for _,affiliation in ipairs(author.affiliations) do
            if not affiliation_set[affiliation] then
                affiliation_set[affiliation] = true
                table.insert(affiliations, affiliation)
            end
        end
    end
    
    return affiliations
end

function list_author_affiliation_indices(authors)
    local affiliations = list_affiliations(authors)
    local affiliation_index_map = {}
    for index,affiliation in ipairs(affiliations) do
        affiliation_index_map[affiliation] = index
    end

    local all_authors_affiliation_indices = {}
    for _,author in ipairs(authors) do
        local current_author_affiliation_indices = {}
        for _,affiliation in ipairs(author.affiliations) do
            table.insert(current_author_affiliation_indices, affiliation_index_map[affiliation])
        end
        table.sort(current_author_affiliation_indices)
        table.insert(all_authors_affiliation_indices, current_author_affiliation_indices)
    end

    return all_authors_affiliation_indices
end

function get_authors_text(authors, author_affiliation_indices)
    local author_labels = {}
    for author_index,author in ipairs(authors) do
        local supper_script = "" .. table.concat(author_affiliation_indices[author_index], ", ");
        if author.corresponding_author then
            supper_script = supper_script .. ", *"
        end
        local author_label = string.format("%s\\textsuperscript{%s}", author.name, supper_script)
        table.insert(author_labels, author_label)
    end

    return table.concat(author_labels, ", ")
end

function get_affiliations(affiliations)
    local affiliation_strings = {}
    for index,affiliation in ipairs(affiliations) do
        table.insert(affiliation_strings, string.format("\\textsuperscript{%s}", index) .. affiliation)
    end
    return table.concat(affiliation_strings, "\\\\")
end

function get_correspondence(author)
    local affiliation_string = table.concat(author.affiliations, ", ")
    
    local correspondence = string.format(
        "%s, %s, email: %s",
        author.name,
        affiliation_string,
        author.email)
    return correspondence
end

function get_correspondences(authors)
    local correspondences = {}
    for _,author in ipairs(authors) do
        if author.corresponding_author then
            table.insert(correspondences, get_correspondence(author))
        end
    end

    return table.concat(correspondences)
end
