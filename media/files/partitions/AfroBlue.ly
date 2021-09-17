
\version "2.22.0"
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

title = #"Afro Blue"
composer = #"Mongo Santamaria"
meter = #"(Med. Jazz Waltz)"
kwtempo = #"Med. Fast"
kwstyle = #"Afro-Jazz Waltz"

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
  asplayed = #"John Coltrane" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=HIH3fNUsbnA"
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



formC = \markup  \fill-line {
  \column { \line { \with-color #red \fontsize #2 { "Open Solos on" \sans \fontsize #-2 \concat { "Fm"  \super"7" }  "or 3/4 minor blues in" \sans \fontsize #-2 "Fm" } } }
}

formBb = \markup  \fill-line {
  \column { \line { \with-color #red \fontsize #2 { "Open Solos on" \sans \concat \fontsize #-2 { "Gm" \super"7" }  "or 3/4 minor blues in"\sans \fontsize #-2 "Gm" } } }
}

formEb = \markup  \fill-line {
  \column { \line { \with-color #red \fontsize #2 { "Open Solos on" \sans \fontsize #-2 \concat { "Dm"  \super"7" }  "or 3/4 minor blues in"  \sans \fontsize #-2 "Dm" } } }
}

harmonies = \chordmode {
  \set chordChanges = ##f
 f2.:m7 g:m7 as4.:7+ g:m7 f2.:m7
 f2.:m7 g:m7 as4.:7+ g:m7 f2.:m7
 es s des4. es f2.:m7
 es s des4. es f2.:m7
 s2.*16 f2.:m7
 f2.:m7 g:m7 as4.:7+ g:m7 f2.:m7
 f2.:m7 g:m7 as4.:7+ g:m7 f2.:m7
 es s des4. es f2.:m7
 es s des4. es f2.:m7
}


theNotes =  \relative c' {
  \clef "treble" \key as \major \time 3/4
  \showStartRepeatBar \bar "[|:"
  \repeat volta 2 {
    f4 c'4. as8 | bes4 bes2 | as4. bes | f2 r8 c
    f4 c'4. as8 | bes4 bes2 | as4. bes | f2. \break
    es4 es g | es2. | des 4. es4. | f2.
    es4 es g | es2. | des 4. as'4. }
  \alternative {
    { f2. \bar "||" 
      \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
      \mark \markup \smaller "  (Piano Solo)" \inlineMMRN R2.*16 }
    { f2 f8 as \bar "||" \break }
  }

  c8 c c es r des | c4 r f,8 as |
  bes bes bes as r g | f4 r f8 as \break
  c c c es r des | c c c bes r bes 
  as as as g r es | f4 r r \bar "||" \break

  es4 es g | es2. | des 4. es4. | f2.
  es4 es g | es2. | des 4. as'4. | f2.
  \bar "|."
}





\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "CTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \theNotes
        >> 
      >>
    } \formC
} }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "BbTab") 
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies } 
        \new Staff \with { instrumentName = \Bb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c d \theNotes
        >> 
      >>
    } \formBb
} }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "EbTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c a \theNotes
        >> 
      >>
    } \formEb
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
        \new Staff \with { instrumentName = \CleSol } 
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \theNotes
        >> 
      >>
    } \formC
    %}  \bookpart {
 } }

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
        \new Staff \with { instrumentName = \Bb  } <<
          % \new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c d \theNotes
        >> 
      >>
    } \formBb
    %}  \bookpart {
} }

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
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice  
          \transpose c a \theNotes
        >> 
      >>
    } \formEb
} }

