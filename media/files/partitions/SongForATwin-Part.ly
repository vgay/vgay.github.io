\version "2.22.2"
% automatically converted by musicxml2ly from /home/vincent/Nextcloud2/Musique/MyRealBook/SongForATwin/SongForATwin-Part.mxl
\pointAndClickOff

\include "articulate.ly"

\header {
  title =  "Song for a Twin"
  composer =  "Enrique Simon"
  encodingsoftware =  "MuseScore 3.6.2"
  encodingdate =  "2022-03-17"
}

\layout {
  \context {
    \Score
    skipBars = ##t
  }
}
PartPOneVoiceOne =  \relative f'' {
  \clef "treble" \time 7/4 \key f \major \transposition bes, | % 1
  \tempo 4=160 R1..*10 \repeat volta 2 {
    | % 11
    \mark \markup { \box { A } } \stemDown f4 -\mp \stemDown e8
    \stemDown a,8 ~ -\> \stemUp a2 ~ \stemUp a2. ~ | % 12
    a1 r2 -\! r4 | % 13
    \stemDown g'4 \stemDown f8 \stemDown bes,8 ~ -\> \stemDown bes2
    ~ \stemDown bes2. ~ | % 14
    bes1 r2 -\! r4 | % 15
    \stemDown d4 \stemDown e8 \stemDown c8 ~ -\> \stemDown c2 ~
    \stemDown c2. ~ | % 16
    c1 r2 -\! r4 | % 17
    \stemDown b4 \stemUp d8 \stemUp f,8 ~ -\> \stemUp f2 ~ \stemUp f2.
    ~ | % 18
    f1 r2 -\! r4 | % 19
    f1 \stemUp g2. | \barNumberCheck #20
    a1 \stemDown c2. | % 21
    d1 \stemUp f,2. ~ | % 22
    f1 r2 r4 | % 23
    c'1 \stemUp a2. | % 24
    f1 \stemUp c2. | % 25
    f1 ~ \stemUp f2. | % 26
    R1..
  }
  | % 27
  \mark \markup { \box { B } } \stemDown g'4 \stemDown a8 \stemDown f8
  ~ \stemDown f2 ~ \stemDown f2. ~ | % 28
  f1 r2. | % 29
  f1 ~ \stemDown f2. ~ | \barNumberCheck #30
  f1 r2 r4 | % 31
  \stemDown a4 \stemDown bes8 \stemDown c8 ~ \stemDown c2 ~ \stemDown
  c2. ~ | % 32
  c1 r2. | % 33
  f,1 ~ \stemDown f2. ~ | % 34
  f1 r2 r4 | % 35
  e1 \stemDown g2. | % 36
  \stemDown c2 \stemDown bes2 ~ \stemDown bes4. \stemDown e4. | % 37
  \stemDown f2 \stemDown a,2 ~ \stemDown a2. ~ | % 38
  a1 r2 r4 | % 39
  g1 \stemDown f2. | \barNumberCheck #40
  \stemDown a2.. \stemDown bes8 \stemDown a4 \stemDown g8 \stemDown f4
  \stemDown d8 | % 41
  \stemDown f2.. \stemDown f8 \stemDown d4 \stemDown bes8 \stemUp a4
  \stemDown c8 | % 42
  f1 ~ \stemDown f2. ~ \bar "||"
  f1 r2 r4 \bar "|."
}

PartPOneVoiceOneChords =  \chordmode {
  | % 1
  s4*7 s4*7 s4*7 s4*7 s4*7 s4*7 s4*7 s4*7 s4*7 s4*7 \repeat volta 2 {
    | % 11
    d4:m5.9 s8 s8 s2 s2. | % 12
    s1 s2 s4 | % 13
    cis4:1 s8 s8 s2 s2. | % 14
    s1 s2 s4 | % 15
    c4:9/+bes s8 s8 s2 s2. | % 16
    s1 s2 s4 | % 17
    b4:dim5m7 s8 s8 s2 s2. | % 18
    s1 s2 s4 | % 19
    f1:5/+a s2. | \barNumberCheck #20
    s1 s2. | % 21
    g1:7 s2. | % 22
    s1 s2 s4 | % 23
    bes1:5 f2.:5/+a | % 24
    g1:7 fis2.:5 | % 25
    f1:5 s2. | % 26
    s4*7
  }
  | % 27
  b4:dim5m7 s8 s8 s2 s2. | % 28
  s1 s2. | % 29
  f1:5 s2. | \barNumberCheck #30
  s1 s2 s4 | % 31
  b4:dim5m7 s8 s8 s2 s2. | % 32
  s1 s2. | % 33
  f1:5 s2. | % 34
  s1 s2 s4 | % 35
  c1:5 s2. | % 36
  cis2:1 s2 s4. s4. | % 37
  d2:m5 s2 s2. | % 38
  b1:dim5m7 s2 s4 | % 39
  gis1:1 s2. | \barNumberCheck #40
  f2..:5 s8 bes4:5 s8 s4 s8 | % 41
  b2..:dim5m7 s8 c4:7 s8 s4 s8 | % 42
  f1:5 s2. \bar "||"
  s1 s2 s4 \bar "|."
}

