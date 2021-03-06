
plan  <-  drake::drake_plan(
    data       =  read.csv('data/gapminder-FiveYearData.csv', stringsAsFactors = FALSE),
    destroy    =  'ha-ha',
    data_1982  =  data[data$year == 1982, ],
    model      =  lme4::lmer(log(lifeExp) ~ log(gdpPercap) + (1 + log(gdpPercap) | year), data = data),
    out        =  coef(model),
    folder     =  dir.create('output'),
    figure1    =  makeFigure1(data_1982, output_filename = 'output/figure1.pdf', main = '1982'),
    figure2    =  makeFigure1(data, output_filename = 'output/figure2.pdf', main = 'Whole time series'),
    report    =  rmarkdown::render(input = "doc/report.Rmd", output_format = c('html_document', 'pdf_document'), output_file = NULL, output_dir = "output/doc/")
)
