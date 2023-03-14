module Theme.Markdown exposing (markdownToHtml, markdownToView)

import Css exposing (Style, absolute, batch, before, center, color, decimal, em, firstChild, fontSize, fontWeight, int, left, lineHeight, listStyle, listStyleType, marginBlockEnd, marginBlockStart, none, paddingLeft, position, property, relative, rem, textAlign, top)
import Html.Styled as Html
import Html.Styled.Attributes as Attr exposing (css)
import Markdown.Block as Block
import Markdown.Html
import Markdown.Parser
import Markdown.Renderer


markdownToHtml : String -> List (Html.Html msg)
markdownToHtml markdown =
    case markdownToView markdown of
        Ok html ->
            html

        Err _ ->
            []


markdownToView : String -> Result String (List (Html.Html msg))
markdownToView markdownString =
    markdownString
        |> Markdown.Parser.parse
        |> Result.mapError (\_ -> "Markdown error.")
        |> Result.andThen
            (\blocks ->
                Markdown.Renderer.render
                    transHtmlRenderer
                    blocks
            )


transHtmlRenderer : Markdown.Renderer.Renderer (Html.Html msg)
transHtmlRenderer =
    { heading =
        \{ level, children } ->
            case level of
                Block.H1 ->
                    Html.h1 [ css [ headerStyle ] ] children

                Block.H2 ->
                    Html.h2 [ css [ headerStyle, h2Style ] ] children

                Block.H3 ->
                    Html.h3 [ css [ headerStyle ] ] children

                Block.H4 ->
                    Html.h4 [ css [ headerStyle ] ] children

                Block.H5 ->
                    Html.h5 [ css [ headerStyle ] ] children

                Block.H6 ->
                    Html.h6 [ css [ headerStyle ] ] children
    , paragraph = Html.p [ css [ paragraphStyle ] ]
    , hardLineBreak = Html.br [] []
    , strikethrough =
        \children -> Html.s [] children
    , blockQuote = Html.blockquote []
    , strong =
        \children -> Html.strong [] children
    , emphasis =
        \children -> Html.em [] children
    , codeSpan =
        \content -> Html.code [] [ Html.text content ]
    , link =
        \link content ->
            case link.title of
                Just title ->
                    Html.a
                        [ Attr.href link.destination
                        , Attr.title title
                        , css []
                        ]
                        content

                Nothing ->
                    Html.a [ Attr.href link.destination, css [] ] content
    , image =
        \imageInfo ->
            case imageInfo.title of
                Just title ->
                    Html.img
                        [ Attr.src imageInfo.src
                        , Attr.alt imageInfo.alt
                        , Attr.title title
                        ]
                        []

                Nothing ->
                    Html.img
                        [ Attr.src imageInfo.src
                        , Attr.alt imageInfo.alt
                        ]
                        []
    , text =
        Html.text
    , unorderedList =
        \items ->
            Html.ul [ css [ ulStyle ] ]
                (items
                    |> List.map
                        (\item ->
                            case item of
                                Block.ListItem task children ->
                                    let
                                        checkbox =
                                            case task of
                                                Block.NoTask ->
                                                    Html.text ""

                                                Block.IncompleteTask ->
                                                    Html.input
                                                        [ Attr.disabled True
                                                        , Attr.checked False
                                                        , Attr.type_ "checkbox"
                                                        ]
                                                        []

                                                Block.CompletedTask ->
                                                    Html.input
                                                        [ Attr.disabled True
                                                        , Attr.checked True
                                                        , Attr.type_ "checkbox"
                                                        ]
                                                        []
                                    in
                                    Html.li [ css [ ulLiStyle ] ] (checkbox :: children)
                        )
                )
    , orderedList =
        \startingIndex items ->
            Html.ol
                (case startingIndex of
                    1 ->
                        [ Attr.start startingIndex, css [ olStyle ] ]

                    _ ->
                        []
                )
                (items
                    |> List.map
                        (\itemBlocks ->
                            Html.li [ css [ olLiStyle ] ]
                                itemBlocks
                        )
                )
    , html = Markdown.Html.oneOf []
    , codeBlock =
        \{ body, language } ->
            Html.pre []
                [ Html.code []
                    [ Html.text body
                    ]
                ]
    , thematicBreak = Html.hr [] []
    , table = Html.table []
    , tableHeader = Html.thead []
    , tableBody = Html.tbody []
    , tableRow = Html.tr []
    , tableHeaderCell =
        \maybeAlignment ->
            let
                attrs =
                    maybeAlignment
                        |> Maybe.map
                            (\alignment ->
                                case alignment of
                                    Block.AlignLeft ->
                                        "left"

                                    Block.AlignCenter ->
                                        "center"

                                    Block.AlignRight ->
                                        "right"
                            )
                        |> Maybe.map Attr.align
                        |> Maybe.map List.singleton
                        |> Maybe.withDefault []
            in
            Html.th attrs
    , tableCell =
        \maybeAlignment ->
            let
                attrs =
                    maybeAlignment
                        |> Maybe.map
                            (\alignment ->
                                case alignment of
                                    Block.AlignLeft ->
                                        "left"

                                    Block.AlignCenter ->
                                        "center"

                                    Block.AlignRight ->
                                        "right"
                            )
                        |> Maybe.map Attr.align
                        |> Maybe.map List.singleton
                        |> Maybe.withDefault []
            in
            Html.td attrs
    }


headerStyle : Style
headerStyle =
    batch []


h2Style : Style
h2Style =
    batch []


paragraphStyle : Style
paragraphStyle =
    batch []


ulStyle : Style
ulStyle =
    batch []


olStyle : Style
olStyle =
    batch []


ulLiStyle : Style
ulLiStyle =
    batch []


olLiStyle : Style
olLiStyle =
    batch []
