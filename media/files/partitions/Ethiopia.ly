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
  score-system-spacing = #'((basic-distance . 15)
                            (minimum-distance . 15)
                            (padding . 5))
  system-system-spacing = #'((basic-distance . 15)
                             (minimum-distance . 8)
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

title = #"Ethiopia"
composer = #"Larry Willis"
meter = #"(Slow Ballad)"
kwtempo = #"Slow"
kwstyle = #"Ballad"

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
  asplayed = #"Larry Willis and Kenny Garrett" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=LoTv1zw0ETM"
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
  \column { \line { \with-color #red \fontsize #2 "Solos on AABBA then D.S. al Fine" } }
}
harmoniesI = \chordmode {
  \set chordChanges = ##f
  c2.:m7 s des:7+ s
}
harmonies = \chordmode {
  \set chordChanges = ##f
  as2.:7+11+/g as:7+ f:m7 des:7+ c:m7 fis:m7 f/g es/f
  e:m7 s fis:7+11+ s e:m7 s fis:7+11+ s
  as2.:7+11+/g f2:m7 bes4:7sus4 es2.:7+ as:7+ des:7+ as2.:7+11+/g s s
  c:m7 s des:7+ s c:m7 s des:7+ s
}

theNotes =  \relative c'' {
  \clef "treble" \key es \major \time 3/4
  \mark #1
  d,4 es f | g2~ 8 f | g as f4. es8 | f8 g es4. c8 | \break
  d2. | cis4 d e | f2. | g8 es bes'4. d8 | \break
  a2.~ | 2~ \tuplet 3/2 { 8 g fis } | e2. ~ | 2. | \break
  d'8 cis a2~ | 2.~ | 2.~ | 2. \break \bar "||" \mark #2
  d,4 es f | g2 c4 | bes2 as4 | g2. | \break
  g8 as4 c f,8 | d2.~ | 2. | c4 es d | \break
  \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \mark \markup "Rhythm section like Intro"
  c2.~ |  2.~ | 2.~ | 2. R2.*4 \bar "|."


  \bar ".."
  \label #'theLastPage
}

chordsRhythm = \relative c'' {
  \clef "treble" \key es \major \time 3/4
  \showStartRepeatBar \bar "[|:"
  \repeat volta 2 {
    <d e g>4 q q | <d f bes> q q | <c des f> q q | <c des f as> q q
  }

}

Basse = \relative c {
  \clef "bass" \key es \major \time 3/4
  r8 c4 4 8~ | 8 4 4 8 | r8 as4 4 8~ | 8 4 4 8 |

  \bar ".."
}

grille = \chordmode {
  \bar "[|:" \mark #1 as1:7+11+ as:7+ f:m7 des:7+ \break
  c:m7 fis:m7 f/g es/f \break
  \repeat volta 2 {  \repeat percent 2 { e:m7 } \repeat percent 2 { fis:7+11+ } }
  \break \mark #2
  as1:7+11+ f2.:m7 bes4:7sus4 es1:7+ as:7+ \break
  des:7+ \repeat percent 3 { as1:7+11+ }
  \repeat volta 2 {  \repeat percent 2 { c:m7 } \repeat percent 2 { des:7+ } }
}



\book {
  \paper {
    #(set-paper-size "a5landscape")
    %page-count = #1
    print-first-page-number = ##t
  }
  #(define output-suffix "CTab")
  \bookpart {
    \score {
      \new StaffGroup <<
        \new Staff { \Intro \chordsRhythm }
        \new ChordNames { \harmoniesI }
        \new Staff \Basse
      >>
    }
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \theNotes
        >>
      >>
    } %\form
    \score {
      \layout { indent = 0 }
      \new StaffGroup <<
        \new Staff { \Outro \chordsRhythm \improvisationOn b'2. \fermata }
        \new ChordNames { \harmoniesI }
        \new Staff  { \Basse \improvisationOn d2. \fermata }
      >>
    }
} }

\book {
  \paper {
    #(set-paper-size "a5landscape")
    %page-count = #1
    print-first-page-number = ##t
  }
  #(define output-suffix "BbTab")
  \bookpart {
    \score {
      \new StaffGroup <<
        \new Staff { \Intro \chordsRhythm }
        \new ChordNames { \harmoniesI }
        \new Staff \Basse
      >>
    }
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with { instrumentName = \Bb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c d \theNotes
        >>
      >>
    } %\form
    \score {
      \layout { indent = 0 }
      \new StaffGroup <<
        \new Staff { \Outro \chordsRhythm \improvisationOn b'2. \fermata }
        \new ChordNames { \harmoniesI }
        \new Staff  { \Basse \improvisationOn d2. \fermata }
      >>
    }
} }

\book {
  \paper {
    #(set-paper-size "a5landscape")
    %page-count = #1
    print-first-page-number = ##t
  }
  #(define output-suffix "EbTab")
  \bookpart {
    \score {
      \new StaffGroup <<
        \new Staff { \Intro \chordsRhythm }
        \new ChordNames { \harmoniesI }
        \new Staff \Basse
      >>
    }
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c a \theNotes
        >>
      >>
    } %\form
    \score {
      \layout { indent = 0 }
      \new StaffGroup <<
        \new Staff { \Outro \chordsRhythm \improvisationOn b'2. \fermata }
        \new ChordNames { \harmoniesI }
        \new Staff  { \Basse \improvisationOn d2. \fermata }
      >>
    }
} }

\book {
  \paper {
    #(set-paper-size "a4")
    %page-count = #1
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \score {
      \new StaffGroup <<
        \new Staff { \Intro \chordsRhythm }
        \new ChordNames { \harmoniesI }
        \new Staff \Basse
      >>
    }
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol }
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \theNotes
        >>
      >>
    } %\form
    \score {
      \layout { indent = 0 }
      \new StaffGroup <<
        \new Staff { \Outro \chordsRhythm \improvisationOn b'2. \fermata }
        \new ChordNames { \harmoniesI }
        \new Staff  { \Basse \improvisationOn d2. \fermata }
      >>
    }
  }  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \grille
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    %page-count = #1
  }
  #(define output-suffix "Bba4")
  \bookpart {
    \score {
      \new StaffGroup <<
        \new Staff { \Intro \chordsRhythm }
        \new ChordNames { \harmoniesI }
        \new Staff \Basse
      >>
    }
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with { instrumentName = \Bb  } <<
          % \new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c d \theNotes
        >>
      >>
    } %\form
    \score {
      \layout { indent = 0 }
      \new StaffGroup <<
        \new Staff { \Outro \chordsRhythm \improvisationOn b'2. \fermata }
        \new ChordNames { \harmoniesI }
        \new Staff  { \Basse \improvisationOn d2. \fermata }
      >>
    }
  }  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \transpose c d \grille
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    %page-count = #1
  }
  #(define output-suffix "Eba4")
  \bookpart {
    \score {
      \new StaffGroup <<
        \new Staff { \Intro \chordsRhythm }
        \new ChordNames { \harmoniesI }
        \new Staff \Basse
      >>
    }
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice
          \transpose c a \theNotes
        >>
      >>
    } %\form
    \score {
      \layout { indent = 0 }
      \new StaffGroup <<
        \new Staff { \Outro \chordsRhythm \improvisationOn b'2. \fermata }
        \new ChordNames { \harmoniesI }
        \new Staff  { \Basse \improvisationOn d2. \fermata }
      >>
    }
  }  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \transpose c a \grille
} } }