PartPTwoVoiceOne =  \relative g' {
  \clef "treble_8" \time 7/4 \key es \major | % 1
  \stemDown g2 -\p \stemDown g2 \stemDown g4. \stemDown g4. | % 2
  \stemDown g2 \stemDown g2 \stemDown g4. \stemDown g4. | % 3
  \stemDown g2 \stemDown g2 \stemDown g4. \stemDown g4. | % 4
  \stemDown g2 \stemDown g2 \stemDown g4. \stemDown g4. | % 5
  \stemDown g2 \stemDown g2 \stemDown g4. \stemDown g4. | % 6
  \stemDown g2 \stemDown g2 \stemDown g4. \stemDown g4. | % 7
  \stemDown g2 \stemDown g2 \stemDown g4. \stemDown g4. | % 8
  \stemDown g2 \stemDown g2 \stemDown g4. \stemDown g4. | % 9
  \stemDown g2 \stemDown g2 \stemDown g4. \stemDown g4. |
  \barNumberCheck #10
  \stemDown g2 \stemDown g2 \stemDown g4. \stemDown g4. \repeat volta
  2 {
    | % 11
    \stemUp g,2 -\mp \stemUp g2 \stemDown es'4 \stemDown c8
    \stemDown d4. | % 12
    \stemDown es4 \stemDown d4 \stemDown es2 \stemDown es4. \stemUp
    g,4. | % 13
    \stemUp f2 \stemUp f2 \stemDown d'4 \stemUp g,8 \stemDown f'4. | % 14
    \stemDown d4 \stemUp as4 \stemDown d2 \stemDown d4. \stemDown f4.
    | % 15
    \stemDown bes,2 \stemDown bes2 \stemDown c4 \stemDown d8
    \stemDown f4. | % 16
    \stemDown d4 \stemDown bes4 \stemDown d2 \stemDown c4. \stemDown
    d4. | % 17
    \stemUp a2 \stemUp es2 \stemDown c'4 \stemDown es8 \stemDown f4.
    | % 18
    \stemDown es4 \stemDown c4 \stemUp a2 \stemDown es'4. \stemDown
    c4. | % 19
    \stemDown bes4 \stemUp g8 \stemDown bes4. \stemUp es,4 \stemDown
    bes'4 \stemUp g8 \stemDown bes4. | \barNumberCheck #20
    \stemUp es,4 \stemDown bes'4 \stemUp g8 \stemDown bes4. \stemUp
    es,4. \stemDown bes'4 \stemUp g8 | % 21
    \stemDown c4 \stemUp a8 \stemDown c4. \stemUp f,4 \stemDown c'4
    \stemUp a8 \stemDown c4. | % 22
    \stemUp f,4 \stemDown c'4 \stemUp a8 \stemDown c4. \stemUp f,4.
    \stemDown c'4 \stemUp a8 | % 23
    \stemUp as2 \stemDown <as c es>2 \stemUp g4. \stemDown <g bes
    es>4. | % 24
    \stemUp f2 \stemDown <as c es>2 \stemUp e4. \stemDown <gis b es>4.
    | % 25
    \stemUp <es g bes>2 \stemUp <es g bes>2 \stemUp <es g bes>4.
    \stemUp <es g bes>4. | % 26
    \stemUp <es g bes>2 \stemUp <es g bes>2 \stemUp <es g bes>4.
    \stemUp <es g bes>4.
  }
  | % 27
  <es c' g'>1 \stemDown c''4. \stemDown es,4. | % 28
  \stemDown bes2 \stemUp a2 \stemUp as4. \stemUp g4. | % 29
  \stemUp <es g bes>2 \stemUp <es g bes>2 \stemUp <es g bes>4
  \stemDown es'8 \stemDown bes'4 \stemDown c8 | \barNumberCheck #30
  \stemUp <es,, g bes>2 \stemUp <es g bes>2 \stemUp <es g bes>4.
  \stemUp <es g bes>4. | % 31
  <es c' g'>1 \stemDown c''4. \stemDown es,4. | % 32
  \stemDown ges2 \stemDown f2 \stemDown es4. \stemDown b4. | % 33
  \stemUp <es, g bes>2 \stemUp <es g bes>2 \stemUp <es g bes>4.
  \stemUp <es g bes>4. | % 34
  \stemUp <es g bes>2 \stemUp <es g bes>2 \stemUp <es g bes>4. \stemUp
  <es g bes>4. | % 35
  \stemUp <f bes d>2 \stemDown bes4 \stemUp f4 \stemUp <f bes d>2. | % 36
  \stemUp <f b d>2 \stemUp <f as d>2 \stemUp <f as d>4. \stemUp <d f
  as>4. | % 37
  \stemUp <c es g>2 \stemDown <g' c es>2 \stemDown es'4 \stemDown c8
  \stemUp g4 \stemUp f8 | % 38
  <g c es>1 \stemDown es'4 \stemDown d8 \stemDown es4 \stemDown f8 | % 39
  <a, c f>1 \stemDown <as c es>2. | \barNumberCheck #40
  \stemUp <es g bes>2 \stemUp <es g bes>2 \stemUp <es as c>4. \stemUp
  <es as c>4. | % 41
  <g c es>1 \stemUp <f bes d>2. | % 42
  \stemUp <es g bes>2 \stemUp <es g bes>2 \stemUp <es g bes>4. \stemUp
  <es g bes>4. \bar "||"
  <es g bes>1 r2 r4 \bar "|."
}

