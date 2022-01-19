
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

title = #"Blues on Sunday"
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
  url = #"https://www.youtube.com/watch?v=SRe1eRD-KM0"
  arranger = \markup \on-the-fly #played?
  \with-url #url
  \with-color #blue \underline
  \concat { "(as played by " \fromproperty #'header:asplayed ")" }
  tagline = ##f
}

\layout {
  \context {
    \Score
    voltaSpannerDuration = #(ly:make-moment 4 4)
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



form = \markup  \fill-line {
  \column {  }
  \column { \line { \with-color #red \fontsize #2 "Solos on AABBA then D.S. al Fine" } }
}

harmonies = \chordmode {
  \set chordChanges = ##t
  es1:7 bes4.:7 es8:7 es2:7 es1*2:7
  as1:7 a:dim7 es1*2:7
  f1:7 bes:7 es2:7 c:7 f:7 bes:7
  es1:7 bes4.:7 es8:7 es2:7 es1*2:7
  as1:7 a:dim7 es1*2:7
  f1:7 bes:7 es1*2:7 
}


theNotes =  \relative c''' {
  \clef "treble" \key es \major \time 4/4
 \override TextSpanner.bound-details.left.text = "break"
  \scoop g4 es8 bes a ges' r4 | as,4 f'8 es r2 \startTextSpan |
  R1 | r4 \stopTextSpan es2~ 8 es,8 | \break
  \acciaccatura b'8 c es r4 r2 | r8 c es ges~ ges es c bes |
  es2 4-. 4-- | \tuplet 3/2 { r g, b } \tuplet 3/2 {  c ges \afterGrace f4 \glissando { \hideNotes ges,8 \unHideNotes } } | \break
  \once \override TextScript #'extra-offset = #'( 0 . -1 ) 
  r2 _"break" r8 a' \tuplet 3/2 { bes es ges } | g es c bes a g' \tuplet 3/2 { as, f' es } |
  r4 r8 fis g c r4 | r2 r4 r8 \scoop g~ \break \bar "||"
  g4 f8 bes, a ges' r4 | as,4 f'8 es r2 \startTextSpan |
  R1 | r4 \stopTextSpan es2~ 8 es,8 | \break
  \acciaccatura b'8 c es r4 r2 | r8 c es ges~ ges es c bes |
  es2 4-. 4-- | \tuplet 3/2 { r4 es e } \tuplet 3/2 {  f fis g } | \break
  r2 r8 f, \tuplet 3/2 { g es' ges } | 
  \override TextSpanner.bound-details.left.text = "solo break"
  \textSpannerDown
  g es c bes a g' \tuplet 3/2 { as, f' es  } |
  R1 \startTextSpan R1 \stopTextSpan
}



Basse = \relative c {
  \clef "bass" \key es \major \time 4/4
 \override TextSpanner.bound-details.left.text = "bass solo"
  \textSpannerDown
  es2 f | bes,4 r r es | 
  r8 bes' \startTextSpan  \tuplet 3/2 { es des bes } a as ges es~ | es4 \stopTextSpan \glissando a,2. |
  as!2 as' | a, a' | 
  bes,2-> as4-. g-- | \tuplet 3/2 { r g b } \tuplet 3/2 {  c ges f4  } 
  R1 | bes2 d | es4. bes'16 b c4 g | f4. b16 a bes4 e, |
  es?2 bes | bes4 bes'8 es, r4 es | r8 bes \startTextSpan  es ges~ ges es c4 | es \stopTextSpan a,2. |
  as!2 as' | a, a' | bes,2-> as4-. g-- | 
  \tuplet 3/2 { r4 es' e, } \tuplet 3/2 {  f fis f~ } |
  f g as a | bes b c d | 
  es r r2 R1 
}

grille = \chordmode {
  \bar "[|:"
 
  \bar ".." }

marques = \relative c' { 
  s1 ^\markup \bold \box \fontsize #7 A s1*7 
  s1 ^\markup \bold \box \fontsize #7 B s1*7 
  s1 ^\markup \bold \box \fontsize #7 A
}


\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #2
  }
  #(define output-suffix "CTab")
  \header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol } \theNotes
        \new Staff \Basse
      >>
    } %\form
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
        \new Staff \with { instrumentName = \Bb } \transpose c d \theNotes
        \new Staff \Basse
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
        \new Staff \with { instrumentName = \Eb } \transpose c a \theNotes
        \new Staff \Basse
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol } \theNotes
        \new Staff \Basse 
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Bba4") 
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies } 
        \new Staff \with { instrumentName = \Bb  } \transpose c d \theNotes
        \new Staff \Basse 
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Eba4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } \transpose c a \theNotes
        \new Staff \Basse 
      >>
} } }