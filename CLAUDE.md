# Progetto contenuti social – Dr. Santaniello

Questo progetto serve a creare contenuti per i social (soprattutto Instagram) di uno
studio dentistico in Italia: testi, piani editoriali, caroselli e montaggio video.
Di solito Claude gira sul Mac dello studio e viene comandato dall'iPad o dall'iPhone
tramite Remote Control.

## Lingua e tono
- Scrivi sempre in **italiano**, in modo semplice e diretto: il lettore è un paziente,
  non un collega. Niente gergo tecnico senza spiegarlo.
- Tono rassicurante, competente, mai allarmista e mai commerciale.

## Regole obbligatorie per la comunicazione sanitaria
Ogni testo destinato alla pubblicazione deve rispettare la Legge 145/2018 (art. 1,
comma 525) e il Codice deontologico degli odontoiatri: la comunicazione deve essere
**informativa**, non promozionale né suggestiva.
- Niente prezzi, sconti, offerte, "promo", pacchetti o confronti con altri studi.
- Niente promesse o garanzie di risultato ("sorriso perfetto garantito", "indolore al 100%").
- Niente recensioni o testimonianze di pazienti usate come pubblicità.
- Le informazioni cliniche devono essere corrette e prudenti; se un'affermazione è
  dubbia, segnalala invece di inventarla.
- Prima di consegnare un testo, ricontrolla questi punti e segnala cosa hai cambiato.

## Privacy dei pazienti (GDPR)
- Foto prima/dopo, video o voci di pazienti si pubblicano **solo con consenso scritto
  specifico**. Se un contenuto mostra un paziente, ricorda di verificare il consenso.
- Non inserire mai nomi, dati o dettagli che rendano riconoscibile un paziente.

## Cartelle
- `media/grezzi/` – video e foto originali da lavorare (non si caricano su GitHub).
- `media/finali/` – video pronti da pubblicare (non si caricano su GitHub).
- `contenuti/` – testi, didascalie e piani editoriali in Markdown (questi sì su GitHub).
- I file mandati via AirDrop finiscono di solito in `~/Downloads`: se mancano in
  `media/grezzi/`, guarda lì e chiedi prima di spostarli.

## Video
- Formato standard per Reels/TikTok/Shorts: verticale 9:16, 1080×1920, H.264 + AAC,
  sottotitoli in italiano impressi nel video.
- Usa `ffmpeg`/`ffprobe` per tagli, conversioni ed export. Non sovrascrivere mai i file
  in `media/grezzi/`: scrivi sempre un nuovo file in `media/finali/`.

## Skill disponibili
Le skill Instagram sono in `.claude/skills/` (`ig-caption-writer`, `ig-carousel-planner`,
`ig-content-planner`, `ig-hook-extractor`, `ig-hashtag-strategist`, `ig-humanizer`,
`ig-repurposer`, `ig-profile-optimizer`, `ig-audience-insights`). Le loro regole su
hook e formato valgono, ma le regole sanitarie e di privacy qui sopra hanno la precedenza.

## Pubblicazione
Non pubblicare mai nulla in automatico: prepara la bozza e aspetta l'approvazione
esplicita.