PartPThreeVoiceOne =  \relative g, {
  \clef "bass" \time 7/4 \key es \major \transposition c | % 1
  R1..*2 | % 3
  \stemUp g4 \stemDown c8 \stemDown es8 ~ \stemDown es2 ~ \stemDown es2.
  | % 4
  \stemUp as,4 \stemDown c8 \stemDown f8 ~ \stemDown f2 ~ \stemDown f2.
  | % 5
  \stemUp a,4 \stemDown c8 \stemDown fis8 ~ \stemDown fis2 ~ \stemDown
  fis2. | % 6
  \stemUp as,4 \stemDown c8 \stemDown f8 ~ \stemDown f2 ~ \stemDown f2.
  | % 7
  \stemUp g,4 \stemDown c8 \stemDown es8 ~ \stemDown es2 ~ \stemDown
  es2. | % 8
  \stemUp as,4 \stemDown c8 \stemDown f8 ~ \stemDown f2 ~ \stemDown f2.
  | % 9
  \stemUp a,4 \stemDown c8 \stemDown fis8 ~ \stemDown fis2 ~ \stemDown
  fis2. | \barNumberCheck #10
  \stemUp as,4 \stemDown c8 \stemDown f8 ~ \stemDown f2 ~ \stemDown f2.
  \repeat volta 2 {
    | % 11
    c'1 ~ \stemDown c4. \stemDown g4. | % 12
    c,1 ~ \stemUp c2. | % 13
    b1 ~ \stemUp b4. \stemDown f'4. | % 14
    b,1 ~ \stemUp b2. | % 15
    as'1 ~ \stemDown as4. \stemDown f4. | % 16
    as1 ~ \stemDown as2. | % 17
    a1 \stemDown es4. \stemDown c'4. | % 18
    a1 ~ \stemDown a2. | % 19
    g1 \stemDown es2. | \barNumberCheck #20
    g1 \stemDown es4 \stemDown bes'8 \stemDown es,4. | % 21
    \stemDown f4. \stemDown a8 \stemDown c2 \stemDown c4. \stemDown
    a4. | % 22
    \stemDown f4. \stemDown a8 \stemDown c2 \stemDown c4. \stemDown
    a4. | % 23
    as1 \stemDown g2. | % 24
    f1 \stemDown e2. | % 25
    \stemDown es2 \stemDown es2 \stemDown es4. \stemDown es4. | % 26
    \stemDown es2 \stemDown es2 \stemDown es4. \stemDown es4.
  }
  | % 27
  as,1 \stemDown es'2. | % 28
  \stemDown bes'2 \stemDown a2 \stemDown as4. \stemDown g4. | % 29
  \stemDown es2 \stemDown es2 \stemDown es4. \stemDown es4. |
  \barNumberCheck #30
  \stemDown es2 \stemDown es2 \stemDown es4. \stemDown es4. | % 31
  as,1 \stemDown es'2. | % 32
  \stemDown ges2 \stemDown f2 \stemDown es4. \stemUp b4. | % 33
  \stemDown es2 \stemDown es2 \stemDown es4. \stemDown es4. | % 34
  \stemDown es2 \stemDown es2 \stemDown es4. \stemDown es4. | % 35
  bes1 \stemDown f'2. | % 36
  \stemDown b2 \stemDown a2 ~ \stemDown a4. \stemDown f4. | % 37
  c'1 \stemDown b4. \stemDown bes4. | % 38
  a1 \stemDown as4. \stemDown g4. | % 39
  fis1 \stemDown f4. \stemDown e4. | \barNumberCheck #40
  es1 \stemUp bes4. \stemDown es4. | % 41
  a1 \stemDown bes4. \stemDown f4. | % 42
  \stemDown es2 \stemDown es2 \stemDown es4. \stemDown es4. \bar "||"
  es1 r2 r4 \bar "|."
}


