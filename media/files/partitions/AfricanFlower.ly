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

title = #"African Flower"
composer = #"Duke Ellington"
meter = #"(Mod. Slow Latin)"
kwtempo = #"Mod. Slow"
kwstyle = #"Blues"

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
  asplayed = #"Duke Ellington" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=JLyplzFmTcQ"
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

harmonies = \chordmode {
  \set chordChanges = ##f
  \repeat unfold 2 { es1:m7 s s s as:m7 ges:m7 es:m7 s bes:m7 s es:m7 s }
  ges:7+ s2. ges4:7 ces1:7 s ges:7+ s ges:7.11+ s
  as:7 ges:m7 es:m7 s d:7 bes:7 bes:m7 s es:m7
}


theNotes =  \relative c'' {
  \clef "treble" \key des \major \time 4/4
  \mark #1
  as8 bes as bes as2 ~ | % 2
  as1 | % 3
  ges8 as ges as ges2 ~ | % 4
  ges1 | \break % 5
  fes8 ges fes ges fes2 ~ | % 6
  fes1 | % 7
  es8 f es f es2 ~ | % 8
  es1 \break | % 9
  fes8 ges fes ges fes2 ~ |
  fes8 fes ges des'4 ces8
  ~ ces4 | % 11
  es,8 f es f es2 ~ | % 12
  es1 \break \bar "||-[|:"
  \doubleMark
  \markup  { \with-color #red { "To Coda" \raise #1 \musicglyph "scripts.varcoda" } }
  \markup \box A' | % 13
  \repeat volta 2 {
    des'8 ges des ges
    des2 ~ | % 14
    des1 | % 15
    bes8 es bes es
    bes2 ~ | % 16
    bes1 | \break % 17
    es8 ges es ges
    es2 ~ | % 18
    es8 es ges es r
    ges4 es8 | % 19
    bes8 es bes es
    bes2 ~ |
    bes1 \break | % 21
    bes8 es bes es
    bes2 ~ | % 22
    bes8 bes es bes ~
    bes8 es ~ es4 | % 23
    bes8 es bes es
    bes2 ~ | % 24
    bes1 \break \bar "||"
    \doubleMark
    \markup  { \with-color #red { " after 2nd X D.C al Coda" } }
    \markup \box B | % 13
    des'1 | % 26
    des,2. r8 des | % 27
    es1 | % 28
    des'1 | \break % 29
    des1 |
    des,2. r8 des | % 31
    fes1 ~ | % 32
    fes1 \break \bar "||" | % 33
    r4 a,8 ges' ~ ges2 | % 34
    r8 ces,4 as'8 ~ as2 | % 35
    r8 des,4 bes'8 ~ bes2 | % 36
    des2 r8 des4 des8 | \break % 37
    c2 ~ c8 b4 a8 | % 38
    as4. ges fes4 | % 39
    es1 ~ |
    es1  } \break
  \mark \markup  \with-color #red \musicglyph "scripts.varcoda"
  bes'1 bes, es' es, es, \fermata
  \label #'theLastPage
}
theNotesII =  \relative c'' {
  \clef "treble" \key des \major \time 4/4
  R1*12 | % 13
  as8 bes as bes
  as2 ~ | % 14
  as1 | % 15
  ges8 as ges as
  ges2 ~ | % 16
  ges1 | % 17
  as8 bes as bes
  as2 ~ | % 18
  as8 beses des beses r
  des4 beses8 | % 19
  f8 ges f ges f2~ |
  f1 | % 21
  f8 as f as f2 ~
  | % 22
  f8 f as f ~ f
  as8 ~ as4 | % 23
  f8 ges f ges f2 ~ | % 24
  f1 \bar "||"
  bes1 | % 26
  des,2. r8 des' | % 27
  ges,1 | % 28
  ges1 | % 29
  bes1 |
  des,2. r8 des | % 31
  fes1 | % 32
  ges1 | % 33
  r4 a8 ges' ~ ges2 | % 34
  r8 ces,4 as'8 ~ as2 | % 35
  r8 des,4 bes'8 ~ bes2 | % 36
  ges2 r8 des4 des8 | % 37
  c2 ~ c8 b4 a8 | % 38
  as4. ges as4 | % 39
  ges1 ~ |
  ges1
  bes'1 bes, es' es, es, \fermata
}

PianoRH =  \relative c'' {
  \clef "treble" \key des \major \time 4/4 \mark #1
  as8 bes as bes as2 ~ | % 2
  as1 | % 3
  ges8 as ges as ges2 ~ | % 4
  ges1 | % 5
  fes8 ges fes ges fes2 ~ | % 6
  fes1 | % 7
  es8 f es f es2 ~ | % 8
  es1 | \break % 9
  fes8 ges fes ges fes2 ~ |
  fes8 fes ges des'4 ces8 ~ ces4 | % 11
  es,8 f es f es2 ~ | % 12
  es1 \break  \bar "||-[|:"
  \doubleMark
  \markup  { \with-color #red { "To Coda" \raise #1 \musicglyph "scripts.varcoda" } }
  \markup \box A' | % 13
  \repeat volta 2 {  | % 13
                     <as des>8 <bes ges'> <as des> <bes ges'>8 <as des>2 ~ | % 14
                     <as des>1 | % 15
                     <ges bes>8 <as es'> <ges bes> <as es'>8 <ges bes>2 ~ | % 16
                     <ges bes>1 \break
                     <as es'>8 <bes ges'> <as es'> <bes ges'>8 <as es'>2 ~ | % 18
                     <as es'>8 <beses es> <des ges> <beses es>8 r <des ges>4 <beses es>8 | % 19
                     <f bes>8 <ges es'> <f bes>  <ges es'>8 <f bes>2 ~ |
                     <f bes>1 \break | % 21
                     <f bes>8 <as es'> <f bes>  <as es'>8 <f bes>2 ~ | % 22
                     <f bes>8 <f bes> <as es'> <f bes>8 ~ <f bes> <as es'> ~ <as es'>4 | % 23
                     <f bes>8 <ges es'> <f bes> <ges es'>8 <f bes>2 ~ | % 24
                     <f bes>1 \pageBreak
                     \doubleMark
                     \markup  { \with-color #red { " after 2nd X D.C al Coda" } }
                     \markup \box B
                     <bes des'>1 | % 26
                     <des, des'>2. r8 des' | % 27
                     <ges, beses es>1 | % 28
                     <ges'' beses des>1 \break | % 29
                     <bes,, des'>1 |
                     <des, des'>2. r8 des' | % 31
                     <e bes' e>1 | % 32
                     <ges' bes fes'>1 \break | % 33
                     r4 a,,8 ges' ~ ges2 | % 34
                     r8 ces,4 as'8 ~ as2 | % 35
                     r8 des,4 bes'8 ~ bes2 | % 36
                     <ges' bes des>2 r8 <des, bes' des>4 q8 | \break % 37
                     <c a' c>2 ~ <c a' c>8 <b as' b>4 <a ges' a>8 | % 38
                     <as f' as>4. <ges es' ges> <fes as des fes>4 | % 39
                     <es ges bes es>1 |
                     R1 } \break % 41
  \mark \markup  \with-color #red \musicglyph "scripts.varcoda"
  <bes' bes'>1 <bes, bes'> <es' es'> <es, es'> <es, es'> \fermata
  \label #'theLastPage
}
chordsRhythm = \relative c' {
  \override Rest #'staff-position = #7
  \improvisationOn \override NoteHead.no-ledgers = ##t
  % \partial 8
  % \showStartRepeatBar \bar "[|:"


}

Basse = \relative c, {
  \clef "bass" \key des \major \time 4/4 \mark #1
  % \partial 8
  % \showStartRepeatBar \bar "[|:"
  es8 bes'4 ges'8 ~ ges bes,4 8 | % 2
  es,8 bes'4 ges'8 ~ ges bes,4 8 | % 3
  ges8 des'4 bes'8 ~ bes des,4 8 | % 4
  ges,8 des'4 bes'8 ~ bes des,4 8 \break | % 5
  as8 es'4 ces'8 ~ ces es,4 8 | % 6
  ges,8 des'4 beses'8 ~ beses des,4 8 | % 7
  es,8 bes'4 ges'8 ~ ges bes,4 8 | % 8
  es,8 bes'4 ges'8 ~ ges bes,4 8  \break | % 9
  bes8 f'4 as8 ~ as f4 des8 |
  bes8 f'4 bes8 ~ bes as4 f8 | % 11
  es,8 bes'4 ges'8 ~ ges bes,4 8 | % 12
  es,8 bes'4 ges'8 ~ ges bes,4 8
  \break  \bar "||-[|:"
  \doubleMark
  \markup  { \with-color #red { "To Coda" \raise #1 \musicglyph "scripts.varcoda" } }
  \markup \box A' | % 13
  \repeat volta 2 {
    es,8 bes'4 ges'8 ~ ges bes,4 8 | % 14
    es,8 bes'4 ges'8 ~ ges bes,4 8 | % 15
    ges8 des'4 bes'8 ~ bes des,8 ~ des des | % 16
    ges,8 des'4 bes'8 ~ bes des,8 ~ des des  | \break % 17
    as8 es'4 ces'8 ~ ces es,4 8 | % 18
    ges,8 des'4 beses'8 ~ beses des,8 ~ des bes | % 19
    es,8 bes'4 ges'8 ~ ges bes,4 8 |
    es,8 bes'4 ges'8 ~ ges bes,4 8 \break | % 21
    bes8 f'4 as8 ~ as  f4 8 | % 22
    bes,8 f'4 as8 ~ as f4 8 | % 23
    es,8 bes'4 ges'8 ~ ges bes,4 8 | % 24
    es,8 bes'4 ges'8 ~ ges bes,8 ~ bes4 \bar "||" \break
    \doubleMark
    \markup  { \with-color #red { " after 2nd X D.C al Coda" } }
    \markup \box B
    ges8 des'4 bes'8 ~ bes des,4 8 | % 26
    ges,8 des'4 bes'8 ~ bes des,4 8 | % 27
    ces8 es4 beses'8 ~ beses ges4 des8 | % 28
    ces8 es4 beses'8 ~ beses ges4 des8 | \break % 29
    ges,8 des'4 bes'8 ~ bes des,4 8 |
    ges,8 des'4 bes'8 ~ bes des,4 8 | % 31
    ges,8 des'4 fes8 ~ fes des4 8 | % 32
    ges,8 des'4 fes8 ~ fes des4 8 \break | % 33
    as8 es'4 ces'8 ~ ces es,4 8 | % 34
    ges,8 des'4 beses'8 ~ beses des,4 8 | % 35
    es,8 bes'4 ges'8 ~ ges bes,4 8 | % 36
    es,8 bes'4 ges'8 ~ ges bes,4 8 | \break % 37
    d,8 a'4 fis'8 ~ fis a,4 8 | % 38
    bes8 f'4 as8 ~ as  bes,4 8 | % 39
    es,8 bes'4 ges'8 ~ ges bes,4 8 |
    es,1 \break }
  \mark \markup  \with-color #red \musicglyph "scripts.varcoda"
  es8 bes'4 ges'8 ~ ges bes,4 8 | % 2
  es,8 bes'4 ges'8 ~ ges bes,4 8 | % 3
  ges8 des'4 bes'8 ~ bes des,8 ~ des des | % 4
  ges,8 des'4 bes'8 ~ bes des,8 ~ des des | % 5
  es,1 \fermata

  \bar ".."

}

grille = \chordmode {
  \mark #1
  \bar "[|:" \repeat percent 4 { es:m7 } \break
  as:m7 ges:m7 \repeat percent 2 { es:m7 } \break
  \repeat percent 2 { bes:m7 } \repeat percent 2 { es:m7 }
  \bar ":|]" \break \mark #2
ges:7+ ges2.:7+ ges4:7 \repeat percent 2 { ces1:7 } \break
\repeat percent 2 { ges:7+ } \repeat percent 2 {  ges:7.11+ } \break
  as:7 ges:m7 \repeat percent 2 { es:m7 } \break
  d:7 bes:7 \repeat percent 2 { bes:m7 } \bar ".."
  \label #'theLastPage
}



\book {
  \paper {
    #(set-paper-size "a5landscape")
    %page-count = #1
    print-first-page-number = ##t
  }
  #(define output-suffix "CTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
   \score {
      <<
        \new ChordNames { \harmonies }
        \new StaffGroup <<
          \new Staff \with { instrumentName = \CleSol } \theNotes
          \new Staff \theNotesII
      >> >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "a5landscape")
    %page-count = #1
    print-first-page-number = ##t
  }
  #(define output-suffix "BbTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
 \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new StaffGroup <<
          \new Staff \with { instrumentName = \CleSol } \transpose c d \theNotes
          \new Staff \transpose c d \theNotesII
      >> >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "a5landscape")
    page-count = #3
    print-first-page-number = ##t
  }
  #(define output-suffix "EbTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
 \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new StaffGroup <<
          \new Staff \with { instrumentName = \CleSol } \transpose c a, \theNotes
          \new Staff \transpose c a, \theNotesII
      >> >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "a4")
    %page-count = #1
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new StaffGroup <<
          \new Staff \with { instrumentName = \CleSol } \theNotes
          \new Staff \theNotesII
      >> >>
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
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new StaffGroup <<
          \new Staff \with { instrumentName = \CleSol } \transpose c d \theNotes
          \new Staff \transpose c d \theNotesII
      >> >>
    } %\form
    %}  \bookpart {
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
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new StaffGroup <<
          \new Staff \with { instrumentName = \CleSol } \transpose c a, \theNotes
          \new Staff \transpose c a, \theNotesII
      >> >>
    } %\form
    %}  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \transpose c a \grille
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    %page-count = #1
    print-first-page-number = ##t
  }
  #(define output-suffix "Pianoa4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new PianoStaff  \with { instrumentName = Piano } <<
          \new Staff \PianoRH
          \new Staff \transpose c c, \Basse
      >> >>
} } }

\book {
  \paper {
    #(set-paper-size "a5landscape")
    %page-count = #1
    print-first-page-number = ##t
  }
  #(define output-suffix "PianoTab")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new PianoStaff  \with { instrumentName = Piano } <<
          \new Staff \PianoRH
          \new Staff \transpose c c' \Basse
      >> >>
} } }


\book {
  \paper {
    #(set-paper-size "a4")
    %page-count = #1
  }
  #(define output-suffix "Bassa4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleFa } \Basse
      >>
    }
  }  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \grille
} } }
\book {
  \paper {
    #(set-paper-size "a5landscape")
    %page-count = #1
    print-first-page-number = ##t
  }
  #(define output-suffix "BassTab")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleFa } { \Basse \label #'theLastPage }
      >>
} } }