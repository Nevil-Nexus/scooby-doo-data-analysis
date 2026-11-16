library(tidyverse)

# Importation des données ("NULL" est traité comme valeur manquante)
Scooby <- read_csv('scoobydoo.csv', na = c("", "NA", "NULL"))

# Afficher le nombre de colonnes, de lignes et les types
glimpse(Scooby)

# Durée moyenne des épisodes
mean(Scooby$run_time, na.rm = TRUE)

# Moyenne des scores IMDb
str(Scooby$imdb)
class(Scooby$imdb)
Scooby$imdb <- as.numeric(Scooby$imdb)   # sans effet si la colonne est déjà numérique
mean(Scooby$imdb, na.rm = TRUE)

# Explorons les formats
table(Scooby$format)

# Visualisation des scores
ggplot(Scooby, aes(x = date_aired,
                   y = imdb,
                   color = format)) +
  geom_point() +
  scale_color_brewer(palette = 'Dark2')

# Filtrons tous les épisodes qui ne font pas partie de la série télé
Scooby <- Scooby |>
  filter(format != 'Crossover',
         format != 'Movie',
         format != 'Movie (Theatrical)')

# Vérification 
table(Scooby$format)


# Regroupons les épisodes segmentés
# afin de pouvoir étudier les notes IMDb.


segmented <- Scooby |>                      
  filter(format == 'TV Series (segmented)') |>
  group_by(date_aired) |>       
  summarize(imdb = mean(imdb),            
            network = unique(network),      
            series_name = unique(series_name),
            total_runtime = sum(run_time))  
segmented

non_seg <- Scooby |>                      
  filter(format != 'TV Series (segmented)') |>
  select(date_aired, 
         imdb,
         network,
         series_name,
         total_runtime=run_time)
scooby_tidied<-rbind(non_seg,segmented)         
view(scooby_tidied)      

#Nouvelle visualisation 
ggplot(scooby_tidied,aes(x=date_aired,y=imdb,col=network))+
  geom_point()+
  scale_color_brewer(palette='Dark2')

#Regardons les episodes produit par Cartoon network

cw<-scooby_tidied |>
  filter(network=='The CW')
View(cw)


#La visualisation precedente montre qu'ils sont les moins bien notees
#verifions le

model<- aov(imdb~network,
            data=scooby_tidied)

summary(model)

TukeyHSD(model) #Oui c'est le cas

#Un diagramme de rand imdb par rapport au chaine(network)

scooby_tidied|>
  group_by(network)|>
  summarize(mean_imdb=mean(imdb, na.rm=TRUE))|>
  ggplot(aes(x=fct_reorder(network,-mean_imdb),y=mean_imdb,
             fill=network))+
    geom_col()+
    geom_text(aes(label=round(mean_imdb,1)),
              nudge_y=.3)+
  scale_fill_brewer(palette='Dark2')+
  labs(x='Network',y='Mean imdb rating',
       title='Scooby dooooo!')+
  theme(legend.position='none',axis.text.x=element_text(angle=15))


