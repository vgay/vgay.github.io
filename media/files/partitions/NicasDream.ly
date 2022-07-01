\version "2.22.1"
#(set-global-staff-size 18)
\include "double-mark.ly"
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"
\include "chord-grid-JAS.ly"



\paper {
  indent = 0\mm
  ragged-last-bottom = ##t
  ragged-bottom = ##f
  ragged-last = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 23)
                            (minimum-distance . 20)
                            (padding . 5))
  system-system-spacing = #'((basic-distance . 18)
                             (minimum-distance . 12)
                             (padding . 0))
  oddHeaderMarkup = \markup {
    \on-the-fly \print-page-number-check-first {
      \fill-line { \null \concat { \fromproperty #'page:page-number-string "/" \page-ref #'theLastPage "0" "?"} }
  } }
  evenHeaderMarkup = \markup {
    \on-the-fly \print-page-number-check-first {
      \fill-line { \concat { \fromproperty #'page:page-number-string "/" \page-ref #'theLastPage "0" "?"} \null }
    }
  }
}

title = #"Nica's Dream"
composer = #"Horace Silver"
meter = #"(Med. Up Latin / Swing)"
kwtempo = #"Med. Up"
kwstyle = #"Latin / Swing"

realBookTitle = \markup {
  \score {
    {
      \override TextScript.extra-offset = #'(0 . -4.5)
      s4
      s^\markup {
        \fill-line {
          \fontsize #1 \lower #1 \rotate #7 \concat { " " #meter }
          \fontsize #4
          \override #'(offset . 9)
          \override #'(thickness . 6)
          \underline \larger \larger #title
          \fontsize #1 \lower #1 \concat { #composer " " }
        }
      }
      s
    }
    \layout {
      \omit Staff.Clef
      \omit Staff.TimeSignature
      \omit Staff.KeySignature
      ragged-right = ##f
    }
  }
}

\header {
  pdftitle = #title
  pdfauthor = #composer
  pdfkeywords = \markup \concat { #kwtempo " " #kwstyle }
  title = \realBookTitle
  asplayed = #"Horace Silver" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=r7OG-Oqb5qE"
  arranger = \markup \on-the-fly #played?
  \with-url #url
  \with-color #blue \underline
  \concat { "(as played by " \fromproperty #'header:asplayed ")" }
  tagline = ##f
}

\layout {
  \context {
    \Score
    \override Glissando #'style = #'zigzag
    \override Glissando.breakable = ##t
    \override Glissando.after-line-breaking = ##t
    startRepeatType = #"[|:"
    endRepeatType = #":|]"
    doubleRepeatType = #":|][|:"
    \override Clef #'break-visibility = #'#(#f #f #f)
    \override KeySignature #'break-visibility = #'#(#f #f #f)
    \override SystemStartBar #'collapse-height = #1
    \override ParenthesesItem.font-size = #2
    \override MultiMeasureRest #'expand-limit = #3
  }
  \context {
    \Staff
    printPartCombineTexts = ##f
    \consists "Merge_rests_engraver"
  }
  \context {
    \ChordNames
    \override ParenthesesItem.font-size = #2
  }
  \context { \Score markFormatter = #format-mark-box-alphabet }
}


form = \markup  \fill-line {
  \column {  }
  \column { \line { \fontsize #2 "(chords parenthized are not played during solos)" } }
}

harmonies = \chordmode {
  \set chordChanges = ##f
  es2.:m9 cis:m9 b2:m9 f1:5+7
  bes1:m7+ as:m7+ bes1:m7+ as:m7+
  bes1*2:m7+ as1*2:m7+ bes1*2:m7+ as1:m7 des:7
  as1:m7 des:7 ges4.:7+ \parenthesize des:9 c4:9+ s1 f1.:5-7 f2:5+7 bes1*2:m7+ bes1:m7+
  as1:9sus4 s4 as2:9-sus4 ges4:dim7 f4:m7 es:m7 des:7+ f8:m7  bes:9-13 s2. bes4:5+7
  es1:9 s4 as2:9sus4 as4:9-sus4 des1:7+9.11+ e2:m7 a:7
  des2..:7+9.11+ f8:8 r1
  bes1*2:m7+ as1*2:m7+ bes1*2:m7+ as1:m7 des:7
  as1:m7 des:7 ges4.:7+ \parenthesize des:9 c4:9+ s1 f1.:5-7 f2:5+7 bes1*2:m7+
  bes1:m7+ as:m7+ ges:m7+ c:m5-7 f1*2:5-7 bes:m
  bes1*2:m7+ as1*2:m7+ bes1*2:m7+ as1:m7 des:7
  as1:m7 des:7 ges4.:7+ des:9 c4:9+ s1 f1.:5-7 f2:5+7 bes1*2:m7+
  bes1*2:m7+ es2:m7 as:7 des1:7+ c:m5-7 f:5-7 c:m5-7 f:5-7
  b4:1 r2. s1*3 bes1:m11
}


theNotes =  \relative c'' {
  \clef "treble" \key des \major \time 2/2
  \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
  \override TextSpanner.bound-details.left.text = "dr. fill"
  \mark \markup { \box  "Intro" }
  f4-^ \startTextSpan r2 es4-^  | r2 des4-^ \stopTextSpan r
  \override TextSpanner.bound-details.left.text = "Break"
  a8 \startTextSpan cis b a f e b a \stopTextSpan | bes!4-. r2. | R1 | R1 | r2. f'4 | \break
  \mark \markup  { \box A \rounded-box Latin }
  \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \repeat volta 2 {
    << { c'1~ | c4. bes8 r8 f4-. des8 } \\
       { \improvisationOn \override NoteHead.no-ledgers = ##t
         \withMusicProperty untransposable ##t  { \magnifyMusic 0.8 {
           \once \override TextScript #'extra-offset = #'( -4 . 3 )
           \override TextScript.font-size = #2
           c4._"(bs.)" 8~4 \once \override TextScript #'extra-offset = #'( 2 . 3 ) 4 _"(etc.)" } } } >>
    f1 ~ | f2. f4
    \times 2/3 { c'4 des a } c2 ~ | c4. bes8 r8 f4-. des8 |
    \times 2/3 { es4 f des } es2 ~ | es2. des4 \break
    bes'1 ~ | bes4. as8 r8 f4-. des8 |
    << { \withMusicProperty untransposable ##t { \magnifyMusic 0.8 {
      \improvisationOn \override NoteHead.no-ledgers = ##t
      b'' 4. 8~4 4~ 1 } } } \\
       { es,,1 ~ | es1^"(dr. fill)" } >>
    es8 f es f ges2 ~ | ges f4-. r8 des8 | c1~
  }
  \alternative {
    { c2. f4 }
    { c2.r4 }
  } \break
  \mark \markup  { \raise #1 \with-color #(x11-color 'red) \musicglyph "scripts.varsegno" \box B \rounded-box "Swing " }
  \repeat volta 2 {
    << { \withMusicProperty untransposable ##t { \magnifyMusic 0.8 {
      \improvisationOn \override NoteHead.no-ledgers = ##t
      \override Rest #'staff-position = #7
      r4 b'' r b r b r b } } } \\
       { \override Rest #'staff-position = #0 r4 f,-. des4. es8 | f4-. des2 es4 } >>
    f ges as bes8 ces ~ | ces2. bes4-. \break
    a4 bes8 bes, r des4-. es8 |
    << { \withMusicProperty untransposable ##t { \magnifyMusic 0.8 {
      \improvisationOn \override NoteHead.no-ledgers = ##t
      \override Rest #'staff-position = #7
      r4 b'' r b } } } \\
       { f,4-. des2 c4 } >>
  }
  \alternative {
    { es1 | << { \withMusicProperty untransposable ##t { \magnifyMusic 0.8 {
      \improvisationOn \override NoteHead.no-ledgers = ##t
      b''4. 8~2  } } } \\
               { fis,8 d e fis ~ fis2 } >> }
    {
      << { \withMusicProperty untransposable ##t { \magnifyMusic 0.8 {
        \improvisationOn \override NoteHead.no-ledgers = ##t
        \override Rest.stencil = #ly:percent-repeat-item-interface::beat-slash
        \override Rest.thickness = #0.3
        \override Rest #'staff-position = #7
        r4 r r b'8 8  } } } \\
         { es,,2. f8 ges } >>
      r8 \startTextSpan f e f des'4 as8 c~ \stopTextSpan
    }
  } \break
  \mark \markup  { \box A \rounded-box Latin }
  c1~ | c4. bes8 r8 f4-. des8 |
  f1 ~ | f2. f4
  \times 2/3 { c'4 des a } c2 ~ | c4. bes8 r8 f4-. des8 |
  \times 2/3 { es4 f des } es2 ~ | es2. des4 \break
  bes'1 ~ | bes4. a8 r8 f4-. des8 |
  es1 ~ | es1
  es8 f es f ges2 ~ | ges f4-. r8 des8 |
  c1 ~ \toCoda | c2 bes8 des f a \break
  \mark \markup { \box C \rounded-box "Interlude" \small \bold "(to play between each solos)" }
  c a ~ a2. | bes8 g ~ g2. |
  as8 f ~ f2. | ges8 es ~ es2. |
  es1 | r4 f'8 ges f es b a |
  \revert Score.RehearsalMark #'self-alignment-X
  bes4-^ r2. \mark \markup \fontsize #-1 "Solo break" R1 \break \bar "||-[|:"
  \mark-y-dir #`( (,left . ,DOWN) (,right . ,UP) )
  \doubleMark
  \markup  \with-color #red "Solos on AABA, (C as is betwwen each) and Play D after last Solo"
  \markup  \column { \pad-around #1 " " \concat { \box D " " \rounded-box Latin } }
  \repeat volta 2 {
    c8 8 r4 r8 8 8 r | 8-^ r8 r4 8 8 ces8 8 | bes8 8 r4 r8 8 8 r | 8-^ r8 r4 8 8 ces8 8 | \break
    c8 8 r4 r8 8 8 r | 8-^ r8 r4 8 8 ces8 8 | bes ges as bes~ bes4 ges8 es | f ges ~ ges4 es8 ces des es~ \break
    es4 r \comp #14 \break \comp #16  }
  \break \doubleMark
  \markup  \with-color #red "D.S.al Coda"
  \markup \column { \pad-around #2 " " \with-color #red \musicglyph "scripts.varcoda" }
  c2. \repeatTie f4 | c2. bes4 |
  f'2. es4 | ges f es des |
  es1~ | es~ | es~ | es  \break
  << { \withMusicProperty untransposable ##t { \magnifyMusic 0.8 {
    \improvisationOn \override NoteHead.no-ledgers = ##t
    \override Rest #'staff-position = #7
    b''4 r4 r2  } } } \\ { \override MultiMeasureRest #'staff-position = #0 R1 } >>

  des,8 f es des b a fis e |
  f4-. r4 \clef "bass" g,8 _"(bs. & pn.)" f b, a | bes4 r r2 \clef "treble" | es''1\fermata
  \bar ".."
}

theNotesEb =  \relative c' {
  \clef "treble" \key des \major \time 2/2
  \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
  \override TextSpanner.bound-details.left.text = "dr. fill"
  \mark \markup { \box  "Intro" }
  f4-^ \startTextSpan r2 es4-^  | r2 des4-^ \stopTextSpan r
  \override TextSpanner.bound-details.left.text = "Break"
  a'8 \startTextSpan cis b a f e b a \stopTextSpan | bes!4-. r2. | R1 | R1 | r2. f'4 | \break
  \mark \markup  { \box A \rounded-box Latin }
  \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \repeat volta 2 {
    << { c'1~ | c4. bes8 r8 f4-. des8 } \\
       { \improvisationOn \override NoteHead.no-ledgers = ##t
         \withMusicProperty untransposable ##t  { \magnifyMusic 0.8 {
           \once \override TextScript #'extra-offset = #'( -4 . 3 )
           \override TextScript.font-size = #2
           c4._"(bs.)" 8~4 \once \override TextScript #'extra-offset = #'( 2 . 3 ) 4 _"(etc.)" } } } >>
    f1 ~ | f2. f4
    \times 2/3 { c'4 des a } c2 ~ | c4. bes8 r8 f4-. des8 |
    \times 2/3 { es4 f des } es2 ~ | es2. des4 \break
    bes'1 ~ | bes4. as8 r8 f4-. des8 |
    << { \withMusicProperty untransposable ##t { \magnifyMusic 0.8 {
      \improvisationOn \override NoteHead.no-ledgers = ##t
      b'' 4. 8~4 4~ 1 } } } \\
       { es,,1 ~ | es1^"(dr. fill)" } >>
    es8 f es f ges2 ~ | ges f4-. r8 des8 | c1~
  }
  \alternative {
    { c2. f4 }
    { c2.r4 }
  } \break
  \mark \markup  { \raise #1 \with-color #(x11-color 'red) \musicglyph "scripts.varsegno" \box B \rounded-box "Swing " }
  \repeat volta 2 {
    << { \withMusicProperty untransposable ##t { \magnifyMusic 0.8 {
      \improvisationOn \override NoteHead.no-ledgers = ##t
      \override Rest #'staff-position = #7
      r4 b'' r b r b r b } } } \\
       { \override Rest #'staff-position = #0 r4 f,-. des4. es8 | f4-. des2 es4 } >>
    f ges as bes8 ces ~ | ces2. bes4-. \break
    a4 bes8 bes, r des4-. es8 |
    << { \withMusicProperty untransposable ##t { \magnifyMusic 0.8 {
      \improvisationOn \override NoteHead.no-ledgers = ##t
      \override Rest #'staff-position = #7
      r4 b'' r b } } } \\
       { f,4-. des2 c4 } >>
  }
  \alternative {
    { es1 | << { \withMusicProperty untransposable ##t { \magnifyMusic 0.8 {
      \improvisationOn \override NoteHead.no-ledgers = ##t
      b''4. 8~2  } } } \\
               { fis,8 d e fis ~ fis2 } >> }
    {
      << { \withMusicProperty untransposable ##t { \magnifyMusic 0.8 {
        \improvisationOn \override NoteHead.no-ledgers = ##t
        \override Rest.stencil = #ly:percent-repeat-item-interface::beat-slash
        \override Rest.thickness = #0.3
        \override Rest #'staff-position = #7
        r4 r r b'8 8  } } } \\
         { es,,2. f8 ges } >>
      r8 \startTextSpan f e f des'4 as8 c~ \stopTextSpan
    }
  } \break
  \mark \markup  { \box A \rounded-box Latin }
  c1~ | c4. bes8 r8 f4-. des8 |
  f1 ~ | f2. f4
  \times 2/3 { c'4 des a } c2 ~ | c4. bes8 r8 f4-. des8 |
  \times 2/3 { es4 f des } es2 ~ | es2. des4 \break
  bes'1 ~ | bes4. a8 r8 f4-. des8 |
  es1 ~ | es1
  es8 f es f ges2 ~ | ges f4-. r8 des8 |
  c1 ~ \toCoda | c2 bes8 des f a \break
  \mark \markup { \box C \rounded-box "Interlude" \small \bold "(to play between each solos)" }
  c a ~ a2. | bes8 g ~ g2. |
  as8 f ~ f2. | ges8 es ~ es2. |
  es1 | r4 f8 ges f es b a |
  \revert Score.RehearsalMark #'self-alignment-X
  bes4-^ r2. \mark \markup \fontsize #-1 "Solo break" R1 \break \bar "||-[|:"
  \mark-y-dir #`( (,left . ,DOWN) (,right . ,UP) )
  \doubleMark
  \markup  \with-color #red "Solos on AABA, (C as is betwwen each) and Play D after last Solo"
  \markup  \column { \pad-around #1 " " \concat { \box D " " \rounded-box Latin } }
  \repeat volta 2 {
    c'8 8 r4 r8 8 8 r | 8-^ r8 r4 8 8 ces8 8 | bes8 8 r4 r8 8 8 r | 8-^ r8 r4 8 8 ces8 8 | \break
    c8 8 r4 r8 8 8 r | 8-^ r8 r4 8 8 ces8 8 | bes ges as bes~ bes4 ges8 es | f ges ~ ges4 es8 ces des es~ \break
    es4 r \comp #14 \break \comp #16  }
  \break \doubleMark
  \markup  \with-color #red "D.S.al Coda"
  \markup \column { \pad-around #2 " " \with-color #red \musicglyph "scripts.varcoda" }
  c2. \repeatTie f4 | c2. bes4 |
  f'2. es4 | ges f es des |
  es1~ | es~ | es~ | es  \break
  << { \withMusicProperty untransposable ##t { \magnifyMusic 0.8 {
    \improvisationOn \override NoteHead.no-ledgers = ##t
    \override Rest #'staff-position = #7
    b''4 r4 r2  } } } \\ { \override MultiMeasureRest #'staff-position = #0 R1 } >>

  des,8 f es des b a fis e |
  f4-. r4 \clef "bass" g,8 _"(bs. & pn.)" f b, a | bes4 r r2 \clef "treble" | es''1\fermata
  \bar ".."
}

theNotesII =  \relative c'' {
  \clef "treble" \key des \major \time 2/2
  \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
  \mark \markup { \box  "Intro" }
  des4-^ r2 b4-^ | r2 a4-^ r
  a8 cis b a f e b a | bes!4-. r2. | R1 | R1 | R1 | \break
  \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \mark \markup \column { \pad-around #3 " " \concat { \box A " " \rounded-box Latin } }
  \repeat volta 2 {
    a'4. a8 r a4-. as8 | g1 | g4. g8 r g4-. ges8  | f1
    a4. a8 r a4-. as8  | g1 |
    ges!2 ~ \times 2/3 { ges4 es ges } | f1 \break
    ges2 ~ \times 2/3 { ges4 ces ges } | f1 | bes4. ces8~ ces4 bes ~ | bes1
    ces2 ~ ces8 es ces bes | a2 des4-. r8 a | a1~
  }
  \alternative {
    { a2. r4 }
    { a2. \repeatTie r4 }
  } \break
  \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \mark \markup  { \raise #1 \with-color #(x11-color 'red) \musicglyph "scripts.varsegno" \box B \rounded-box "Swing " }
  \repeat volta 2 {
    r4 des-. bes4. c8 | des4-. a2 c4 |
    as! bes c es8 g ~ | g8 ges f e ~ e4 ges-. \break
    es4 f8 g, r bes4-. c8 | des4-. bes2 a4
  }
  \alternative {
    { c1 | d8 b c cis ~ cis2 }
    { c2. des8 es | R1 }
  }
  \bar "||" \break
  \mark \markup  { \box A \rounded-box Latin }
  a,4. a8 r a4-. as8 | g1 |
  g4. g8 r g4-. ges8  | f1
  a4. a8 r a4-. as8  | g1 |
  ges!2 ~ \times 2/3 { ges4 es ges } | f1 \break
  ges2 ~ \times 2/3 { ges4 ces ges } | f1 |
  bes4. ces8 ~ ces4 bes ~ | bes1
  ces2 ~ ces8 es ces bes | a2 d4-. r8 a |
  a1 ~ \toCoda | a2 g8 bes des f \break
  \mark \markup { \box C \rounded-box "Interlude" \small \bold "(to play between each solos)" }
  a8 f ~ f2. | g8 es ~ es2. |
  f8 des ~ des2. | es8 bes ~ bes2. |
  b1 | r4 f'8 ges f es b a |
  \revert Score.RehearsalMark #'self-alignment-X
  bes!4-^ r2.
  \mark \markup "Solo break"
  r1
  \bar "|." \break
  \mark-y-dir #`( (,left . ,DOWN) (,right . ,UP) )
  \doubleMark
  \markup  \with-color #red "Solos on AABA, (C as is betwwen each) and Play D after last Solo"
  \markup  \column { \pad-around #1 " " \concat { \box D " " \rounded-box Latin } }
  \repeat volta 2 {
    a'8 8 r4 r8 8 8 r | 8-^ r8 r4 8 8 as8 8 | g8 8 r4 r8 8 8 r | 8-^ r8 r4 8 8 as8 8 | \break
    a8 8 r4 r8 8 8 r | 8-^ r8 r4 8 8 as8 8 | es ces des es~ es4 ces8 as| bes ces ~ ces4 as8 es f as~ \break
    as4 r \comp #14 \break \comp #16  }
  \break \doubleMark
  \markup  \with-color #red "D.S.al Coda"
  \markup \column { \pad-around #2 " " \with-color #red \musicglyph "scripts.varcoda" }
  as2. \repeatTie  des,4 | a'2. g4 |
  des'2. c4 | es des c bes
  ges2 ~ ges8 bes r ges | b1 |
  ges2 ~ ges8 bes! r ges | b1 |  \break
  R1 | des8 f es des b a fis e |
  f4-. r2. R1 c'1\fermata

  \bar "||"
}

theNotesIIEb =  \relative c'' {
  \clef "treble" \key des \major \time 2/2
  \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
  \mark \markup { \box  "Intro" }
  des4-^ r2 b4-^ | r2 a4-^ r
  a'8 cis b a f e b a | bes!4-. r2. | R1 | R1 | R1 | \break
  \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \mark \markup \column { \pad-around #3 " " \concat { \box A " " \rounded-box Latin } }
  \repeat volta 2 {
    a4. a8 r a4-. as8 | g1 | g4. g8 r g4-. ges8  | f1
    a4. a8 r a4-. as8  | g1 |
    ges!2 ~ \times 2/3 { ges4 es ges } | f1 \break
    ges2 ~ \times 2/3 { ges4 ces ges } | f1 | bes4. ces8~ ces4 bes ~ | bes1
    ces2 ~ ces8 es ces bes | a2 des4-. r8 a | a1~
  }
  \alternative {
    { a2. r4 }
    { a2. \repeatTie r4 }
  } \break
  \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \mark \markup  { \raise #1 \with-color #(x11-color 'red) \musicglyph "scripts.varsegno" \box B \rounded-box "Swing " }
  \repeat volta 2 {
    r4 des-. bes4. c8 | des4-. a2 c4 |
    as! bes c es8 g ~ | g8 ges f e ~ e4 ges-. \break
    es4 f8 g, r bes4-. c8 | des4-. bes2 a4
  }
  \alternative {
    { c1 | d8 b c cis ~ cis2 }
    { c2. des8 es | R1 }
  }
  \bar "||" \break
  \mark \markup  { \box A \rounded-box Latin }
  a,4. a8 r a4-. as8 | g1 |
  g4. g8 r g4-. ges8  | f1
  a4. a8 r a4-. as8  | g1 |
  ges!2 ~ \times 2/3 { ges4 es ges } | f1 \break
  ges2 ~ \times 2/3 { ges4 ces ges } | f1 |
  bes4. ces8 ~ ces4 bes ~ | bes1
  ces2 ~ ces8 es ces bes | a2 d4-. r8 a |
  a1 ~ \toCoda | a2 g8 bes des f \break
  \mark \markup { \box C \rounded-box "Interlude" \small \bold "(to play between each solos)" }
  a8 f ~ f2. | g8 es ~ es2. |
  f8 des ~ des2. | es8 bes ~ bes2. |
  b1 | r4 f'8 ges f es b a |
  \revert Score.RehearsalMark #'self-alignment-X
  bes!4-^ r2.
  \mark \markup "Solo break"
  r1
  \bar "|." \break
  \mark-y-dir #`( (,left . ,DOWN) (,right . ,UP) )
  \doubleMark
  \markup  \with-color #red "Solos on AABA, (C as is betwwen each) and Play D after last Solo"
  \markup  \column { \pad-around #1 " " \concat { \box D " " \rounded-box Latin } }
  \repeat volta 2 {
    a'8 8 r4 r8 8 8 r | 8-^ r8 r4 8 8 as8 8 | g8 8 r4 r8 8 8 r | 8-^ r8 r4 8 8 as8 8 | \break
    a8 8 r4 r8 8 8 r | 8-^ r8 r4 8 8 as8 8 | es ces des es~ es4 ces8 as| bes ces ~ ces4 as8 es f as~ \break
    as4 r \comp #14 \break \comp #16  }
  \break \doubleMark
  \markup  \with-color #red "D.S.al Coda"
  \markup \column { \pad-around #2 " " \with-color #red \musicglyph "scripts.varcoda" }
  as2. \repeatTie  des,4 | a'2. g4 |
  des'2. c4 | es des c bes
  ges2 ~ ges8 bes r ges | b1 |
  ges2 ~ ges8 bes! r ges | b1 |  \break
  R1 | des8 f es des b a fis e |
  f4-. r2. R1 c'1\fermata

  \bar "||"
}

chordsRhythm = \relative c' {
  \override Rest #'staff-position = #7
  \improvisationOn \override NoteHead.no-ledgers = ##t
  \improvisationOn
  \magnifyMusic 0.8 { d4-^ r4 r4 d4-^ | r2 4-^ r | 4-^ r r2 | \repeat unfold 4 { r4 r8 8~2 } } |

}

Basse = \relative c {
  \clef "bass" \key des \major \time 4/4
  es4^^ r r d^^ r2 b4^^ r f^^ r4 r2
  \repeat unfold 2 { bes4^. r8 8~4 4 as4^. r8 8~4 4 }

  \bar ".."
}

grille = \chordmode {
  \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \mark \markup \box Intro
  es4:m9 r r cis:m9 r2 b4:m9 r f1:5+7 \stopStaff s1 \bar "" \startStaff \break
  bes:m7+ as:m7+ bes:m7+ as:m7+ \break
  \bar "[|:"   \mark \markup { \box A \rounded-box Latin }
  \repeat percent 2 { bes1:m7+ } \repeat percent 2 { as:m7+ } \break
  \repeat percent 2 { bes1:m7+ } as:m7+ des:7 \break
  as:m7+ des:7 ges2:7+
  \once \override Staff.ParenthesesItem.extra-offset = #'(4 . 0)
  \parenthesize des:9 c1:9- \break
  \repeat percent 2 { f:5+7 } \repeat percent 2 { bes:m7+ } \break
  \bar ":|][|:"  \mark \markup { \box B \rounded-box Swing }
  as:9sus4 as2:9sus4 as:9-sus4 des1:7+ f2:m5-7 bes:5+7 \break
  es1:9 as2:9sus4 as:9-sus4 \set Score.repeatCommands = #'((volta "1.") )
  des1:7+9 e2:m7 a:7 \set Score.repeatCommands = #'((volta #f) end-repeat) \break
  \stopStaff s1 \bar "" s \startStaff \set Score.repeatCommands = #'((volta "2.") )
  des2:7+9 f:8 r1 \set Score.repeatCommands = #'((volta #f) ) \bar "||" \break
  \mark \markup { \box A \rounded-box Latin }
  \repeat percent 2 { bes1:m7+ } \repeat percent 2 { as:m7+ } \break
  \repeat percent 2 { bes1:m7+ } as:m7+ des:7 \break
  as:m7+ des:7 ges2:7+ \once \override Staff.ParenthesesItem.extra-offset = #'(4 . 0)
  \parenthesize des:9 c1:9- \break
  \repeat percent 2 { f:5+7 }
  \once \override Score.RehearsalMark.extra-offset = #'(31 . 0)
  \mark \markup  { \with-color #red \musicglyph "scripts.varcoda" }

  \repeat percent 2 { bes:m7+ } \break \bar "||"
  \mark \markup { \box \bold "Interlude" \small \bold "(to play between each solos)" }
  bes1:m7+ as:m7+ ges:m7+ c:m5-7 \break
  \repeat percent 2 { b1/f } bes4:m r2. r1 \break
  \mark \markup  \with-color #red \musicglyph "scripts.varcoda"
  \repeat percent 2 { bes1:m7+  } es2:m7 as:7 des1:7+ \break
  c:m5-7 b/f c:m5-7 b/f \break
  b4:1 r2. \repeat percent 3 { r1 } \break
  bes1:m11 \fermata \bar ".." \stopStaff s \bar "" s \bar "" s \bar ""
  \label #'theLastPage
}



\book {
  \paper {
    #(set-paper-size "a5landscape")
    page-count = #3
    print-first-page-number = ##t
  }
  #(define output-suffix "CTab")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new StaffGroup <<
          \new Staff \with {
            instrumentName = \markup {
              \center-column {\pad-around #1 \fontsize #-2 \circle \bold \concat {" " \musicglyph #"clefs.G_change" " "}
                              \line { "trumpet" }
          } } }
          \theNotes
          \new Staff \with { \RemoveEmptyStaves } << \chordsRhythm \\ \Basse >>
      >> >>
    }
    \form
  }  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with {
          instrumentName = \markup {
            \center-column {\pad-around #1 \fontsize #-2 \circle \bold \concat {" " \musicglyph #"clefs.G_change" " "}
                            \line { "Tenor" }
        } } }
        { \theNotesII \label #'theLastPage }
      >>
    }
    \form
} }

\book {
  \paper {
    #(set-paper-size "a5landscape")
    page-count = #3
    print-first-page-number = ##t
  }
  #(define output-suffix "BbTab")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new StaffGroup <<
          \new Staff \with {
            instrumentName = \markup {
              \center-column {\pad-around #1 \fontsize #3 \circle \bold \concat {" " B \flat " "}
                              \line { "trumpet" }
          } } }
          \transpose c d \theNotes
          \new Staff \with { \RemoveEmptyStaves } << \chordsRhythm \\ \Basse >>
      >> >>
    }
    \form
  }  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with {
          instrumentName = \markup {
            \center-column {\pad-around #1 \fontsize #3 \circle \bold \concat {" " B \flat " "}
                            \line { "Tenor" }
        } } }
        { \transpose c d \theNotesII \label #'theLastPage }
      >>
    }
    \form
} }

\book {
  \paper {
    #(set-paper-size "a5landscape")
    page-count = #3
    print-first-page-number = ##t
  }
  #(define output-suffix "EbTab")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new StaffGroup <<
          \new Staff \with {
            instrumentName = \markup {
              \center-column {\pad-around #1 \fontsize #3 \circle \bold \concat {" " E \flat " "}
                              \line { "trumpet" }
          } } }
          \transpose c a \theNotesEb
          \new Staff \with { \RemoveEmptyStaves } << \chordsRhythm \\ \Basse >>
      >> >>
    }
    \form
  }  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with {
          instrumentName = \markup {
            \center-column {\pad-around #1 \fontsize #3 \circle \bold \concat {" " E \flat " "}
                            \line { "Tenor" }
        } } }
        { \transpose c a, \theNotesIIEb \label #'theLastPage }
      >>
    }
    \form
} }

\book {
  \paper {
    #(set-paper-size "a4")
    print-first-page-number = ##t
    page-count = #2
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new StaffGroup <<
          \new Staff \with {
            instrumentName = \markup {
              \center-column {\pad-around #1 \fontsize #-2 \circle \bold \concat {" " \musicglyph #"clefs.G_change" " "}
                              \line { "trumpet" }
          } } }
          \theNotes
          \new Staff \with { \RemoveEmptyStaves } << \chordsRhythm \\ \Basse >>
      >> >>
    }
    \form
  }  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with {
          instrumentName = \markup {
            \center-column {\pad-around #1 \fontsize #-2 \circle \bold \concat {" " \musicglyph #"clefs.G_change" " "}
                            \line { "Tenor" }
        } } }
        { \theNotesII \label #'theLastPage }
      >>
    }
    \form
  }  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \grille
    } \form
} }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #2
  }
  #(define output-suffix "Bba4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new StaffGroup <<
          \new Staff \with {
            instrumentName = \markup {
              \center-column {\pad-around #1 \fontsize #3 \circle \bold \concat {" " B \flat " "}
                              \line { "trumpet" }
          } } }
          \transpose c d \theNotes
          \new Staff \with { \RemoveEmptyStaves } << \chordsRhythm \\ \Basse >>
      >> >>
    }
    \form
  }  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with {
          instrumentName = \markup {
            \center-column {\pad-around #1 \fontsize #3 \circle \bold \concat {" " B \flat " "}
                            \line { "Tenor" }
        } } }
        { \transpose c d \theNotesII \label #'theLastPage }
      >>
    }
    \form
  }  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \transpose c d \grille
    } \form
} }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #2
  }
  #(define output-suffix "Eba4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new StaffGroup <<
          \new Staff \with {
            instrumentName = \markup {
              \center-column {\pad-around #1 \fontsize #3 \circle \bold \concat {" " E \flat " "}
                              \line { "trumpet" }
          } } }
          \transpose c a \theNotesEb
          \new Staff \with { \RemoveEmptyStaves } << \chordsRhythm \\ \Basse >>
      >> >>
    }
    \form
  }  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with {
          instrumentName = \markup {
            \center-column {\pad-around #1 \fontsize #3 \circle \bold \concat {" " E \flat " "}
                            \line { "Tenor" }
        } } }
        { \transpose c a, \theNotesIIEb \label #'theLastPage }
      >>
    }
    \form
  }  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \transpose c a \grille
    } \form
} }

