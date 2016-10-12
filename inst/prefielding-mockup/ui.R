library(shiny)


## Server input function ----------------------------------------------------------

fluidPage(
  title = "Experiment piloting (selective)",
  h2("Test setup (mockup) for experiment on selective exposure", align = "center"),
  br(),
  fluidRow(
    column(
      width = 3,
      wellPanel(
        radioButtons("version", label = "Versjon",
                     choices = list("Hard news (4)" = 1,
                                    "Hard news (4) + Hard news (2)" = 2,
                                    "Hard news (4) + Soft news (2)" = 3),
                     selected = 3),
        radioButtons("endorsement", label = "Anbefalinger",
                     choices = list("Vis anbefalinger" = TRUE,
                                    "Ikke vis anbefalinger" = FALSE),
                     selected = TRUE),
        radioButtons("neutral", label = "Valør",
                     choices = list("Med valør" = FALSE,
                                    "Uten valør (neutral)" = TRUE),
                     selected = FALSE),
        radioButtons("decisions", label = "Antall valg",
                     choices = list("Må velge 1 sak" = 1,
                                    "Må velge 2 saker" = 2,
                                    "Må velge 3 saker" = 3),
                     selected = 3),
        actionButton("specific", label = "Lag med dette oppsettet"),
        hr(),
        actionButton("random", label = "Lag med et tilfeldig oppsett")
      )
    ),
    column(
      width = 6,
      br(), br(), br(), br(),
      h4(textOutput("vignette")),
      br(),
      h5(tableOutput("profiles"))
    )
  )
)