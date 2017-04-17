CREATE TABLE Client
(
    NumClient serial,
    NomClient str,
    PrenomClient str,
    AgeClient int,
    MailClient mail,
    PRIMARY KEY (NumClient)
);

CREATE TABLE Vendeur
(
    NumVendeur serial,
    NomVendeur str,
    AdresseVendeur str,
    MailCommandeVendeur mail,
    MailDiscutionVendeur mail,
    DescriptionVendeur bstr,
    NumClient serial,
    PRIMARY KEY (NumVendeur),
    FOREIGN KEY (NumClient) REFERENCES Client
);

CREATE TABLE AdresseFacturation
(
    NumAdresseFacturation serial,
    NomPrénomAdresseFacturation str,
    AdresseLigne1AdresseFacturation str,
    AdresseLigne2AdresseFacturation str,
    VilleAdresseFacturation str,
    PaysAdresseFacturation str,
    CodePostalAdresseFacturation CP,
    PRIMARY KEY (NumAdresseFacturation)
);

CREATE TABLE AdresseLivraison
(
    NumAdresseLivraison serial,
    NomPrénomAdresseLivraison str,
    AdresseLigne1AdresseLivraison str,
    AdresseLigne2AdresseLivraison str,
    VilleAdresseLivraison str,
    PaysAdresseLivraison str,
    CodePostalAdresseLivraison CP,
    TelephoneAdresseLivraison tel,
    PRIMARY KEY (NumAdresseLivraison)
);

CREATE TABLE CartePaiement
(
    NumCartePaiement serial,
    TypeCartePaiement str,
    NuméroCartePaiement int,
    NomDétenteurCartePaiement str,
    DateExpirationCartePaiement dateCB,
    CryptogrammeCartePaiement int,
    PRIMARY KEY (NumCartePaiement)
);

CREATE TABLE Panier
(
    NumPanier serial,
    DateCréationPanier date,
    DateDernièreModifPanier date,
    DateCommandePanier date,
    NumClient serial,
    NumAdresseFacturation serial,
    NumAdresseLivraison serial,
    NumCartePaiement serial,
    PRIMARY KEY (NumPanier),
    FOREIGN KEY (NumClient) REFERENCES Client,
    FOREIGN KEY (NumAdresseFacturation) REFERENCES AdresseFacturation,
    FOREIGN KEY (NumAdresseLivraison) REFERENCES AdresseLivraison,
    FOREIGN KEY (NumCartePaiement) REFERENCES CartePaiement (NumCartePaiement)
);

CREATE TABLE Article
(
    NumArticle serial,
    LibelléArticle str,
    DescriptionArticle bbstr,
    PointsArticle int,
    PrixArticle real,
    QuantitéStock int,
    DateMiseVente date,
    DateAnnulationVente date,
    NumVendeur serial,
    PRIMARY KEY (NumArticle),
    FOREIGN KEY (NumVendeur) REFERENCES Vendeur
);

CREATE TABLE Tags
(
    NumTags serial,
    NomTags str,
    ValeurTags str,
    PRIMARY KEY (NumTags)
);

CREATE TABLE TagsArticle
(
    NumTags serial,
    NumArticle serial,
    PRIMARY KEY (NumTags, NumArticle),
    FOREIGN KEY (NumTags) REFERENCES Tags,
    FOREIGN KEY (NumArticle) REFERENCES Article
);

CREATE TABLE HistorsiqueMAJ
(
    NumHistoriqueMAJ serial,
    DateHistoriqueMAJ date,
    PRIMARY KEY (NumHistoriqueMAJ)
);

CREATE TABLE Commentaire
(
    NumArticle serial,
    NumClient serial,
    ContenuCommentaire bstr,
    PRIMARY KEY (NumArticle, NumClient),
    FOREIGN KEY (NumArticle) REFERENCES Article,
    FOREIGN KEY (NumClient) REFERENCES Client
);

CREATE TABLE Note
(
    NumArticle serial,
    NumClient serial,
    ValeurNote int,
    PRIMARY KEY (NumArticle, NumClient),
    FOREIGN KEY (NumArticle) REFERENCES Article,
    FOREIGN KEY (NumClient) REFERENCES Client
);

CREATE TABLE ListeDeSouhait
(
    NumArticle serial,
    NumClient serial,
    DateAjoutListeDeSouhait date,
    PRIMARY KEY (NumArticle, NumClient),
    FOREIGN KEY (NumArticle) REFERENCES Article,
    FOREIGN KEY (NumClient) REFERENCES Client
);

CREATE TABLE Visite
(
    NumArticle serial,
    NumClient serial,
    DateVisite date,
    PRIMARY KEY (NumArticle, NumClient),
    FOREIGN KEY (NumArticle) REFERENCES Article,
    FOREIGN KEY (NumClient) REFERENCES Client
);

CREATE TABLE ArticlePanier
(
    NumPanier serial,
    NumArticle serial,
    NbArticlePanier int,
    FOREIGN KEY (NumPanier) REFERENCES Panier,
    FOREIGN KEY (NumArticle) REFERENCES Article
);

CREATE TABLE MAJStock
(
    NumHistoriqueMAJ serial,
    NumArticle serial,
    NumVendeur serial,
    NbMAJStock int,
    FOREIGN KEY (NumHistoriqueMAJ) REFERENCES HistorsiqueMAJ,
    FOREIGN KEY (NumArticle) REFERENCES Article,
    FOREIGN KEY (NumVendeur) REFERENCES Vendeur
);
