\version "2.24.0"

\header {
  title = "ST. LUKE TROPARION"
  subtitle = "Russian Tone 6"
  tagline = ##f
}

\paper {
  #(set-paper-size "letter")
  top-margin = 0.65\in
  bottom-margin = 0.65\in
  left-margin = 0.65\in
  right-margin = 0.65\in
}

global = {
  \key e \minor
  \cadenzaOn
  \autoBeamOff
}

% --- SOPRANO ---
soprano = \relative c' {
  % System 1: LET US PRAISE THE HOLY APOSTLE LUKE WITH SACRED SONG:
  g4 g\breve g4 fis4 f4 a2 \bar "||"
  % System 2: FOR HE RECORDED THE GLORIOUS GOSPEL OF CHRIST,
  g4 g1 g4 g4 g4 a2 \bar "||"
  % System 3: AND WAS THE SCRIBE OF THE ACTS OF THE APOSTLES;
  g4 g\breve g4 g4( fis4) e2 \bar "||"
  % System 4: IT IS A TESTIMONY OF THE CHURCH OF CHRIST.
  g4 g1 g4 fis4 g4 a2 \bar "||"

  % System 5 (Page 2): LET US EVERMORE PRAISE AND BLESS THE PHYSICIAN AND HEALER
  g4 g\breve g4( a4) b2 \bar "||"
  % System 6: OF HUMAN WEAKNESS AND INFIRMITY; | HE HEALS THE WOUNDS OF OUR SOULS
  b4 b1 b4 a4 g4 fis2 \bar "|"
  g4 g1 fis4 g4 g4 a2 \bar "||"
  % System 7: AND CONSTANTLY INTERCEDES | FOR THE SALVATION OF OUR SOULS.
  g4 g1 g4 fis4 e2 \bar "|"
  g4 g4 g4 a4. g8 fis4 g1 \bar "|."
}

% --- ALTO ---
alto = \relative c' {
  % System 1
  e4 e\breve e4 dis4 e4 fis2
  % System 2
  e4 e1 e4 e4 e4 fis2
  % System 3
  e4 e\breve e4 e4( dis4) b2
  % System 4
  e4 e1 e4 dis4 e4 fis2

  % System 5
  e4 e\breve e4( fis4) g2
  % System 6
  g4 g1 g4 fis4 e4 dis2
  e4 e1 dis4 e4 e4 fis2
  % System 7
  e4 e1 e4 dis4 b2
  e4 e4 e4 fis4. e8 dis4 e1
}

% --- TENOR ---
tenor = \relative c' {
  % System 1
  b4 b\breve b4 b4 b4 d2
  % System 2
  b4 b1 b4 b4 b4 d2
  % System 3
  b4 b\breve b4 b4( a4) g2
  % System 4
  b4 b1 b4 b4 b4 d2

  % System 5
  b4 b\breve b4( d4) d2
  % System 6
  d4 d1 d4 d4 b4 b2
  b4 b1 b4 b4 b4 d2
  % System 7
  b4 b1 b4 b4 g2
  b4 b4 b4 d4. b8 b4 b1
}

% --- BASS ---
bass = \relative c {
  % System 1
  e4 g\breve e4 b4 e4 d2
  % System 2
  e4 g1 e4 e4 e4 d2
  % System 3
  e4 g\breve e4 b4( b4) e2
  % System 4
  e4 g1 e4 b4 e4 d2

  % System 5
  e4 g\breve e4( d4) g2
  % System 6
  g4 g1 g4 d4 e4 b2
  e4 g1 b,4 e4 e4 d2
  % System 7
  e4 g1 e4 b4 e2
  e4 e4 e4 <d d'>4. <e b'>8 <b b'>4 <e, b' e>1
}

% --- LYRICS ---
verse = \lyricmode {
  % System 1
  LET \once \override LyricText.self-alignment-X = #LEFT
  "US PRAISE THE HOLY APOSTLE LUKE" WITH SAC -- RED SONG: \break
  % System 2
  FOR \once \override LyricText.self-alignment-X = #LEFT
  "HE RECORDED THE GLORIOUS" GOS -- PEL OF CHRIST, \break
  % System 3
  AND \once \override LyricText.self-alignment-X = #LEFT
  "WAS THE SCRIBE OF THE ACTS OF THE" A -- POS -- TLES; \break
  % System 4
  IT \once \override LyricText.self-alignment-X = #LEFT
  "IS A TESTIMONY OF" THE CHURCH OF CHRIST. \pageBreak

  % System 5
  LET \once \override LyricText.self-alignment-X = #LEFT
  "US EVERMORE PRAISE AND BLESS THE PHYSICIAN AND" HEAL -- ER \break
  % System 6
  OF \once \override LyricText.self-alignment-X = #LEFT
  "HUMAN WEAKNESS AND" IN -- FIR -- MI -- TY;
  HE \once \override LyricText.self-alignment-X = #LEFT
  "HEALS THE" WOUNDS OF OUR SOULS \break
  % System 7
  AND \once \override LyricText.self-alignment-X = #LEFT
  "CONSTANTLY IN" -- TER -- CEDES
  FOR THE SAL -- VA -- TION OF OUR SOULS.
}

\score {
  \new ChoirStaff <<
    \new Staff = "women" <<
      \new Voice = "soprano" { \voiceOne \global \soprano }
      \new Voice = "alto" { \voiceTwo \global \alto }
    >>
    \new Lyrics \lyricsto "soprano" { \verse }
    \new Staff = "men" <<
      \clef bass
      \new Voice = "tenor" { \voiceOne \global \tenor }
      \new Voice = "bass" { \voiceTwo \global \bass }
    >>
  >>
  \layout {
    indent = 0\in
    \context {
      \Score
      \remove "Bar_number_engraver"
    }
    \context {
      \Staff
      \remove "Time_signature_engraver"
    }
  }
}
