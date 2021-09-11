
\version "2.19.80"
#(set-global-staff-size 18)
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"



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
}

title = #"Chill"
composer = #"Joshua Redman"
meter = #"(Med. Swing)"
kwtempo = #"Medium"
kwstyle = #"Swing"

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
  asplayed = #"Joshua Redman" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=3XAKvKCh9zU"
  arranger = \markup \on-the-fly #played?
  \with-url #url
  \with-color #blue \underline
  \concat { "(as played by " \fromproperty #'header:asplayed ")" }
  tagline = ##f
}

\layout {
  \context {
    \Score
    %voltaSpannerDuration = #(ly:make-moment 4 4)
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
    printKeyCancellation = ##f
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
  %   \context { \RemoveEmptyStaffContext 				% ne pas imprimer les lignes vides (autres que la première)
  %              \override VerticalAxisGroup #'remove-first = ##t			% Concerne la première ligne
  %   }
}

voltaI = \markup { \text \italic \small { Till cue } }
voltaII = \markup  { \text \italic \small { end piano solo } }
voltaIII = \markup  { \text \italic \small \with-color #red { D.C. al coda } }

form = \markup  \fill-line {
  \column {  }
  \column { \line { \with-color #red \fontsize #2 "Solos on AABBA then D.S. al Fine" } }
}

harmonies = \chordmode {
  \set chordChanges = ##t
  es4.:m bes8/d s2 a4.:1.3.5.11+ as8/bes s2
  es4.:m bes8/d s2 a4.:1.3.5.11+ as8/bes s2
  es4.:m bes8/d s2 a4.:1.3.5.11+ as8/bes s2
  es4.:m bes8/d s2 a4.:1.3.5.11+ as8/bes s2
  es4.:m bes8/d s2 a4.:1.3.5.11+ as8/bes s2
  g4.:5+7 ges8:7 s2 f4.:7 e8:7+11+ s2 f4.:7 e8:7+11+ s2 
  es4.:6 des8:7 s2 es4.:6 des8:7 s2 c4.:m7 as8 s2 ges4. as8 s2
  es4.:6 des8:7 s2 es4.:6 des8:7 s2 c4.:m7 as8 s2 as4.:7.11+ as8/bes s2
  es4.:m bes8/d s2 a4.:1.3.5.11+ as8/bes s2
  es4.:m bes8/d s2 a4.:1.3.5.11+ as8/bes s2
  es4.:m bes8/d s2 a4.:1.3.5.11+ as8/bes s2
  g4.:5+7 ges8:7 s2 f4.:7 e8:7+11+ s2 s1*2 
  as1*9:7 bes:7 e2:7+11+ 
  es4.:m bes8/d s2 a4.:1.3.5.11+ as8/bes s2
  es4.:m bes8/d s2 a4.:1.3.5.11+ as8/bes s2
  
}


theNotes =  \relative c' {
  \clef "treble" \key des \major \time 4/4
  \override TextSpanner.bound-details.left.text = "sample voicing piano RH, tacet 1st x"
  \textSpannerDown
  \Intro
  \showStartRepeatBar \bar "[|:"
  \repeat volta 2 { 
    <g bes es>4. \startTextSpan <f bes d>8~ q2 | <e a cis>4. <es as c>8~ q2 |
    <g bes es>4. <f bes d>8~ q2 | <e a cis>4. ^"pn cont. simile" <es as c>8~ q4 <es' es'>8-. q \stopTextSpan |
  } \break \A
  \repeat volta 2 { 
    r4 _"pn RH tacet 1st x" ges-. as4. ges8 | es4 ges8 es8~ 2 | 
    r8 bes' \tuplet 3/2 { r as ges } s4. ges8 | es4 ges8 es8~ 4. \parenthesize bes8 | 
    \break es4 ges-. as4. ges8 | es4 ges8 es8~ 2 | es4 ges8 es8~ 2 | 
  }
  \alternative {
    { es4 ges8 es8~ 2 }
    { es4 ges8 es8 \tuplet 3/2 { r ges bes } \tuplet 3/2 { c es f } }
  }
  \bar "||" \break \B 
  \override Staff.KeySignature.color = #(x11-color 'red)
  \key es \major
  g4 bes8 f8~ 4. es8 | g4 bes8 f8~ 2 | es4. 8~ 2 | 
  es4 ges8 es~ es bes \tuplet 3/2 { c es f } | \break
  g4 bes8 f8~ 4. es8 | g4 bes8 f8~ 2 | es4. 8~ 2 | 
  es4 ges8 es~ es4 es'8-^ es-^ 
  \bar "||" \break \A \key des \major
  r4 ges,,-. as4. ges8 | es4 ges8 es8~ 2 | 
  r8 bes' \tuplet 3/2 { r as ges } s4. ges8 | es4 ges8 es8~ 4. \parenthesize bes8 | 
  \break es4 ges-. as4. ges8 | es4 ges8 es8~ 2 | es4 ges8 es8~ 2 | 
  es4 ges8 es8~ 2~ | 1~ | \toCoda
  \set Score.repeatCommands = #(list(list 'volta voltaI))
  \time 2/4 4 es''8-^ \once \override TextScript #'extra-offset = #'( -12 . 0 ) es-^  
  _\markup "Solo piano on AABA" 
  \set Score.repeatCommands = #'((volta #f))
  \set Score.repeatCommands = #(list(list 'volta voltaII) 'end-repeat)
  \comp #1 es,,8-- as-.
  
  \set Score.repeatCommands = #'((volta #f))
  \bar  "||-[|:" \break \C \time 4/4
  \repeat volta 3 { \comp #28 }
  \alternative { { \comp #4 } { \comp #3 as8-- bes-. } } 
  \bar  "||-[|:" \break \D \key es \major
  \repeat volta 3 { \comp #28 }
  \alternative { 
    { \comp #4 } 
    { \set Score.repeatCommands = #(list(list 'volta voltaIII) 'end-repeat)
      \comp #3 bes8-- es-. } } 
  \bar "||" \break \Coda \time 2/4 es,4 \repeatTie es''8-^ es-^
  \mark \markup \bold \box "Tenor Solo"
  \time 4/4 \repeat volta 2 { 
    << { \comp #16 } \\ 
       {
         \override TextSpanner.bound-details.left.text = "pn RH voicing"
         \textSpannerDown
         <g,,, bes es>4. \startTextSpan <f bes d>8~ q2 | <e a cis>4. <es as c>8~ q2 |
         <g bes es>4. <f bes d>8~ q2 | <e a cis>4.  <es as c>8~ q2 \stopTextSpan } >>  
  }
  \once \override Score.RehearsalMark #'direction = #DOWN
  \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
  \mark \markup "vamp. solo and fade"
}


Basse = \relative c {
  \clef "bass" \key des \major \time 4/4
  \override TextSpanner.bound-details.left.text = "bass with pn LH 8vb"
  \textSpannerDown
  es4.\startTextSpan  d8~ 2 | a4. bes8~ 2 | es4. d8~ 2 | a4. bes8~ 2 \stopTextSpan |
  es4. d8~ 2 | a4. bes8~ 2 | es4. d8~ 2 | a4. bes8~ 2 |
  es4. d8~ 2 | a4. as8~ 2 | g4. ges8~ 2 | 
  f4. e8~ 2 | f4. e8-> r2 ^"break" | 
  \override Staff.KeySignature.color = #(x11-color 'red)
  \key es \major
  es'4. des8~ 2 | es4. des8~ 2 | 
  c4. as8~ 2 | ges4. as8~ as as \tuplet 3/2 { bes c d } |
  es4. des8~ 2 | es4. des8~ 2 | c4. as8~ 2 | a4. bes8~ 2 |
  \key des \major
  es4. d8~ 2 | a4. bes8~ 2 | es4. d8~ 2 | a4. bes8~ 2 |
  es4. d8~ 2 | a4. as8~ 2 | g4. ges8~ 2 | 
  f4. e8~ 2 ~ | 1~ | \time 2/4 2 | 2 \repeatTie 
  \override TextSpanner.bound-details.left.text = "Solo Tenor 1st x, solo bass 2nd x, 4x4 tenor bass 3rd x"
  \textSpannerUp
  as4-. \startTextSpan r8 as r2
  \repeat unfold 7 { as4-. r8 as r2 } as4-. r8 as r2 \stopTextSpan
  \override TextSpanner.bound-details.left.text = "4x4 1st x, 2x2 2nd x, 1x1 3rd x"
  bes4-. \startTextSpan r8 bes r2
  \repeat unfold 7 { bes4-. r8 bes r2 } bes4-. r8 bes r2 \stopTextSpan
  \time 2/4 es,2 \repeatTie \time 4/4
  \override TextSpanner.bound-details.left.text = "bass with pn LH 8vb"
  \textSpannerDown
  es'4. \startTextSpan d8~ 2 | a4. bes8~ 2 | es4. d8~ 2 | a4. bes8~ 2 \stopTextSpan |

}

grille = \chordmode {
  \bar "[|:"
 
  \bar ".." }

marques = \relative c' { 
  %   s1 ^\markup \bold \box \fontsize #7 A s1*7 
  %   s1 ^\markup \bold \box \fontsize #7 B s1*7 
  %   s1 ^\markup \bold \box \fontsize #7 A
}


\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #4
  }
  #(define output-suffix "CTab")
 \header { meter = \markup \with-color #red \bold "partition sur 4 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol } \theNotes
        \new Staff \Basse
        >> 
    } 
} }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #2
  }
  #(define output-suffix "BbTab") 
  \header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies } 
        \new Staff \with { instrumentName = \Bb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c d \theNotes
        >> 
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #2
  }
  #(define output-suffix "EbTab")
  \header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c a, \theNotes
        >> 
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #2
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol } 
        \theNotes
        \new Staff \Basse
      >>
} } }

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
        \new Staff \with { instrumentName = \Bb } \transpose c d \theNotes
        \new Staff \Basse  
      >>
} } }

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
        \new Staff \with { instrumentName = \Eb } \transpose c a, \theNotes
        \new Staff \Basse  
      >>
} } }