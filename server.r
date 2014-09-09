#library(shiny)
countryData <- read.csv('countries.csv', stringsAsFactors = F)
popData <- countryData[, c('IOS','Population')]
blank <- popData$Population == 'n/a'
popDataShort <- popData[!blank,]
popDataShort$Population <- sapply(popDataShort$Population, function(x){
    x2 <- gsub(pattern = ",", replacement = "", x = x)
    as.numeric(x2)})
popDataSort <- popDataShort[order(-popDataShort$Population),]
rankOrder <- c(1:length(popDataSort$Population))
popDataMap <- cbind(popDataSort, rankOrder)
popDataMap$Population <- popDataMap$Population/1000

shinyServer(
    function(input, output, session){
        output$popPlot = rCharts::renderChart2({
            ichoropleth(Population ~ IOS, data = popDataMap, map = 'world', ncuts = 9, labels = FALSE)
        })
    }
)