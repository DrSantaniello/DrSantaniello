# Guida: Claude Code sul Mac, comandato dall'iPad

Alla fine di questa guida:
- Claude Code lavora **sul tuo Mac**, nella cartella di questo progetto, con i tuoi video e le skill Instagram;
- dall'**iPad** (o dall'iPhone) apri l'app Claude e ti colleghi sempre a quella sessione sul Mac;
- se il Mac si riavvia o la rete cade, Claude Code ripartirà da solo.

Ti serve un abbonamento Claude **Pro o Max** (Remote Control non funziona con il piano gratuito).

---

## 1. Scarica il progetto sul Mac

**Se hai lo zip `DrSantaniello-progetto.zip`** (te l'ha mandato Claude):
1. Crea la cartella `Progetti` nella tua cartella Inizio (Finder → Vai → Inizio).
2. Estrai lo zip lì dentro: otterrai `~/Progetti/DrSantaniello`.
   Non metterlo in Scrivania, Documenti o Download: macOS limita l'accesso a quelle cartelle.

**Oppure, se il ramo è già su GitHub**, dal Terminale:
```bash
mkdir -p ~/Progetti && cd ~/Progetti
git clone -b claude/instagram-agent-skill-i8sqs6 https://github.com/DrSantaniello/DrSantaniello
```

## 2. Apri il Terminale nella cartella
Apri l'app **Terminale** (Spotlight: `Cmd+Spazio` → "Terminale") e scrivi:
```bash
cd ~/Progetti/DrSantaniello
```

## 3. Installa gli strumenti
```bash
bash mac/setup-mac.sh
```
Installa Homebrew, ffmpeg (video), git, node, uv e Claude Code. Ti chiederà la password del Mac.
Ci vogliono alcuni minuti. Alla fine **chiudi e riapri il Terminale**.

## 4. Accedi e attiva Remote Control per tutte le sessioni
```bash
cd ~/Progetti/DrSantaniello
claude
```
1. Segui l'accesso nel browser con il tuo account Claude (lo stesso dell'iPad).
2. Se chiede se ti fidi della cartella, rispondi **Sì**.
3. Scrivi `/config` e imposta:
   - **Enable Remote Control for all sessions** → `true`
     (così anche le sessioni che apri a mano sono visibili dall'iPad);
   - **Push when actions required** → attivo
     (ti arriva una notifica sull'iPad quando Claude ti chiede un permesso).
4. Esci con `/exit`.

## 5. Primo avvio di Remote Control (una volta sola, a mano)
```bash
claude remote-control --name "DrSantaniello"
```
Rispondi alle domande che compaiono solo la prima volta:
- `Trust …? [y/N]` → `y`
- `Enable Remote Control? (y/n)` → `y`
- `Spawn mode for this project:` → `1` (stessa cartella)

Compare un QR code: inquadralo con l'iPad, si apre la sessione nell'app Claude. Funziona? Bene:
premi `Ctrl+C` per fermarlo.

## 6. Avvio automatico a ogni accensione
```bash
bash mac/attiva-avvio-automatico.sh
```
Da ora, ogni volta che accedi al Mac si apre da sola una finestra del Terminale con Remote Control.
**Non chiuderla**: finché è aperta, l'iPad trova il Mac. Se la connessione cade, si riavvia da sola.

- Per avviarlo a mano: doppio clic su `mac/avvia-remote-control.command` nel Finder.
- Per toglierlo dall'avvio: `bash mac/disattiva-avvio-automatico.sh`.

## 7. Impostazioni del Mac (importante)
- **Impostazioni di Sistema → Utenti e gruppi → Login automatico**: attivalo per il tuo utente,
  così dopo un riavvio (es. aggiornamenti) Remote Control riparte senza che tu debba fare nulla.
  Se FileVault è attivo il login automatico non è disponibile: dopo un riavvio dovrai inserire la password sul Mac.
- Lo script tiene il Mac sveglio **solo quando è collegato alla corrente**: lascialo sotto carica.
- **MacBook**: se chiudi il coperchio va in stop comunque (a meno che non sia collegato a un monitor
  esterno). Lascialo aperto, con lo schermo che può spegnersi.
- **Impostazioni di Sistema → Batteria → Opzioni**: attiva "Impedisci lo stop automatico quando lo
  schermo è spento" (alimentatore) e "Riattiva per l'accesso alla rete".

## 8. Usarlo dall'iPad
1. Apri l'app **Claude** → sezione **Code**.
2. Nell'elenco trovi la sessione **DrSantaniello** con l'indicatore del computer: toccala.
3. Scrivi come faresti sul Mac, per esempio:
   - "Fammi il piano editoriale Instagram della prossima settimana"
   - "Monta il video in media/grezzi/igiene.mov: taglia le pause, sottotitoli, export 9:16"
   - "Scrivi la didascalia per il Reel e controlla che rispetti le regole sanitarie"

Attenzione: nell'app Claude ci sono anche le **sessioni cloud** (come quella in cui è nata questa guida).
Quelle **non** lavorano sul Mac. Per lavorare sul Mac scegli sempre la sessione **DrSantaniello**
con l'icona del computer.

## 9. Come portare i video sul Mac
- **AirDrop** dall'iPhone: finiscono in `Download`. Chiedi a Claude: "sposta i video nuovi da
  Download a media/grezzi" (la prima volta macOS chiede il permesso: consentilo).
- **Allegati dall'iPad**: nella sessione Remote Control puoi allegare un file al messaggio,
  e Claude lo scarica sul Mac (comodo per file piccoli; per video lunghi meglio AirDrop).
- Le cartelle `media/` non vanno su GitHub (sono escluse apposta: pesano e contengono pazienti).

## 10. Strumenti video (facoltativi, consigliati)
Dalla sessione di Claude (anche dall'iPad) chiedi:
- "Installa la skill ufficiale di Remotion con `npx skills add remotion-dev/skills`"
  → grafiche animate, titoli, sottotitoli animati.
- "Installa video-use (https://github.com/browser-use/video-use) seguendo il README"
  → montaggio automatico dei video parlati. Serve una chiave API di ElevenLabs.

## 11. Salvare il lavoro su GitHub (dal Mac)
Dal Mac puoi caricare tu le modifiche con il tuo account GitHub:
```bash
cd ~/Progetti/DrSantaniello
git push -u origin claude/instagram-agent-skill-i8sqs6
```
La prima volta ti chiede l'accesso a GitHub. Oppure chiedi a Claude: "salva e carica le modifiche su GitHub".

## Se qualcosa non va
| Problema | Soluzione |
|---|---|
| L'iPad non vede la sessione | Controlla che sul Mac la finestra di Remote Control sia aperta e il Mac sia sveglio e in rete |
| `claude: command not found` | Chiudi e riapri il Terminale; se persiste, rilancia `bash mac/setup-mac.sh` |
| "Remote Control requires a claude.ai subscription" | Nel Terminale: `claude auth login` e scegli l'account claude.ai |
| "Workspace not trusted" all'avvio automatico | Ripeti il passo 5 a mano e rispondi `y` alla domanda Trust |
| Diagnosi generale | `claude doctor` |