% The score definition
\score {
  <<

    \context ChordNames = "PartPOneVoiceOneChords" { \PartPOneVoiceOneChords}
    \new Staff
    <<
      \set Staff.instrumentName = "Saxophone Ténor"
      \set Staff.shortInstrumentName = "Sax. T."

      \context Staff <<
        \mergeDifferentlyDottedOn\mergeDifferentlyHeadedOn
        \context Voice = "PartPOneVoiceOne" {  \PartPOneVoiceOne }
      >>
    >>
    \new Staff
    <<
      \set Staff.instrumentName = "Guitare électrique"
      \set Staff.shortInstrumentName = "Guit. El."

      \context Staff <<
        \mergeDifferentlyDottedOn\mergeDifferentlyHeadedOn
        \context Voice = "PartPTwoVoiceOne" {  \PartPTwoVoiceOne }
      >>
    >>
    \new Staff
    <<
      \set Staff.instrumentName = "Basse acoustique"
      \set Staff.shortInstrumentName = "Basse"

      \context Staff <<
        \mergeDifferentlyDottedOn\mergeDifferentlyHeadedOn
        \context Voice = "PartPThreeVoiceOne" {  \PartPThreeVoiceOne }
      >>
    >>

  >>
  \layout {}
}
\score {
  \unfoldRepeats \articulate {

    \context ChordNames = "PartPOneVoiceOneChords" { \PartPOneVoiceOneChords}
    \new Staff
    <<
      \set Staff.instrumentName = "Saxophone Ténor"
      \set Staff.shortInstrumentName = "Sax. T."

      \context Staff <<
        \mergeDifferentlyDottedOn\mergeDifferentlyHeadedOn
        \context Voice = "PartPOneVoiceOne" {  \PartPOneVoiceOne }
      >>
    >>
    \new Staff
    <<
      \set Staff.instrumentName = "Guitare électrique"
      \set Staff.shortInstrumentName = "Guit. El."

      \context Staff <<
        \mergeDifferentlyDottedOn\mergeDifferentlyHeadedOn
        \context Voice = "PartPTwoVoiceOne" {  \PartPTwoVoiceOne }
      >>
    >>
    \new Staff
    <<
      \set Staff.instrumentName = "Basse acoustique"
      \set Staff.shortInstrumentName = "Basse"

      \context Staff <<
        \mergeDifferentlyDottedOn\mergeDifferentlyHeadedOn
        \context Voice = "PartPThreeVoiceOne" {  \PartPThreeVoiceOne }
      >>
    >>

  }
  \midi {\tempo 4 = 160 }
}

